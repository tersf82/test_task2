import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

import 'helpers/card_page.dart';
import 'helpers/create_shape.dart';
import 'helpers/model_and_constants.dart';


class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>
    with SingleTickerProviderStateMixin {
  List<String> listBrands = [
    'Nike',
    'Adidas',
    'Jordan',
    'Puma',
    'NewBalance',
    'Prada'
  ];
  FontWeight fontWeight = FontWeight.normal;
  int selectBrandIndex = 0;

  late bool isTapped;
  late PageController pageController;
  int currentPage = 0;
  double viewportFraction = 0.6;
  double pageOffset = 0;
  double va = 1;
  double angle2 = 0;

  late double scaleImage = 3;

  @override
  void initState() {
    super.initState();
    isTapped = false;
    pageController = PageController(
        initialPage: currentPage, viewportFraction: viewportFraction)
      ..addListener(() {
        setState(() {
          pageOffset = pageController.page!;
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: false,
        bottomNavigationBar: BottomAppBar(
            elevation: 0,
            shape: AutomaticNotchedShape(
                RoundedRectangleBorder(), StadiumBorder()),
            color: Colors.grey.shade200,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.home_outlined,
                      color: Colors.red,
                      size: 30,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(Icons.favorite_border_sharp, size: 30),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(Icons.location_history_outlined, size: 30),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(Icons.shopping_cart_outlined, size: 30),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(Icons.person_2_outlined, size: 30),
                    onPressed: () {}),
              ],
            )),
        backgroundColor: Colors.white,
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('Discover',
              style: GoogleFonts.josefinSans(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              )),
          actions: [
            Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Container(
                  child: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        blurStyle: BlurStyle.solid,
                        offset: Offset(-1, 2), // changes position of shadow
                      ),
                    ],
                    shape: BoxShape.circle,
                    color: Colors.grey.shade300,
                  ),
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Container(
                  child: Icon(
                    Icons.notifications_none,
                    color: Colors.black,
                  ),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        blurStyle: BlurStyle.solid,
                        offset: Offset(-1, 2), // changes position of shadow
                      ),
                    ],
                    shape: BoxShape.circle,
                    color: Colors.grey.shade300,
                  ),
                ))
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 80,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.all(20),
                      itemCount: listBrands.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                              listBrands[index],
                              style: GoogleFonts.josefinSans(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: selectBrandIndex == index
                                          ? FontWeight.bold
                                          : FontWeight.normal)),
                            ));
                      }),
                ),
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 30,
                      ),
                      height: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: RotatedBox(
                                quarterTurns: 3,
                                child: Text(
                                  'Upcoming',
                                  style: GoogleFonts.josefinSans(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal)),
                                )),
                          ),
                          Container(
                            child: RotatedBox(
                                quarterTurns: 3,
                                child: Text(
                                  'Featured',
                                  style: GoogleFonts.josefinSans(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                )),
                          ),
                          Container(
                            child: RotatedBox(
                                quarterTurns: 3,
                                child: Text(
                                  'New',
                                  style: GoogleFonts.josefinSans(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal)),
                                )),
                          ),
                        ],
                      ),
                    ),
                    TweenAnimationBuilder(
                      tween: Tween<double>(begin: 10, end: 20),
                      duration: Duration(milliseconds: 500),
                      builder: (BuildContext context, double value, Widget? child) {
                        return Container(
                            height: 300,
                            child: PageView.builder(
                              controller: pageController,
                              itemCount: shoeList.length,
                              itemBuilder: (context, index) {
                                double scale = max(
                                    viewportFraction,
                                    (1 - (pageOffset - index).abs()) +
                                        viewportFraction);

                                angle2 = (pageOffset - index).abs();

                                if (angle2 > 0.5) {
                                  angle2 = 1 - angle2;
                                }

                                return CardPageWidget(
                                    pageOffset - index,
                                    index,
                                    angle2,
                                    scale,
                                    pageController,
                                    scaleImage,
                                    isTapped);
                              },
                              onPageChanged: (exIndex) {},
                              findChildIndexCallback: (exIndex) {},
                            ));
                      },
                      child: Container(
                        // color: Colors.red,
                          height: 300,
                          // width: double.infinity,
                          // decoration: ,
                          child: PageView.builder(
                            padEnds: false,
                            pageSnapping: false,
                            controller: pageController,
                            itemCount: shoeList.length,
                            itemBuilder: (context, index) {
                              double scale = max(
                                  viewportFraction,
                                  (1 - (pageOffset - index).abs()) +
                                      viewportFraction);
                              double angle = (pageOffset - index).abs();

                              if (angle > 0.5) {
                                angle = 1 - angle;
                              }

                              return CardPageWidget(pageOffset - index, index,
                                  angle, scale, pageController, scaleImage, false);
                            },
                            onPageChanged: (i) {
                            },
                            findChildIndexCallback: (i) {},
                          )),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'More',
                        style: GoogleFonts.josefinSans(
                            textStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      Icon(Icons.arrow_forward)
                    ],
                  ),
                ),
                Stack(
                  children: [
                    ClipPath(
                      clipper: CreateShape(),
                      child: Container(
                        alignment: Alignment.topCenter,
                        height: 280,
                        color: Colors.grey.shade200,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                          child: Stack(
                            children: [
                              Container(
                                height: 200,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image:
                                        AssetImage('assets/sneaker_01.png'))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'NIKE AIR-MAX',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      '\$170.00',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 8, top: 8),
                                alignment: Alignment.center,
                                child: RotatedBox(
                                    quarterTurns: 3,
                                    child: Text(
                                      'NEW',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    )),
                                height: 80,
                                width: 20,
                                color: Color(0xffff5164),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          child: Stack(
                            children: [
                              Container(
                                height: 200,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image:
                                        AssetImage('assets/sneaker_02.png'))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'NIKE AIR FORCE',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      '\$130.00',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left: 8, top: 8),
                                child: RotatedBox(
                                    quarterTurns: 3,
                                    child: Text(
                                      'NEW',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    )),
                                height: 80,
                                width: 20,
                                color: Color(0xffff5164),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            )));
    ;
  }

  List<Shoes> shoeList = [
    Shoes(
        brand: 'NIKE',
        info: 'AIR-270',
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
}

