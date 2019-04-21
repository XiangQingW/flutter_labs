import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_fruit/styles.dart';
import 'package:flutter/cupertino.dart';

typedef SettingsItemCallback = FutureOr<void> Function();

class SettingIcon extends StatelessWidget {
  const SettingIcon(
      {@required this.icon,
      this.backgroundColor = CupertinoColors.black,
      this.foregroundColor = CupertinoColors.white,
      Key key})
      : assert(icon != null),
        super(key: key);

  final Color backgroundColor;
  final Color foregroundColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: backgroundColor),
      child: Center(
        child: Icon(icon, color: foregroundColor, size: 20.0),
      ),
    );
  }
}

class SettingItem extends StatefulWidget {
  SettingItem(
      {@required this.label,
      this.icon,
      this.content,
      this.subtitle,
      this.onPress,
      Key key})
      : assert(label != null),
        super(key: key);

  final String label;
  final Widget icon;
  final Widget content;
  final String subtitle;
  final SettingsItemCallback onPress;

  @override
  State<StatefulWidget> createState() {
    return SettingItemState();
  }
}

class SettingItemState extends State<SettingItem> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    List<Widget> rowChildren = [];

    if (widget.icon != null) {
      rowChildren.add(Padding(
        padding: EdgeInsets.only(left: 15.0, bottom: 2.0),
        child: SizedBox(
          height: 29.0,
          width: 29.0,
          child: widget.icon,
        ),
      ));
    }

    Widget titleSection;
    if (widget.subtitle == null) {
      titleSection = Padding(
        padding: EdgeInsets.only(top: 1.5),
        child: Text(widget.label),
      );
    } else {
      titleSection = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 8.5),
          Text(widget.label),
          SizedBox(height: 4.0),
          Text(
            widget.subtitle,
            style: TextStyle(fontSize: 12.0, letterSpacing: -0.2),
          )
        ],
      );
    }

    rowChildren.add(Expanded(
        child: Padding(
            padding: EdgeInsets.only(left: 15.0), child: titleSection)));

    rowChildren.add(Padding(
      padding: EdgeInsets.only(right: 11.0),
      child: widget.content ?? Container(),
    ));

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      color: pressed ? Styles.settingsItemPressed : Styles.transparentColor,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () async {
          if (widget.onPress == null) {
            return;
          }

          setState(() {
            pressed = true;
          });
          await widget.onPress();

          Future.delayed(Duration(milliseconds: 150), () {
            setState(() {
              pressed = false;
            });
          });
        },
        child: SizedBox(
          height: widget.subtitle == null ? 44.0 : 57.0,
          child: Row(
            children: rowChildren,
          ),
        ),
      ),
    );
  }
}
