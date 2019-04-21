import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_fruit/styles.dart';
import 'package:flutter_fruit/widgets/setting_item.dart';

class SettingScreen extends StatelessWidget {
  Widget _buildCaloriesItem(BuildContext context) {
    return SettingItem(
        label: 'Calorie Target',
        icon: SettingIcon(
          icon: Styles.calorieIcon,
          backgroundColor: Styles.iconBlue,
        ));
  }

  Widget _buildCategoriesItem(BuildContext context) {
    return SettingItem(
        label: "Preferred Categories",
        subtitle: "What types of veggies you perfer!",
        icon: SettingIcon(
          icon: Styles.preferenceIcon,
          backgroundColor: Styles.iconGold,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Container(
      color: Styles.scaffoldBackground,
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text("Settings"),
          ),
          SliverSafeArea(
              sliver: SliverList(
                  delegate: SliverChildListDelegate(<Widget>[
            _buildCaloriesItem(context),
            _buildCategoriesItem(context),
          ])))
        ],
      ),
    ));
  }
}
