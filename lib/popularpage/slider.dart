
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutterauthcationplusdb/CustomWidgets/circular_button.dart';
import 'package:flutterauthcationplusdb/popularpage/popular_items.dart';
import 'package:flutterauthcationplusdb/global.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterauthcationplusdb/CustomWidgets/circular_button.dart';
import '../global.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterauthcationplusdb/CustomWidgets/custom_scaffold.dart';
class slider extends StatefulWidget{

  _sliderState  createState() => _sliderState();


}

class _sliderState extends State<slider> {
  @override


  final List<Map> items = [
    {"img": "assets/food1.jpeg", "name": "Fruit Salad"},
    {"img": "assets/food2.jpeg", "name": "Fruit Salad"},
    {"img": "assets/food3.jpeg", "name": "Hamburger"},
    {"img": "assets/food4.jpeg", "name": "Fruit Salad"},
    {"img": "assets/food5.jpeg", "name": "Hamburger"},
    {"img": "assets/food6.jpeg", "name": "Steak"},
    {"img": "assets/food7.jpeg", "name": "Pizza"},
    {"img": "assets/food8.jpeg", "name": "Asparagus"},
    {"img": "assets/food9.jpeg", "name": "Salad"},
    {"img": "assets/food10.jpeg", "name": "Pizza"},
    {"img": "assets/food11.jpeg", "name": "Pizza"},
    {"img": "assets/food12.jpg", "name": "Salad"},
  ];


  Widget build(BuildContext context) {
    // TODO: implement build
    List<Widget> gridItems = List();



    Widget carousel= new  Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      height: 200.0,
      //padding: EdgeInsets.only(right:20.0,left:20.0),
      margin: EdgeInsets.only(right:10.0,left: 10.0),
      child: Carousel(
        boxFit: BoxFit.cover,
        images:[
          Image.asset('images2/food1.jpeg',
            height: MediaQuery.of(context).size.height / 3.6,
            width: MediaQuery.of(context).size.width / 2.2,
            fit: BoxFit.cover,),
          Image.asset('images2/food2.jpeg',height: MediaQuery.of(context).size.height / 3.6,
            width: MediaQuery.of(context).size.width / 2.2,
            fit: BoxFit.cover,),
          Image.asset('images2/food3.jpeg',
            height: MediaQuery.of(context).size.height / 4.6,
            width: MediaQuery.of(context).size.width / 2.2,
            fit: BoxFit.cover,),
          Image.asset('images2/food4.jpeg',height: MediaQuery.of(context).size.height / 3.6,
            width: MediaQuery.of(context).size.width / 2.2,
            fit: BoxFit.cover,),
          Image.asset('images2/food5.jpeg',height: MediaQuery.of(context).size.height / 3.6,
            width: MediaQuery.of(context).size.width / 2.2,
            fit: BoxFit.cover,),
          Image.asset('images2/food6.jpeg',height: MediaQuery.of(context).size.height / 3.6,
            width: MediaQuery.of(context).size.width / 2.2,
            fit: BoxFit.cover,),
        ],
        autoplay: true,
        animationCurve: Curves.ease,
        animationDuration:  Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 0.0,
      ),



    );






      return ListView(
        
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  'SPECIAL DEAL',
                  style: setTextStyle(
                      size: 23, color: primaryTextColor, weight: FontWeight.w800),
                ),
              ),

              FlatButton(
                  onPressed: () {},
                  child: Text(
                    'View More',
                    style: setTextStyle(
                        color: primaryColor, weight: FontWeight.bold, size: 16),
                  ))

            ],
          ),
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: carousel,
              ),
              Positioned(
                height: 30,
                width: 30,
                right: 14.0,
                bottom: 15.0,
                child: CircularButton(
                    icon: Icon(
                      Icons.favorite_border,
                      color: primaryColor,
                      size: 15,
                    ),
                    onPressed: () {}),
              )
            ],
          ),
          Padding(padding:EdgeInsets.only(bottom: 10.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  'Popular Items',
                  style: setTextStyle(
                      size: 23, color: primaryTextColor, weight: FontWeight.w800),
                ),
              ),

              FlatButton(
                  onPressed: () {},
                  child: Text(
                    'View More',
                    style: setTextStyle(
                        color: primaryColor, weight: FontWeight.bold, size: 16),
                  ))

            ],
          ),

          StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('popular_Items').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return LinearProgressIndicator();

              return _buildGridView(context, snapshot.data.documents, gridItems);
            },
          ),
        ],
      );


  }


  Widget _buildGridView(BuildContext context, List<DocumentSnapshot> documents, List<Widget> x) {
    List<Widget> getRatingRow() {
      List<Widget> row = List();
      for (int i = 0; i < 5; i++) {
        row.add(Icon(
          Icons.star,
          color: Colors.orangeAccent,
          size: 11,
        ));
      }
      row.add(Container(
        width: 8,
      ));
      row.add(
        Text(
          '5.0 (23 Reviews)',
          style: setTextStyle(size: 11, color: primaryTextColor),
        ),
      );
      return row;
    }

    int counter = 0;

    documents.forEach((item) {
      x.add(
        InkWell(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        items[counter]['img'],
                        height: MediaQuery
                            .of(context)
                            .size
                            .height / 3.6,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 2.2,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      height: 30,
                      width: 30,
                      right: 8.0,
                      bottom: 8.0,
                      child: CircularButton(
                          icon: Icon(
                            Icons.favorite_border,
                            color: primaryColor,
                            size: 15,
                          ),
                          onPressed: () {}),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 2),
                  child: Text(
                    item['name'],
                    style: setTextStyle(
                        size: 20,
                        weight: FontWeight.w900,
                        color: primaryTextColor),
                  ),
                ),
                Row(
                  children: getRatingRow(),
                ),
              ],
            )),
      );
      counter++;
    });
    return GridView.count(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.all(8),
      crossAxisSpacing: 8,
      childAspectRatio: MediaQuery
          .of(context)
          .size
          .width /
          (MediaQuery
              .of(context)
              .size
              .height / 1.25),
      mainAxisSpacing: 8,
      crossAxisCount: 2,
      children: x,
    );
  }
}
