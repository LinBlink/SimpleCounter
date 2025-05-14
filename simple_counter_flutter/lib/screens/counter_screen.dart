import 'package:flutter/material.dart';
import 'package:simple_counter_flutter/dartBean/counter_item.dart';
import 'package:simple_counter_flutter/screens/settings_screen/settings_config.dart';
import 'package:simple_counter_flutter/theme/widgets/theme_switcher.dart';
import 'package:simple_counter_flutter/utils/counter_process.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final List<CounterItem> _counters = [
    CounterItem(name: '背单词天数📚', count: 0)
      ..children = [
        CounterItem(name: '四级单词个数', count: 0),
        CounterItem(name: '四级短语个数', count: 0),
      ],
    CounterItem(name: '健身天数💪', count: 0),
    CounterItem(name: '给女朋友买束花🌸', count: 0),
  ];

  void _counterOperate(
    int index,
    OperateTypes operateType,
    List<CounterItem> counterList,
  ) {
    setState(() {
      CounterProcess.counterOperate(index, operateType, counterList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('林の簡易計數器 ', style: TextStyle(color: Colors.deepPurple)),
            Text(
              'SimpleCounter',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
                fontSize: 17,
                textBaseline: TextBaseline.alphabetic,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          ThemeSwitcher(),
          IconButton(onPressed: () {}, icon: Icon(Icons.cloud_upload)),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/settings');
            },
            icon: Icon(Icons.settings),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: ListView(
        children: [_buildCounterList(_counters, null), SizedBox(height: 90)],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counterOperate(0, OperateTypes.add, _counters);
        },
        tooltip: '添加计数器',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildCounterList(List<CounterItem> counters, CounterItem? parent) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: counters.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: ExpansionTile(
              showTrailingIcon: false,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _counters[index].icon ?? SizedBox.shrink(),

                      SizedBox(
                        width: 200,
                        child: TextField(
                          controller: TextEditingController(
                            text: counters[index].name.toString(),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                            hintText: "新项目",
                            contentPadding: EdgeInsets.symmetric(vertical: 8),
                          ),
                          onChanged: (value) {
                            counters[index].name = value;
                          },
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("步长"),
                        SizedBox(width: 10),
                        SizedBox(
                          width: 60,
                          child: TextField(
                            controller: TextEditingController(
                              text: counters[index].step.toString(),
                            ),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(vertical: 8),
                            ),
                            onChanged: (value) {
                              counters[index].step = double.parse(value);
                            },
                          ),
                        ),

                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed:
                              () => _counterOperate(
                                index,
                                OperateTypes.dec,
                                counters,
                              ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            '${counters[index].count}',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed:
                              () => _counterOperate(
                                index,
                                OperateTypes.inc,
                                counters,
                              ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed:
                              () => _counterOperate(
                                index,
                                OperateTypes.del,
                                counters,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              children: [
                if (counters[index].children!.isNotEmpty)
                  _buildCounterList(counters[index].children!, counters[index])
                else
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text('没有子项目'),
                  ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      _counterOperate(
                        0,
                        OperateTypes.add,
                        counters[index].children!,
                      );
                    },
                    icon: Icon(Icons.add_box),
                    tooltip: "新项目",
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
