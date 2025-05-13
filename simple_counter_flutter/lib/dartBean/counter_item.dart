import 'package:flutter/material.dart';

class CounterItem {
  //  计数器名称
  String name;
  //  计数器备注
  String? desc;
  //  计数器保存的数值
  double count;
  //  计数器的图标
  Icon? icon;
  //  计数器的子项目
  List<CounterItem>? children = <CounterItem>[];
  //  步进，默认为1
  double? step;

  CounterItem({
    required this.name,
    required this.count,
    String? desc = '',
    this.icon = const Icon(Icons.tag),
    this.step = 1,
  });
}
