import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Containers extends StatelessWidget {
  final RxBool isExpanded;
  final double  Width,changedWidth,Height,changedHeight, borderValue;
  final Color colors;

  Containers({
    required this.isExpanded,
    required this.Width,
    required this.changedHeight,
    required this.changedWidth,
    required this.Height,
    required this.colors,
    required this.borderValue,
  });



  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return
      Center(
        child:AnimatedContainer(
          duration: Duration(milliseconds: 350),
          width: isExpanded.value ? changedWidth : Width,
          height: isExpanded.value ? changedHeight : Height,
          decoration: BoxDecoration(
            borderRadius: isExpanded.value ? BorderRadius.circular(borderValue): BorderRadius.circular(Height/2) ,
            color: colors,
          ),

        ),
      );

  }
}