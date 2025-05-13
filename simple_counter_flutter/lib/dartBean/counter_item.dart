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
  List<CounterItem>? children;
  //  步进，默认为1
  double? step;

  CounterItem({
    required this.name,
    required this.count,
    String? desc = '',
    Icon? icon,
    List<CounterItem>? children,
    double? step = 1,
  }) : icon = icon ?? Icon(Icons.tag),
       children = children ?? <CounterItem>[];
}
