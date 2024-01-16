/// Category DataBase
import 'package:flutter/material.dart';

List<_CategoryData> database = [
  _CategoryData(
    categoryIcon: Icon(IconData(0xe80a, fontFamily: 'CategoryIcons')),
    categoryTitle: '雨声',
    categoryTag: '沉浸·烟雨江南',
    categoryInfo:
        '一组来自自然界的白噪声，沉浸其中，更好入眠。',
    imagePath: 'assets/images/cover_rain.jpg',
    audioList: [
      _AudioData(
        audioTitle: '撕裂·心潮澎湃',
        audioLength: 72,
        audioImagePath: 'assets/images/rain_01.jpg',
      ),
      _AudioData(
        audioTitle: '鸣叫·夏日叶蝉',
        audioLength: 104,
        audioImagePath: 'assets/images/rain_02.jpg',
      ),
      _AudioData(
        audioTitle: '泪水·喜极而泣',
        audioLength: 72,
        audioImagePath: 'assets/images/rain_03.jpg',
      ),
    ],
  ),
  _CategoryData(
    categoryIcon: Icon(IconData(0xe806, fontFamily: 'CategoryIcons')),
    categoryTitle: '森林',
    categoryTag: '身处神奇的森林',
    categoryInfo:
        '一组来自自然界的白噪声，沉浸其中，更好入眠。',
    imagePath: 'assets/images/cover_forest.jpg',
    audioList: [
      _AudioData(
        audioTitle: '塞北的风声',
        audioLength: 72,
        audioImagePath: 'assets/images/forest_01.jpg',
      ),
      _AudioData(
        audioTitle: '昆虫的叫声',
        audioLength: 104,
        audioImagePath: 'assets/images/forest_02.jpg',
      ),
      _AudioData(
        audioTitle: '家雀的旋律',
        audioLength: 72,
        audioImagePath: 'assets/images/forest_03.jpg',
      ),
      _AudioData(
        audioTitle: '优美的音乐',
        audioLength: 72,
        audioImagePath: 'assets/images/forest_04.jpg',
      ),
    ],
  ),
  _CategoryData(
    categoryIcon: Icon(IconData(0xe808, fontFamily: 'CategoryIcons')),
    categoryTitle: '大自然',
    categoryTag: '母亲的存在之美',
    categoryInfo:
        '一组来自自然界的白噪声，沉浸其中，更好入眠。',
    imagePath: 'assets/images/cover_natural.jpg',
    audioList: [
      _AudioData(
        audioTitle: '沉默的石头',
        audioLength: 72,
        audioImagePath: 'assets/images/natural_01.jpg',
      ),
      _AudioData(
        audioTitle: '孤独的母亲',
        audioLength: 104,
        audioImagePath: 'assets/images/natural_02.jpg',
      ),
      _AudioData(
        audioTitle: '极光的闪耀',
        audioLength: 72,
        audioImagePath: 'assets/images/natural_03.jpg',
      ),
      _AudioData(
        audioTitle: '冷静的心情',
        audioLength: 104,
        audioImagePath: 'assets/images/natural_04.jpg',
      ),
      _AudioData(
        audioTitle: '洞穴的呼唤',
        audioLength: 72,
        audioImagePath: 'assets/images/natural_05.jpg',
      ),
    ],
  ),
  _CategoryData(
    categoryIcon: Icon(IconData(0xe805, fontFamily: 'CategoryIcons')),
    categoryTitle: '节奏',
    categoryTag: '节奏',
    categoryInfo:
        '一组来自自然界的白噪声，沉浸其中，更好入眠。',
    imagePath: 'assets/images/cover_flow.jpg',
    audioList: [
      _AudioData(
        audioTitle: '潺潺的水声',
        audioLength: 72,
        audioImagePath: 'assets/images/flow_01.jpg',
      ),
      _AudioData(
        audioTitle: '跟随的节奏',
        audioLength: 104,
        audioImagePath: 'assets/images/flow_02.jpg',
      ),
      _AudioData(
        audioTitle: '融化我的心',
        audioLength: 72,
        audioImagePath: 'assets/images/flow_03.jpg',
      ),
      _AudioData(
        audioTitle: '鹅卵石的声音',
        audioLength: 72,
        audioImagePath: 'assets/images/flow_04.jpg',
      ),
    ],
  ),
  _CategoryData(
    categoryIcon: Icon(IconData(0xe809, fontFamily: 'CategoryIcons')),
    categoryTitle: '其他',
    categoryTag: '正如你的心所说',
    categoryInfo:
        '一组来自自然界的白噪声，沉浸其中，更好入眠。',
    imagePath: 'assets/images/cover_other.jpg',
    audioList: [
      _AudioData(
        audioTitle: '塞北的风声',
        audioLength: 72,
        audioImagePath: 'assets/images/other_01.jpg',
      ),
      _AudioData(
        audioTitle: '昆虫的叫声',
        audioLength: 104,
        audioImagePath: 'assets/images/other_02.jpg',
      ),
      _AudioData(
        audioTitle: '家雀的旋律',
        audioLength: 72,
        audioImagePath: 'assets/images/other_03.jpg',
      ),
    ],
  )
];

class _CategoryData {
  final String categoryTitle;
  final String categoryTag;
  final String imagePath;
  final String categoryInfo;
  final List<_AudioData> audioList;
  final Icon categoryIcon;

  _CategoryData({
    required this.categoryTitle,
    required this.categoryTag,
    required this.imagePath,
    required this.categoryInfo,
    required this.audioList,
    required this.categoryIcon,
  });
}

class _AudioData {
  final String audioTitle;
  final int audioLength;
  final String audioImagePath;

  _AudioData({
    required this.audioTitle,
    required this.audioLength,
    required this.audioImagePath,
  });
}
