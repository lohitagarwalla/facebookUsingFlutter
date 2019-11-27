import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class UploaderInfo extends StatelessWidget {
  UploaderInfo({this.icon, this.name, this.time, this.imageString});
  final String imageString;
  final String name;
  final String time;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 10.0,
          color: greyShade,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 20.0,
                    backgroundImage: AssetImage(imageString),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17.0),
                      ),
                      Row(
                        children: <Widget>[
                          Text(time),
                          Icon(
                            icon,
//                        ,
                            size: 15.0,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Icon(
                FontAwesomeIcons.ellipsisH,
                size: 20.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
