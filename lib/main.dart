import 'package:flutter/material.dart';
import 'package:sneakers_flutter_app/ProductCard.dart';
import 'CustomIcon.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = {
      50: Color.fromRGBO(0, 0, 0, .1),
      100: Color.fromRGBO(0, 0, 0, .2),
      200: Color.fromRGBO(0, 0, 0, .3),
      300: Color.fromRGBO(0, 0, 0, .4),
      400: Color.fromRGBO(0, 0, 0, .5),
      500: Color.fromRGBO(0, 0, 0, .6),
      600: Color.fromRGBO(0, 0, 0, .7),
      700: Color.fromRGBO(0, 0, 0, .8),
      800: Color.fromRGBO(0, 0, 0, .9),
      900: Color.fromRGBO(0, 0, 0, 1),
    };

    MaterialColor colorCustom = MaterialColor(0xFF000000, color);
    return MaterialApp(
      title: 'Sneakers Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: colorCustom,
      ),
      home: MyHomePage(title: 'ADIDAS SHOP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  List<Widget> bottomNavIconList = [
    Icon(
      CustomIcons.shopping_bag,
      size: 24.0,
      color: Colors.grey.withOpacity(0.5),
    ),
    Icon(
      CustomIcons.search,
      size: 24.0,
      color: Colors.grey.withOpacity(0.5),
    ),
    Icon(
      CustomIcons.heart,
      size: 24.0,
      color: Colors.grey.withOpacity(0.5),
    ),
    Icon(
      CustomIcons.cart_plus,
      size: 24.0,
      color: Colors.grey.withOpacity(0.5),
    ),
    Icon(
      CustomIcons.user,
      size: 24.0,
      color: Colors.grey.withOpacity(0.5),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 25.0),
        children: <Widget>[
          Column(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                  child: Image.asset(
                    'images/logo.png',
                    width: 62.0,
                    height: 43.0,
                  ),
                ),
              ),
              ProductCard(0xfff5f5f5, 'images/shoe_1.webp',
                  'Adidas Nite Jogger', '\$1999.00', '\$849'),
              ProductCard(0xfff5f5f5, 'images/shoe_2.webp', 'Adidas Propher',
                  '\$999.00', '\$249'),
              ProductCard(0xfff5f5f5, 'images/shoe_3.webp',
                  'Adidas Continental 80', '\$299.00', '\$149')
            ],
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 56.0,
        decoration: BoxDecoration(color: Colors.white10, boxShadow: [
          BoxShadow(
              color: Colors.black12.withOpacity(0.065),
              offset: Offset(0.0, -3.0),
              blurRadius: 10.0),
        ]),
        child: Row(
          children: bottomNavIconList.map((item) {
            var index = bottomNavIconList.indexOf(item);
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                child: bottomNavItem(item, _currentIndex == index),
              ),
            );
          }).toList(),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

bottomNavItem(Widget item, bool isSelected) => Container(
      child: item,
      height: double.infinity,
      decoration: BoxDecoration(
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.blueGrey.withOpacity(0.1),
                  )
                ]
              : []),
    );
