import 'package:flutter/material.dart';
import 'package:flutterauthcationplusdb/home_page.dart';
import 'Auth.dart';
import 'loginRegisterpage.dart';
import 'package:flutterauthcationplusdb/mapping.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutterauthcationplusdb/popularpage/slider.dart';
import 'package:flutterauthcationplusdb/add_cartpage/listView_elements.dart';
import 'package:flutterauthcationplusdb/account_pagesdetail/account_page.dart';
import 'package:flutterauthcationplusdb/splash_screen/Splash_Screen.dart';
import 'package:flutterauthcationplusdb/home_page.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title:"sab khalo",
        theme:  ThemeData(
          primaryColor: Colors.redAccent
        ),

        home:Splash_Screen(),
        //home_page(),


      //Account_page()
        //LisView_elements(),
      //mapping(auth: Auth(),)
      //loginRegisterPage(title: "demo",)


    );
  }
}
