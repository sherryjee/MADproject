import 'package:flutter/material.dart';
import 'package:flutterauthcationplusdb/CustomWidgets/custom_scaffold.dart';
import 'loginRegisterpage.dart';
import 'main.dart';
import 'Auth.dart';
import 'package:flutterauthcationplusdb/CustomWidgets/custom_bottom_appbar.dart';
import 'package:flutterauthcationplusdb/popularpage/popular_items.dart';
import 'package:flutterauthcationplusdb/popularpage/slider.dart';

class home_page extends StatelessWidget {
  // This widget is the root of your application.
   home_page({
    //  @required this.title,
    @required this.body,
    @required this.index,

    Key key,
    this.auth,
    this.onSignOut, this.title
  }) : super(key: key);
  final String title;
  final Widget body;
  final int index;
  final AuthImplementation auth;
  final VoidCallback onSignOut;

  void logout()async {
    try{
      await auth.signOut();
      onSignOut();

    }
    catch(e){
      print("error "+ e);

    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      index: 0,
      title: 'SUB KHALO',
      body: slider(),
    );
  }
}