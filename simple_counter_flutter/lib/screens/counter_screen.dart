import 'package:flutter/material.dart';
import 'package:simple_counter_flutter/dartBean/counter_item.dart';
import 'package:simple_counter_flutter/theme/widgets/theme_switcher.dart';

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final List<CounterItem> _counters = [
    CounterItem(name: '项目1', count: 0),
    CounterItem(name: '项目2', count: 0),
    CounterItem(name: '项目3', count: 0),
  ];

  void _addCounter() {
    setState(() {
      _counters.add(CounterItem(name: '项目${_counters.length + 1}', count: 0));
    });
  }

  void _removeCounter(int index) {
    setState(() {
      _counters.removeAt(index);
    });
  }

  void _incrementCounter(int index) {
    setState(() {
      _counters[index].count++;
    });
  }

  void _decrementCounter(int index) {
    setState(() {
      if (_counters[index].count > 0) {
        _counters[index].count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Linの計數器'),
        actions: <Widget>[
          ThemeSwitcher(),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/settings');
            },
            icon: Icon(Icons.settings),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: ListView.builder(
        itemCount: _counters.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_counters[index].name, style: TextStyle(fontSize: 18)),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () => _decrementCounter(index),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          '${_counters[index].count}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => _incrementCounter(index),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _removeCounter(index),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addCounter,
        tooltip: '添加计数器',
        child: Icon(Icons.add),
      ),
    );
  }
}
