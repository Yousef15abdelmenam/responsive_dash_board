import 'package:flutter/material.dart';
import 'package:responsive_dash_board/models/drawer_item_model.dart';
import 'package:responsive_dash_board/utils/app_images.dart';
import 'package:responsive_dash_board/widgets/drawer_item.dart';

class DrawerItemsListView extends StatefulWidget {
  const DrawerItemsListView({
    super.key,
  });

  @override
  State<DrawerItemsListView> createState() => _DrawerItemsListViewState();
}

class _DrawerItemsListViewState extends State<DrawerItemsListView> {
  int activeIndex = 0;

  final List<DrawerItemModel> items = const [
    DrawerItemModel(image: Assets.assetsImagesDashboard, title: 'Dashboard'),
    DrawerItemModel(
        image: Assets.assetsImagesTransaction, title: 'My Transaction'),
    DrawerItemModel(image: Assets.assetsImagesStatistics, title: 'Statistics'),
    DrawerItemModel(image: Assets.assetsImagesWallet, title: 'Wallet Account'),
    DrawerItemModel(
        image: Assets.assetsImagesInvestments, title: 'My Investments'),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if (activeIndex != index) {
              setState(() {
                activeIndex = index;
                print(activeIndex);
              });
            }
          },
          child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: DrawerItem(
                drawerItemModel: items[index],
                isActive: activeIndex == index,
              )),
        );
      },
      itemCount: items.length,
    );
  }
}
