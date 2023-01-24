import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'basket_page.dart';
import 'helpers/model_and_constants.dart';

class Details extends StatefulWidget  {
  const Details({Key? key, required this.color, required this.assetImage, required this.brand, required this.info, required this.price, required this.index}) : super(key: key);
  final Color color;
  final String assetImage;
  final String brand;
  final String info;
  final String price;
  final int index;


  @override
  State<Details> createState() => _DetailsState();
}

late Color shoeColor;
late String assetImage;
late String brand;
late String info;
late String shoePrice;
late int index;


class _DetailsState extends State<Details> with SingleTickerProviderStateMixin {
  int selectedIndex = -1;
  double animationMargin = 30;

  @override
  void initState() {
    super.initState();

    shoeColor = widget.color;
    assetImage = widget.assetImage;
    brand = widget.brand;
    info= widget.info;
    shoePrice = widget.price;
    index = widget.index;

  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(brand ,style: GoogleFonts.josefinSans(
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)
          ),),
          leading: IconButton(
            icon: (Icon(Icons.arrow_back)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Container(
                  child: Icon(
                    Icons.favorite_border_sharp,
                    color: Colors.white,
                  ),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        blurStyle: BlurStyle.solid,
                        offset: Offset(-1, 2), // changes position of shadow
                      ),
                    ],
                    shape: BoxShape.circle,
                    color: shoeColor,
                  ),
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(
                tag: index.toString(),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: AlignmentDirectional.center,
                  children: [
                    // TopBar(shoeColor: shoeColor),
                    circle(
                      size,
                      8,
                    ),
                    Container(
                      decoration: BoxDecoration(

                      ),
                      margin: EdgeInsets.only(left: 20, right: 20,top: 30),
                      child: Image.asset(
                        assetImage,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2.8,
                      ),
                    )
                  ],
                ),
              ),
              detailPics(),
              SizedBox(
                height: 10,
              ),
              price(),
              SizedBox(
                height: 10,
              ),
              detailsText(),
              SizedBox(
                height: 20,
              ),
              moreDetails(),
              SizedBox(
                height: 10,
              ),
              sizeUkUsa(),
              shoeSizeToggleButton2(),
              // addToBagButton(),

              Center(
                child: Bounce(
                  onPressed: (){
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            transitionDuration: Duration(seconds: 1),
                            pageBuilder: (_, __, ___) {
                              return Basket(
                                color: shoeColor,
                                assetImage:assetImage,
                                index: index,
                                brand: brand,
                                info: info,
                                price: shoePrice,
                              );
                            }));
                  },
                  duration: Duration(milliseconds: 300),
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(15),
                    height: 50,
                    width: double.infinity,
                    child: Text(
                      AppConstants.addToBag,
                      style: TextStyle(color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffff5164),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));

  }


  Widget shoeSizeToggleButton2(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Row(
          // direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
          List.generate(5, (index) {

            return InkWell(
              onTap: (){
                print(index.toString());
                setState(() {
                  selectedIndex=index;
                });
              },
              child: AppButtons(
                size: 50, color: Colors.black,
                backroundColor: selectedIndex==index? Colors.black: Colors.transparent,
                textColor:selectedIndex==index? Colors.white: Colors.black ,
                borderColor: Colors.grey.shade300,
                index: index,),
            );
          })
          ,
        ),
      ),
    );
  }

  Widget buttonList(int i,) {
    List list = [
      Container(
        margin: EdgeInsets.only(left: 10),
        child: Row(
          children: [
            SizedBox(width: 5,),
            Text(
              'Try it',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            SvgPicture.asset(
              'assets/foot2.svg',
              width: 30,
              height: 30,
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade200)),
      ),
      Container(
        margin: EdgeInsets.only(left: 10),
        width: 70,
        child: TextButton(
          child: Text(
            '7.5',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          onPressed: () {},
        ),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(2),
            border: Border.all(color: Colors.grey.shade200)),
      ),
      Container(
        margin: EdgeInsets.only(left: 10),
        width: 70,
        child: TextButton(
          child: Text(
            '8',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          onPressed: () {},
        ),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(2),
            border: Border.all(color: Colors.grey.shade200)),
      ),
      Container(
        margin: EdgeInsets.only(left: 10),
        width: 70,
        child: TextButton(
          child: Text(
            '9.5',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          onPressed: () {},
        ),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(2),
            border: Border.all(color: Colors.grey.shade200)),
      ),
      Container(

        margin: EdgeInsets.only(left: 10),
        width: 70,
        child: TextButton(
          child: Text(
            '10.5',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          onPressed: () {},
        ),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(2),
            border: Border.all(color: Colors.grey.shade200)),
      )
    ];
    return list[i];
  }

  Widget sizeUkUsa() {
    return Container(
      //height: 100,
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppConstants.size,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          ToggleButtons(
            children: [Text(AppConstants.uk, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),), Text(AppConstants.usa)],
            isSelected: [true, false],
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderWidth: 0,
          ),
        ],
      ),
    );
  }

  Widget moreDetails() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      alignment: Alignment.topLeft,
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                  color: Colors.black,
                  width: 1.0, // This would be the width of the underline
                ))),
        child: Text(
          AppConstants.moreDetails,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget detailsText() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Text(
        AppConstants.airMax270InfoText,
        style: TextStyle(color: Colors.grey),
      ),
    );
  }

  Widget price() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            info,
            style: GoogleFonts.josefinSans(
                textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)
            ),
          ),
          Text(
            shoePrice,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          )
        ],
      ),
    );
  }

  Widget detailPics() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey),
          )),
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Image.asset(
              "assets/sneaker_01.png",
              width: 80,
              height: 50,
            ),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10)),
          ),
          Container(
            child: Image.asset(
              "assets/sneaker_01.png",
              width: 80,
              height: 50,
            ),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10)),
          ),
          Container(
            child: Image.asset(
              "assets/sneaker_01.png",
              width: 80,
              height: 50,
            ),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10)),
          ),
          Container(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/sneaker_01.png",
                  width: 80,
                  height: 50,
                ),
                Container(
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.grey.shade400,
                  ),
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade200,
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(10)),
          ),
        ],
      ),
    );
  }

  Positioned circle(Size size, double v,) {
    return Positioned(
      top: -200,
      left: size.width-150,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          v,
          v,
          1.0,
        ),
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: shoeColor,
          ),
        ),
      ),
    );
  }


}
