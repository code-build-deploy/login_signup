import 'package:flutter/material.dart';
import 'dart:math';

class LoginPageBackground extends StatelessWidget {
  
  final screenHeight;
  const LoginPageBackground({Key key , @required this.screenHeight}):super (key:key);
  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
                 ClipPath(
                clipper: TopLeftClipper(),
                child: Container(
                height: screenHeight * 0.5,
                color: Color(0xff0f1b45),
                ),
                ),
                ClipPath(
                clipper: BottomRightClipper(),
                child: Container(
                  
                  height: screenHeight*0.5,
                  
                  color: Color(0xff0f1b45),
                  ),
                ),
      
                
      ],
    )
             ;
  }
}
 
class TopLeftClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    //path.lineTo(0, (size.height*3)/4);

    path.lineTo(size.width/2, 0.0);
    path.relativeCubicTo(size.width/5, size.height/5, size.width/2, size.height, -size.width/2, (size.height*3)/4);
   // path.cubicTo(size.width / 2,  3*size.height/4, size.width/5, size.height/3, 2*size.width/10,3*size.height/8);
    
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
    


class BottomRightClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    
    path.moveTo(size.width,size.height);
    
    // path.lineTo(size.width/2,size.height);
    // //path.lineTo(size.width,(size.height)/4);
    // path.relativeCubicTo(4*size.width/5, 4*size.height/5, 0, 0, 3*size.width/2,(size.height)/4);
    
    path.lineTo(size.width/2, size.height);
    path.relativeCubicTo(-size.width/5, -size.height/5, -size.width/2, -size.height, size.width/2, -(size.height*3)/4);
  //  // path.cubicTo(size.width / 2,  3*size.height/4, size.width/5, size.height/3, 2*size.width/10,3*size.height/8);
    
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {

    return true;
  }

}