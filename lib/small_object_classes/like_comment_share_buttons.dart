import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class LikeCommentShareButton extends StatelessWidget {
  LikeCommentShareButton({this.onTap, this.liked});
  final Function onTap;
  final bool liked;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(top: BorderSide(width: 0.5))),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              onTap: onTap,
              onLongPress: () {
                // todo: add post react menu
              },
              child: Row(
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.thumbsUp,
                    color: liked ? Colors.blue : darkgGeyShade,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'Like',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: liked ? Colors.blue : darkgGeyShade,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.comment,
                  color: darkgGeyShade,
                  size: 20,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  'Comment',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: darkgGeyShade,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.share,
                  color: darkgGeyShade,
                  size: 20,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  'Share',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: darkgGeyShade,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
