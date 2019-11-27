import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_shop/constants.dart';
import 'package:furniture_shop/popup_pages/create_post_page.dart';
import 'package:furniture_shop/small_object_classes/caption_widget.dart';
import 'package:furniture_shop/small_object_classes/like_and_commenet_info.dart';
import 'package:furniture_shop/small_object_classes/like_comment_share_buttons.dart';
import 'package:furniture_shop/small_object_classes/uplaoder_info.dart';

class Home extends StatefulWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool liked = false;
  var likeButtonColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        //status upload container
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: <Widget>[
              Container(
                color: Colors.black38,
              ),
              CircleAvatar(
                radius: 25.0,
                backgroundImage: AssetImage('images/profile_pic_small.jpg'),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreatePostPage()));
                  },
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('    Write Something here...'),
                      ],
                    ),
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(width: 1.0, color: greyShade),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        //photo, video, check-in container
        Container(
          decoration:
              BoxDecoration(border: Border(top: BorderSide(width: 0.5))),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.videocam,
                      color: Colors.red,
                    ),
                    Text(
                      'Live',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text('|'),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.photo_library,
                      color: Colors.green,
                    ),
                    Text(
                      'Photo',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text('|'),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.place,
                      color: Colors.red,
                    ),
                    Text(
                      'Check In',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // Post view container
        Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // name and picture of uploader
              UploaderInfo(
                icon: FontAwesomeIcons.globeAfrica,
                name: 'Lohit Agarwalla',
                time: '3 hrs.',
                imageString: 'images/profile_pic_small.jpg',
              ),
              CaptionWidget(
                caption:
                    'Sela Pass, Tawang \n Bravery of Sela will be remembered forever',
              ),
              //content of upload
              SizedBox(
                width: double.infinity,
                child: Image(
                  image: AssetImage('images/profile_pic_medium.jpg'),
                  fit: BoxFit.fitWidth,
                ),
              ),
              //like and comment count view
              LikeAndCommentInfo(
                likedPerson: 'Mrinmoy Mahanta',
                likeCount: '56',
                commentCount: '5',
              ),
              // Like comment and share buttons
              LikeCommentShareButton(
                liked: liked,
                onTap: () {
                  print('taped');
                  setState(() {
                    liked = !liked;
                  });
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
