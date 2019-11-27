import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LikeAndCommentInfo extends StatelessWidget {
  LikeAndCommentInfo({this.likedPerson, this.likeCount, this.commentCount});
  final String likedPerson;
  final String likeCount;
  final String commentCount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.red,
                radius: 9.0,
                child: Icon(
                  FontAwesomeIcons.solidHeart,
                  size: 12.0,
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                radius: 9.0,
                child: Icon(
                  Icons.thumb_up,
                  size: 12.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text('$likedPerson, and $likeCount others')
            ],
          ),
          Text('$commentCount comments')
        ],
      ),
    );
  }
}
