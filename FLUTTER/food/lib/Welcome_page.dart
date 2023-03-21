import 'package:flutter/material.dart';
import 'package:food/ServicePreference.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'delayed_animation.dart';
import 'package:food/main.dart';
import 'social-Page.dart';
import 'dart:async';

 class WelcomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      body: SingleChildScrollView(
        child:Container(
        margin:EdgeInsets.symmetric(
          vertical: 60,
          horizontal:30,
        ),
        child:Column(
          children:[
            delayedAnimation(
              delay:1500, 
              child: Container(
                height: 100,
                child: Image.asset('images/hendo.png'),

            ), 
            ),
            SizedBox(width:10),
            delayedAnimation(
              delay: 2500,
            child:Container(
              height: 200,
              child: Image.asset('images/ima.jpg'),

            ) ,
            ),
             SizedBox(width:10),
             delayedAnimation(
              delay: 3500,
            child:Container(
              height: 90,
              margin:EdgeInsets.only(
                top: 30,
                bottom:20,
              ),
              
              child: 
              Text(
                "Un excellent compromis ! Profitez de la liberté d'un appartement et des services d'un hôtel.,",
                
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color:Color.fromARGB(255, 213, 117, 13),
                 fontSize:16,
                 
                fontWeight:FontWeight.w600 
                )
              ),

            ) ,
            ),
             SizedBox(width:3),
                  delayedAnimation(
              delay: 4500,
            child:Container(
            
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary:d_red,
                  shape: StadiumBorder(),
                  padding: EdgeInsets.all(13)
                ),
                child:Text('COMMENCER',),
                
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) =>socialPage(),
                  ),
                  );
                },
              ),

            ) ,
            ),
          ],

        ),
      ) ,
      ),
    );
  }



}