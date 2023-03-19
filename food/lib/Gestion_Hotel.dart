import 'package:flutter/material.dart';
import 'package:food/ServicePreference.dart';
import 'package:food/social-Page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'delayed_animation.dart';
import 'package:food/main.dart';
import 'login_page.dart';

class GestionHotel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title:Text('INFOS'),
            backgroundColor: d_red,
        ) ,
        body:SingleChildScrollView(
          child:Column(
            children:[
          

              delayedAnimation(
                delay: 1100,
               child: Container(
                margin:EdgeInsets.symmetric(
                  vertical:14,
                  horizontal: 40,
                ),
                child:Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                      
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>loginPage(),
                        ),
                        );
                      },
                      style:ElevatedButton.styleFrom(
                        shape:StadiumBorder(),
                        primary:d_red,
                        padding:EdgeInsets.all(13),
                        ),
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                       
                        SizedBox(width:10),
                        Text('MODIFIER LE NOM DE L HOTEL'),
                      ],
                     ),
                     ),
                   
               
                ],
                ),
               ),
              ),
                SizedBox(height:35),
                          delayedAnimation(
                delay: 1200,
               child: Container(
                margin:EdgeInsets.symmetric(
                  vertical:14,
                  horizontal: 40,
                ),
                child:Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                      
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>loginPage(),
                        ),
                        );
                      },
                      style:ElevatedButton.styleFrom(
                        shape:StadiumBorder(),
                        primary:d_red,
                        padding:EdgeInsets.all(13),
                        ),
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                       
                        SizedBox(width:10),
                        Text('MODIFIER LES TARIF'),
                      ],
                     ),
                     ),
                   
               
                ],
                ),
               ),
              ),
                            SizedBox(height:35),
                          delayedAnimation(
                delay: 1300,
               child: Container(
                margin:EdgeInsets.symmetric(
                  vertical:14,
                  horizontal: 40,
                ),
                child:Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                      
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>loginPage(),
                        ),
                        );
                      },
                      style:ElevatedButton.styleFrom(
                        shape:StadiumBorder(),
                        primary:d_red,
                        padding:EdgeInsets.all(13),
                        ),
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                       
                        SizedBox(width:10),
                        Text('REINITIALISER L HOTEL'),
                      ],
                     ),
                     ),
                   
               
                ],
                ),
               ),
              ),
                              SizedBox(height:35),
                          delayedAnimation(
                delay: 1500,
               child: Container(
                margin:EdgeInsets.symmetric(
                  vertical:14,
                  horizontal: 40,
                ),
                child:Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                      
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>loginPage(),
                        ),
                        );
                      },
                      style:ElevatedButton.styleFrom(
                        shape:StadiumBorder(),
                        primary:d_red,
                        padding:EdgeInsets.all(13),
                        ),
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                       
                        SizedBox(width:10),
                        Text('LES COULEURS'),
                      ],
                     ),
                     ),
                   
               
                ],
                ),
               ),
              ),
           
            
            ],
            ),
        ),
        );
  }
  }
