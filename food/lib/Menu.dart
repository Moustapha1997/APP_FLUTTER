import 'package:flutter/material.dart';
import 'package:food/Gestion_Hotel.dart';
import 'package:food/ServicePreference.dart';
import 'package:food/social-Page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'delayed_animation.dart';
import 'package:food/main.dart';
import 'login_page.dart';
import 'Chambre_Hotel.dart';
import 'Gestion_Hotel.dart';
import 'client.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title:Text('Menu Hotel'),
            backgroundColor: d_red,
        ) ,
        body:SingleChildScrollView(
          child:Column(
            children:[
          

              delayedAnimation(
                delay: 3500,
               child: Container(
                margin:EdgeInsets.symmetric(
                  vertical:14,
                  horizontal: 40,
                ),
                child:Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                      
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>GestionHotel(),
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
                        Text('GESTION DE L HOTEL'),
                      ],
                     ),
                     ),
                   
               
                ],
                ),
               ),
              ),
                SizedBox(height:35),
                          delayedAnimation(
                delay: 3500,
               child: Container(
                margin:EdgeInsets.symmetric(
                  vertical:14,
                  horizontal: 40,
                ),
                child:Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                      
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>ChambreHotel(),
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
                        Text('LES CHAMBRES'),
                      ],
                     ),
                     ),
                   
               
                ],
                ),
               ),
              ),
                            SizedBox(height:35),
                          delayedAnimation(
                delay: 3500,
               child: Container(
                margin:EdgeInsets.symmetric(
                  vertical:14,
                  horizontal: 40,
                ),
                child:Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                      
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>client(),
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
                        Text('LES CLIENTS'),
                      ],
                     ),
                     ),
                   
               
                ],
                ),
               ),
              ),
                              SizedBox(height:35),
                          delayedAnimation(
                delay: 3500,
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
                        Text('LES RESERVATIONS'),
                      ],
                     ),
                     ),
                   
               
                ],
                ),
               ),
              ),
                              SizedBox(height:35),
                          delayedAnimation(
                delay: 3500,
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
                        Text('LES FACTURES'),
                      ],
                     ),
                     ),
                   
               
                ],
                ),
               ),
              ),
              SizedBox(height:35),
              delayedAnimation(
                delay: 3500,
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
                        Text('LES STATISTIQUES'),
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
