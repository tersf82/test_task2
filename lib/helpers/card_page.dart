
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bounce/flutter_bounce.dart';

import '../detail_page.dart';
import 'model_and_constants.dart';


class CardPageWidget extends StatefulWidget {
  final double offset;
  final int index;
  final double angle;
  final double scale;
  final double scaleImage;
  final PageController pageController;
  final bool isTapped;
  CardPageWidget(this.offset, this.index, this.angle, this.scale,
      this.pageController, this.scaleImage, this.isTapped);

  @override
  State<CardPageWidget> createState() => _CardPageWidgetState();
}

class _CardPageWidgetState extends State<CardPageWidget>
    with SingleTickerProviderStateMixin {
  List<Shoes> shoeList = [
    Shoes(
        brand: 'NIKE',
        info: 'AIR-MAX-270',
        assetImage: 'assets/sneaker_01.png',
        price: '\$150.00',
        color: Color(0xff3099bb)),
    Shoes(
        brand: 'ADIDAS',
        info: 'EPIC-REACT',
        assetImage: 'assets/sneaker_02.png',
        price: '\$130.00',
        color: Color(0xff190d4c)),
    Shoes(
        brand: 'NIKE',
        info: 'AIR-MAX',
        assetImage: 'assets/sneaker_03.png',
        price: '\$130.00',
        color: Color(0xff2b637f)),
    Shoes(
        brand: 'NIKE',
        info: 'EPIC-NATIVE',
        assetImage: 'assets/sneaker_04.png',
        price: '\$180.00',
        color: Color(0xff3e5db9)),
  ];

  bool isTapped = false;

  late bool _didFinishAnimating;

  bool isTapped2 = false;

  late AnimationController controller;
  late CurvedAnimation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    animation = CurvedAnimation(

      parent: controller, // the controller you created
      curve: Curves.decelerate,
    );

    _didFinishAnimating = true;

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        curve: Curves.bounceOut,
        tween: Tween<double>(begin: 1, end: 2),
        duration: Duration(milliseconds: 600),
        builder: (BuildContext context, double value, Widget? child) {
          var egri = widget.angle * 2 + 2 - value;

          return Card(
              elevation: 0,
              child: Stack(
                children: [
                  Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(
                          widget.index.isEven ? egri = egri * -1 : egri = egri),
                    alignment: Alignment.center,
                    child: Hero(

                      tag: widget.index.toString(),
                      child: Card(
                          color: shoeList[widget.index].color,
                          margin: EdgeInsets.only(left: 20, right: 20),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32)),
                          child: Container(
                            margin: EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      shoeList[widget.index].brand,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      shoeList[widget.index].info,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      shoeList[widget.index].price,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.favorite_border_sharp,
                                      color: Colors.white,
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Transform.translate(
                      offset: Offset(
                          -widget.offset *
                              MediaQuery.of(context).size.width /
                              2,
                          0),
                      child: Bounce(
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  transitionDuration: Duration(seconds: 2),
                                  pageBuilder: (_, __, ___) {
                                    return Details(
                                        color: shoeList[widget.index].color,
                                        assetImage:
                                        shoeList[widget.index].assetImage,
                                        brand: shoeList[widget.index].brand,
                                        info: shoeList[widget.index].info,
                                        price: shoeList[widget.index].price,
                                        index: widget.index

                                    );
                                  }));
                        },
                        duration: Duration(milliseconds: 80),
                        child: Image.asset(
                          shoeList[widget.index].assetImage,
                          scale: 3,
                          alignment: Alignment(-widget.offset.abs(), 0),
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                  )
                ],
              ));
        });
  }
}
