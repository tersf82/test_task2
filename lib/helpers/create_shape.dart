import 'package:flutter/material.dart';

class CreateShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();

    path.moveTo(0, h*0.3);
    path.lineTo(0, h);
    //  path.quadraticBezierTo(w*0.5, h+800, w, h);
    path.lineTo(w, h);
    path.lineTo(w, h*0.3);
    path.quadraticBezierTo(w*0.5, h-100, 0, h*0.3);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class BotBar extends StatelessWidget {
  const BotBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
          ),
          // color: Color(0xffF3A58B),
          height: MediaQuery.of(context).size.height / 2.3),
      clipper: CreateShape(),
    );
  }
}

class CreateShapeBotBar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();

    path.lineTo(0, h * 0.4);
    path.quadraticBezierTo(w * 0.5, h*1.1, w, h * 0.8);
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

