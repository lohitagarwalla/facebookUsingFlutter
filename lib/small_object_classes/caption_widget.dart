import 'package:flutter/material.dart';

class CaptionWidget extends StatelessWidget {
  CaptionWidget({this.caption});
  final String caption;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0, right: 8.0),
      child: Container(
        child: Text(
          caption,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
