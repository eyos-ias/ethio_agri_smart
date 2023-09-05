// ignore_for_file: use_build_context_synchronously
import 'package:ethio_agri_smart/artificial.dart';
import 'package:ethio_agri_smart/camera.dart';
import 'package:ethio_agri_smart/decision_sup.dart';
import 'package:ethio_agri_smart/fer_car.dart';
import 'package:ethio_agri_smart/market.dart';
import 'package:ethio_agri_smart/new.dart';
import 'package:ethio_agri_smart/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import './onepage.dart';
import './navigation_drawer.dart';
import './button.dart';
import 'package:hexcolor/hexcolor.dart';

//eyos wrote this comment
void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#D3DDDF"),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 54, 20, 80),
        child: Container(height: 300, width: 300, color: HexColor("#2F8964")),
      ),
      appBar: CustomAppBar(),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.black,
          size: 30,
        ),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
            onPressed: () {},
            icon: Icon(
              LineIcons.bell,
              color: Colors.black,
              size: 38,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
