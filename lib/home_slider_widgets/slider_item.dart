import 'package:flutter/material.dart';
import 'slide_model.dart';

class SliderItem extends StatelessWidget {
  final int index;
  const SliderItem(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 300.0,
          height: 300.0,
          decoration: BoxDecoration(
            //shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(slideList[index].imageUrl),
              fit: BoxFit.fill,
            ),
          ),
        ),
        // Text(
        //   slideList[index].title,
        //   style: GoogleFonts.aladin(
        //     textStyle: style,
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
        //   child: Text(
        //     slideList[index].description,
        //     style: head,
        //   ),
        // ),
      ],
    );
  }
}
