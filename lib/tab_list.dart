import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_shop/tab_pages/home_page.dart';
import 'package:furniture_shop/tab_pages/market_page.dart';
import 'package:furniture_shop/tab_pages/notification_page.dart';
import 'package:furniture_shop/tab_pages/option_page.dart';
import 'package:furniture_shop/tab_pages/profile_page.dart';
import 'package:furniture_shop/tab_pages/video_page.dart';
import 'package:furniture_shop/tabs_model.dart';

class TabList {
  List<TabsModel> tabList = [
    TabsModel(
      name: 'home',
      myTab: TabIcon(
        icon: Icons.home,
        text: '0',
      ),
      tabBody: Home(),
    ),
    TabsModel(
        name: 'video',
        myTab: TabIcon(
          icon: Icons.ondemand_video,
          text: '1',
        ),
        tabBody: VideoPage()),
    TabsModel(
        name: 'market',
        myTab: TabIcon(
          icon: Icons.shopping_cart,
          text: '0',
        ),
        tabBody: MarketPage()),
    TabsModel(
        name: 'profile',
        myTab: TabIcon(
          icon: FontAwesomeIcons.userCircle,
          text: '0',
        ),
        tabBody: ProfilePage()),
    TabsModel(
        name: 'notification',
        myTab: TabIcon(
          icon: Icons.notifications,
          text: '0',
        ),
        tabBody: NotificationPage()),
    TabsModel(
        name: 'options',
        myTab: TabIcon(
          icon: Icons.menu,
          text: '1',
        ),
        tabBody: OptionPage()),
  ];
}

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
