import 'package:flutter/material.dart';

class AppCardWidget extends StatelessWidget {
  final double? heightOfCard;
  final Widget? widget;
  const AppCardWidget({super.key, this.heightOfCard, this.widget});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
            left: 10.0, right: 10.0, top: 20.0, bottom: 8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Container(
            height: heightOfCard,
            margin: const EdgeInsets.only(
                bottom: 6.0), //Same as `blurRadius` i guess
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),

            child: widget,
          ),
        ),
      );
}
