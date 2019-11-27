import 'package:flutter/material.dart';

class TabsModel {
  String name;
  Widget myTab;
  Widget tabBody;

  TabsModel(
      {@required this.name, @required this.myTab, @required this.tabBody});
}
