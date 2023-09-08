// ignore_for_file: use_build_context_synchronously
import 'package:ethio_agri_smart/screens/PlantScanPage.dart';

import './widgets/CustomAppBar.dart';

import 'package:ethio_agri_smart/artificial.dart';
import 'package:ethio_agri_smart/camera.dart';
import 'package:ethio_agri_smart/decision_sup.dart';
import 'package:ethio_agri_smart/fer_car.dart';
import 'package:ethio_agri_smart/market.dart';
import 'package:ethio_agri_smart/new.dart';
import 'package:ethio_agri_smart/weather_screen.dart';
import 'package:flutter/material.dart';

import './onepage.dart';
import './navigation_drawer.dart';
import './button.dart';
import 'package:hexcolor/hexcolor.dart';

//eyos wrote this comment
void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PlantScanPage(),
    ));

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: HexColor("#D3DDDF"),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 80),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/main_screen.png"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
