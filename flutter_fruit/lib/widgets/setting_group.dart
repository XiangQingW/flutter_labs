import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_fruit/widgets/setting_item.dart';
import 'package:flutter_fruit/styles.dart';

class SettingGroup extends StatelessWidget {
  SettingGroup({@required this.items, this.header, this.footer})
      : assert(items != null),
        assert(items.length > 0);

  final List<SettingItem> items;
  final Widget header;
  final Widget footer;

  @override
  Widget build(BuildContext context) {
    final dividedItems = <Widget>[items[0]];
    for (int i =  1; i < items.length; i ++) {
      dividedItems.add(Container(
        color: Styles.settingsLineation,
        height: 0.3,
      ));
      dividedItems.add(items[i]);
    }

    final List<Widget> columnChildren = [];

    if (header != null) {
      columnChildren.add(header);
    }

    columnChildren.add(
      Container(
        decoration: BoxDecoration(
          color: CupertinoColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: dividedItems
        ),
      )
    );

    if (footer != null) {
      columnChildren.add(footer);
    }

    return Padding(
      padding: EdgeInsets.only(
        top: header == null ? 35.0 : 22.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: columnChildren
      ),
    );
  }
}
