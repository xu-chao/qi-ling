/// This is Title Widge, it resides on the Left-Top Section.

import 'package:flutter/material.dart';

import '../main.dart';

Widget titleWidget() {
  return AnimatedContainer(
    // Top Left Widget: Title
    duration: normal,
    height: leftActive ? rCollapsed : 0,
    width: leftActive ? lExpanded : lCollapsed,
    padding: const EdgeInsets.symmetric(horizontal: 40),
    alignment: Alignment.centerLeft,
    child: AnimatedOpacity(
      duration: fast,
      opacity: leftActive ? 1 : 0,
      child: const Text(
        '祈·聆',
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
      ),
    ),
  );
}
