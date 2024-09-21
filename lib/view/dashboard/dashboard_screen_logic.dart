import 'package:dealse/view/dashboard/DrawerItemList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardLogic extends GetxController {
  RxList<DrawerItemList> items = [
    DrawerItemList(title: "My Visits", isSelected: true, iconName: Icons.home),
    DrawerItemList(title: "Manage Offers", isSelected: false, iconName: Icons.feed),
    DrawerItemList(title: "History", isSelected: false, iconName: Icons.hourglass_bottom_rounded),
    DrawerItemList(title: "Notification", isSelected: false, iconName: Icons.notifications),
    DrawerItemList(title: "Manage Store", isSelected: false, iconName: Icons.storefront_sharp),
    DrawerItemList(title: "Logout", isSelected: false, iconName: Icons.logout),
  ].obs;

  TextEditingController couponCode = TextEditingController();

  void setItemSelected(int index){
    items[index].isSelected = true;
    for (var element in items) {
      if(items.indexOf(element) == index){
        element.isSelected = true;
      }
      else{
        element.isSelected = false;
      }
    };
  }
}
