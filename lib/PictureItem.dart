import 'package:flutter/material.dart';
import 'package:waterfall_demo/PictureInfo.dart';

class PictureItem extends StatefulWidget {
  PictureItem(this.info);

  final PictureInfo info;

  @override
  _PictureItemState createState() => _PictureItemState();
}

class _PictureItemState extends State<PictureItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0xff999999),
          blurRadius: 2,
          offset: Offset(0.5, 0.5),
        )
      ], borderRadius: BorderRadius.circular(4), color: Colors.white),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Stack(),
        // TODO implement picture item

      ),
    );
  }
}
