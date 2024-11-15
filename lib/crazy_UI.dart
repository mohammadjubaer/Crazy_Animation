import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'container.dart';

class Crazy extends StatelessWidget {
  const Crazy({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool maniClick = false.obs;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SafeArea(child: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {

                    maniClick.value = !maniClick.value;

                  },
                  child: Obx(() => Text(maniClick.value ? "COLAPSE": "EXPAND",
                    style: TextStyle( color: maniClick.value? Colors.teal:Colors.cyan),)),
                ),
                SizedBox(height: screenHeight * 0.08),
                SizedBox(
                  width: screenHeight,
                  height: screenHeight * .8,
                  child: Obx( () =>Stack(
                    alignment: Alignment.center,
                    children: [


                      AnimatedPositioned(
                          duration: Duration(milliseconds: 350),
                          left: maniClick.value ? screenHeight/2-screenHeight*.1/2 : screenHeight/2- screenHeight*.4/2,
                          top: maniClick.value ? screenHeight*.03 : screenHeight*.8/2- screenHeight*.4/2,
                          child: Containers(isExpanded: maniClick, Width: screenHeight*.4, changedHeight: screenHeight*.1 , changedWidth: screenHeight*.1, Height: screenHeight*.4, colors: Colors.black, borderValue: screenHeight*.6/2,)),
                      Containers(isExpanded: maniClick, Width: screenHeight*.3, changedHeight: screenHeight*.5 , changedWidth: screenHeight*.5, Height: screenHeight*.3, colors: Colors.amber, borderValue: screenHeight*.1/2
                      ),
                      Center(
                        child: Text(maniClick.value ? "History \nChart  \nNew Items " : "",
                        style:  TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                        ),),
                      ),
                      AnimatedPositioned(
                          duration: Duration(milliseconds: 350),
                          left: maniClick.value ? screenHeight/2+screenHeight*.3/2 : screenHeight/2- screenHeight*.2/2,
                          top: maniClick.value ? screenHeight*.8/2+ screenHeight*.27 : screenHeight*.8/2- screenHeight*.2/2,
                          child: Containers(isExpanded: maniClick, Width: screenHeight*.2, changedHeight: screenHeight*.1 , changedWidth: screenHeight*.1, Height: screenHeight*.2, colors: Colors.teal,borderValue: screenHeight*.4/2)),
                    ],
                  ),
                  ),

                ),


              ]
          ),

        ),
        )

    );
  }
}
