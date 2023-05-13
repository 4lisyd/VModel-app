import 'package:flutter/material.dart';

class UserSmallImage extends StatefulWidget {
  const UserSmallImage(
      {Key? key,
      this.height = 29,
      required this.imageAsset,
      this.marginRight = 6,
      this.width = 29,
      this.marginBottom = 0})
      : super(key: key);
  final double? height;
  final double width;
  final double marginBottom;
  final double marginRight;
  final String imageAsset;
  @override
  UserSmallImageState createState() => UserSmallImageState();
}

class UserSmallImageState extends State<UserSmallImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(0),
      margin: EdgeInsets.only(
          right: widget.marginRight, top: 1, bottom: widget.marginBottom),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        shape: BoxShape.circle,
      ),
      child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: Image.asset(
            widget.imageAsset,
            width: 26,
            height: 26,
            fit: BoxFit.cover,
          )),
    );
  }
}
