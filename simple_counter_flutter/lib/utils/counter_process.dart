import 'package:simple_counter_flutter/dartBean/counter_item.dart';
import 'package:simple_counter_flutter/screens/settings_screen/settings_config.dart';

enum OperateTypes { inc, dec, del, add }

class CounterProcess {
  
  static void counterOperate(
    int index,
    OperateTypes operateType,
    List<CounterItem> counterList,
  ) {
    switch (operateType) {
      // 增加
      case OperateTypes.inc:
        counterList[index].count += counterList[index].step!;
        break;
      case OperateTypes.dec:
        counterList[index].count -= counterList[index].step!;
        break;
      case OperateTypes.del:
        counterList.removeAt(index);
      case OperateTypes.add:
        counterList.add(
          CounterItem(
            name: SettingsConfig.defaultName,
            step: SettingsConfig.defaultStep,
            count: 0,
          ),
        );
    }
    ;
  }
}
