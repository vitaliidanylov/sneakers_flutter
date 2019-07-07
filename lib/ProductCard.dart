import 'package:flutter/material.dart';
import 'CustomIcon.dart';

class ProductCard extends StatelessWidget {
  int cardColor;
  String imgUrl;
  String title;
  String previousPrice;
  String price;

  ProductCard(
    this.cardColor,
    this.imgUrl,
    this.title,
    this.previousPrice,
    this.price,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 32.0),
      width: double.infinity,
      height: 340.0,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: Offset(1.0, 6.0),
              blurRadius: 20.0,
            )
          ],
          color: Color(cardColor),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.withOpacity(.3), width: .2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            imgUrl,
            width: double.infinity,
            height: 200.0,
          ),
          Text(
            title,
            style: TextStyle(
                fontFamily: 'GothamBook',
                fontSize: 24.0,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(CustomIcons.heart),
                color: Colors.grey,
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Text(previousPrice,
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 16.0,
                            fontFamily: 'Helvetica')),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      price,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w800),
                    )
                  ],
                ),
              ),
              IconButton(
                color: Colors.grey,
                icon: Icon(CustomIcons.cart_plus),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
