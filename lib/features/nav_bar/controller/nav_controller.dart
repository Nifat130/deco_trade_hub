
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/constants/icon_path.dart';

class NavController extends GetxController {
  final _selectedIndex = 0.obs;

  int get currentIndex => _selectedIndex.value;

  void changeIndex(int index) {
    if (kDebugMode) {
      print("Changing index to $index");
    }
    _selectedIndex.value = index;
  }

  final List<Widget> screens =  [
  ];

  final List<String> labels = const ['Home', 'Mahin Wall', 'Tools', 'Connectivity','Profile'];

  final List<String> iconPaths = [
    IconPath.home,
    IconPath.memory,
    IconPath.tools,
    IconPath.connectivity,
    IconPath.profile,
  ];
}
