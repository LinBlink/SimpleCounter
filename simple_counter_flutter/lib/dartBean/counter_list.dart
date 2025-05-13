import 'package:simple_counter_flutter/dartBean/counter_item.dart';

class CounterList {
  //  列表名称
  String listName;
  List<CounterItem>? counterItems;

  CounterList({required this.listName, List<CounterItem>? counterItems})
    : counterItems = counterItems ?? <CounterItem>[];
}
