import 'package:flutter/material.dart';

//declaration and dummy initialization:
var kScreenWidth=400.0;
var kScreenHeight=800.0;


// determine the screen dimensions, in order to use the two variables "kScreenWidth" and "kScreenHeight" in everywhere direcly in any app file u wanna:
void knowScreenWidth(BuildContext context){
   kScreenWidth = MediaQuery.of(context).size.width;
}
void knowScreenHeight(BuildContext context){
 kScreenHeight = MediaQuery.of(context).size.height;
}
