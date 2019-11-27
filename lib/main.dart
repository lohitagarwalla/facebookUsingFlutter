import 'package:flutter/material.dart';
import 'tabs_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'tab_list.dart';

Color appColor = Colors.blue; //todo pic a better color at the end

TabList t = TabList();
List<TabsModel> tabList = t.tabList;

class TabIcon extends StatelessWidget {
  final IconData icon;
  final String text;

  TabIcon({this.icon, this.text});
  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: SizedBox(
        width: 50.0,
        child: Stack(
          children: <Widget>[
            Center(
              child: Icon(
                icon,
                size: 30.0,
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              text == '0'
                  ? Container()
                  : CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 8,
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 12.5, color: Colors.white),
                      ),
                    ),
            ])
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MainCollapsingToolbar());

class MainCollapsingToolbar extends StatefulWidget {
  @override
  _MainCollapsingToolbarState createState() => _MainCollapsingToolbarState();
}

class _MainCollapsingToolbarState extends State<MainCollapsingToolbar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: DefaultTabController(
              length: tabList.length,
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      pinned: false,
                      flexibleSpace: AppBar(
                        elevation: 0,
                        backgroundColor: Colors.white,
                        title: Text(
                          'facebook',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: appColor,
                            fontSize: 35.0,
                          ),
                        ),
                        actions: <Widget>[
                          TopIconButtons(icon: FontAwesomeIcons.search),
                          TopIconButtons(
                            icon: FontAwesomeIcons.facebookMessenger,
                          ),
                        ],
                      ),
                    ),
                    SliverAppBar(
                      forceElevated: true,
                      elevation: 0.6,
                      backgroundColor: Colors.white,
                      pinned: true,
                      flexibleSpace: TabBar(
                        indicatorColor: appColor,
                        labelPadding: EdgeInsets.all(05.0),
                        labelColor: Colors.blue,
                        unselectedLabelColor: Colors.grey,
                        tabs: tabList
                            .map((TabsModel model) => model.myTab)
                            .toList(),
                      ),
                    ),
//                    SliverPersistentHeader(
//                      delegate: _SliverAppBarDelegate(
//                        TabBar(
//                          labelPadding: EdgeInsets.all(05.0),
//                          labelColor: Colors.blue,
//                          unselectedLabelColor: Colors.grey,
//                          tabs: tabList
//                              .map((TabsModel model) => model.myTab)
//                              .toList(),
//                        ),
//                      ),
//                      pinned: true,
//                    ),
                  ];
                },
                body: TabBarView(
                  children:
                      tabList.map((TabsModel model) => model.tabBody).toList(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TopIconButtons extends StatelessWidget {
  TopIconButtons({this.icon, this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 20.0,
        backgroundColor: Colors.grey.shade200,
        child: IconButton(
          onPressed: onPressed,
          padding: EdgeInsets.only(bottom: 2.0),
          icon: Icon(
            icon,
            size: 23.0,
            color: Colors.grey.shade800,
          ),
        ),
      ),
    );
  }
}
