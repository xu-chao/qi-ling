/// This widget carries a list of Categories & is placed on Right-Middle Section.

import 'package:flutter/material.dart';

import '../data/category_database.dart';
import '../main.dart';
import './category_card_collapsed.dart';
import 'category_card.dart';

Widget categoryList({required int activeIndex}) {
  return AnimatedContainer(
    duration: normal,
    height: rMidExpanded,
    width: leftActive ? rCollapsed : rExpanded,
    child: FutureBuilder(
      initialData: const SizedBox(width: 0.0, height: 0.0),
      future: leftActive
          ? categoryCollapsedList(activeIndex: activeIndex)
          : categoryExpandedList(activeIndex: activeIndex),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.data;
      },
    ),
  );
}

Future<Widget> categoryExpandedList({required int activeIndex}) async {
  await Future.delayed(fast);
  return ListView.builder(
    padding: const EdgeInsets.only(top: 0),
    physics: const BouncingScrollPhysics(),
    itemCount: database.length,
    itemBuilder: (BuildContext context, int index) {
      return Column(
        children: <Widget>[
          CategoryCard(
            index: index,
            activeIndex: activeIndex,
            categoryTitle: database[index].categoryTitle.toUpperCase(),
            categoryTag: database[index].categoryTag,
            imagePath: database[index].imagePath,
            totalItems: database[index].audioList.length,
            categoryInfo: database[index].categoryInfo,
          ),
          const SizedBox(height: 40),
        ],
      );
    },
  );
}

Future<Widget> categoryCollapsedList({required int activeIndex}) async {
  await Future.delayed(fast);
  return ListView.builder(
    padding: EdgeInsets.zero,
    physics: const BouncingScrollPhysics(),
    itemCount: database.length,
    itemBuilder: (BuildContext context, int index) {
      return Column(
        children: <Widget>[
          categoryCardCollapsed(
            index: index,
            activeIndex: activeIndex,
            categoryTitle: database[index].categoryTitle,
          ),
          SizedBox(height: index == (database.length - 1) ? 20 : 50),
        ],
      );
    },
  );
}
