import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class AppConstants {
  static const String addToBag = 'ADD TO BAG';
  static const String nike = 'Nike';
  static const String airMax270 = 'Air-Max-270';
  static const String airMax270InfoText =
      'The Nike Air Max 270 amps up an icon with a huge Max Air unit for cushioning under every step. It features  a stretchy inner sleeve for a snug, sock-like-fit';
  static const String moreDetails = 'MORE DETAILS';
  static const String size = 'Size';
  static const String usa = 'USA';
  static const String uk = 'UK';
  static const String tryIt = 'Trstatic y it';
  Color color1 = Color(0xff3099bb);
  Color color2 = Color(0xff190d4c);
  Color color3 = Color(0xff2b637f);
  Color color4 = Color(0xff3e5db9);
}

class Shoes {
  final String price;
  final String brand;
  final String info;
  final String assetImage;
  final Color color;

  Shoes(
      {required this.color,
        required this.brand,
        required this.info,
        required this.assetImage,
        required this.price});
}
/////////////////////////
class ShoppingItem {
  final String title;
  final String urlImage;

  const ShoppingItem({
    required this.title,
    required this.urlImage,
  });
}
class AppButtons extends StatelessWidget {
  final Color color;
  final Color backroundColor;
  final Color textColor;
  double size;
  final Color borderColor;
  int index;

  AppButtons(
      {Key? key,
        required this.textColor,
        required this.index,
        required this.size,
        required this.color,
        required this.backroundColor,
        required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          left: 10,
        ),
        width: 80,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: borderColor),
            color: backroundColor),
        child: ListTile(
          title: index==0?null:Container(
              margin: EdgeInsets.only(bottom: 6),
              child: Center(child: Text(stocksList[index-1].size, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor),))),
          leading: index==0? Transform.translate(offset: Offset(-10, 0),
            child: Text('Try it', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: textColor),),
          ) : null,
          trailing: index==0? Transform.translate(offset: Offset(10,0), child: SvgPicture.asset(
            'assets/foot2.svg',color: textColor,
            width: 30,
            height: 30,
          ),):null,
          dense: true,
          horizontalTitleGap: 20,
        ) // buttonList(index),

    );
  }

  Widget buttonList(
      int i,
      ) {
    List list = [
      Container(
        child: Row(
          children: [
            SizedBox(
              width: 5,
            ),
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
        width: 20,
        child: TextButton(
          child: Text(
            '7.5',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          onPressed: () {},
        ),
        decoration: BoxDecoration(
            color: backroundColor,
            borderRadius: BorderRadius.circular(2),
            border: Border.all(color: Colors.grey.shade200)),
      ),
      Container(
        width: 20,
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
        width: 20,
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
        width: 20,
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

  List stocksList = [

    Stocks(size: "7.5"),
    Stocks(size: "8"),
    Stocks(size: "9.5"),
    Stocks(size: "10.5"),

  ];
}

class Stocks {
  String size;

  Stocks({required this.size,});
}

