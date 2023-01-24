import 'package:flutter/material.dart';
import 'package:quantity_input/quantity_input.dart';
import 'helpers/model_and_constants.dart';

class Basket extends StatefulWidget {
  Basket(
      {Key? key,
        required this.color,
        required this.assetImage,
        required this.brand,
        required this.info,
        required this.price,
        required this.index})
      : super(key: key);
  final Color color;
  final String assetImage;
  final String brand;
  final String info;
  final String price;
  final int index;

  @override
  _BasketState createState() => _BasketState();
}

class _BasketState extends State<Basket>
    with SingleTickerProviderStateMixin {
  late Color shoeColor;
  late String assetImage;
  late String brand;
  late String info;
  late String shoePrice;
  late int index;

  List<Shoes> listShoes = [];

  final _items = [];
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  int simpleIntInput = 1;
  bool isAdded = false;

  late AnimationController animationController;
  double animationMargin = 30;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    shoeColor = widget.color;
    assetImage = widget.assetImage;
    brand = widget.brand;
    info = widget.info;
    shoePrice = widget.price;
    index = widget.index;
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    Future.delayed(const Duration(milliseconds: 500), () {
// Here you can write your code

      setState(() {
        // Here you can write your code for open new view
        addItem();
      });
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        //margin: EdgeInsets.all(10),
        height: 150,
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.all(2),
          //  Colors.red,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'TOTAL',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    '\$350.00',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              TweenAnimationBuilder(
                duration: Duration(milliseconds: 300),
                tween: IntTween(begin: 20, end: animationMargin.toInt()),
                builder: (BuildContext context, int value, Widget? child) {
                  return Center(
                    child: Container(
                      margin: EdgeInsets.all(value.toDouble()),
                      height: 50,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            animationMargin = animationMargin == 20 ? 30 : 20;
                          });
                        },
                        child: Text(
                          'NEXT',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffff5164),
                      ),
                    ),
                  );
                },
                onEnd: () {
                  setState(() {
                    animationMargin = 20;
                  });
                },
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        leadingWidth: 0,
        centerTitle: false,
        toolbarHeight: 130,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_outlined,
                color: Colors.black54,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Bag',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                Text(
                  'Total 3  items',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: AnimatedList(
                key: _key,
                initialItemCount: 0,
                padding: EdgeInsets.all(10),
                itemBuilder: (context, index, animation) {
                  return SizeTransition(
                    // axis: Axis.horizontal,
                    key: UniqueKey(),
                    sizeFactor: animation,
                    child: Card(
                        elevation: 6,
                        color: Colors.white,
                        child: Container(
                          margin: EdgeInsets.all(20),
                          height: 100,
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TweenAnimationBuilder(
                                tween: Tween<double>(begin: 0, end: 1),
                                curve: Interval(0.3, 0.6, curve: Curves.elasticOut),
                                duration: Duration(milliseconds: 2000),
                                builder: (BuildContext context, double value,
                                    Widget? child) {
                                  return Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade400,
                                            borderRadius:
                                            BorderRadius.circular(20)),
                                        width: 100 * value,
                                        height: 100 * value,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Container(
                                            width: 100 * value,
                                            height: 100 * value,
                                            child: Image.asset(
                                              assetImage,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade400,
                                          borderRadius: BorderRadius.circular(20)),
                                      width: 100,
                                      height: 100,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Container(
                                          child: Image.asset(
                                            assetImage,
                                            fit: BoxFit.cover,
                                            height: 150,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      info,
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      shoePrice,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    QuantityInput(
                                        acceptsZero: true,
                                        decoration: InputDecoration(
                                            enabledBorder: InputBorder.none),
                                        elevation: 0,
                                        buttonColor: Colors.grey.shade200,
                                        iconColor: Colors.grey.shade700,
                                        value: simpleIntInput,
                                        onChanged: (value) {
                                          setState(() {
                                            simpleIntInput = int.parse(
                                                value.replaceAll(',', ''));
                                            print(simpleIntInput.toString());
                                            if(simpleIntInput==0) removeItem(index);
                                          });
                                        } // removeItem

                                    ),
                                  ]),
                            ],
                          ),
                        )),
                  );
                },
              ))
        ],
      ));
  void addItem() {
    _items.insert(0, 'Item ${_items.length + 1}');
    _key.currentState!.insertItem(
      0,
      duration: const Duration(milliseconds: 500),
    );
    setState(() {
      isAdded = true;
    });
  }

  void removeItem(int index) {
    _key.currentState!.removeItem(index, (_, animation) {
      return SizeTransition(
        sizeFactor: animation,
        child: const Card(
          margin: EdgeInsets.all(10),
          color: Colors.red,
          child: ListTile(
            title: Text('Deleted'),
          ),
        ),
      );
    }, duration: Duration(milliseconds: 300));
    _items.removeAt(index);
  }
}
