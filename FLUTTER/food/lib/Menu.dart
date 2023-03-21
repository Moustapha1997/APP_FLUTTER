import 'package:flutter/material.dart';
import 'package:food/Gestion_Hotel.dart';
import 'package:food/ServicePreference.dart';
import 'package:food/reservation.dart';
import 'package:food/social-Page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'delayed_animation.dart';
import 'package:food/main.dart';
import 'login_page.dart';
import 'Chambre_Hotel.dart';
import 'Gestion_Hotel.dart';
import 'clients.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title:Text("MENU DE L'HOTEL"),
            backgroundColor: d_red,
        ) ,
        body:SingleChildScrollView(
          child:Column(
            children:[
          

              delayedAnimation(
                delay: 1000,
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
                        primary:Colors.white,
                        padding:EdgeInsets.all(13),
                        ),
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                       
                        SizedBox(width:10),
                        Text(
                          "GESTION DE L'HOTEL",
                          style:GoogleFonts.poppins(
                            color:d_red,
                            fontSize:16,
                            fontWeight: FontWeight.w500,),
                          ),
                      ],
                     ),
                     ),
                   
               
                ],
                ),
               ),
              ),
                SizedBox(height:10),
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
                      
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>ChambreHotel(),
                        ),
                        );
                      },
                      style:ElevatedButton.styleFrom(
                        shape:StadiumBorder(),
                        primary:Colors.white,
                        padding:EdgeInsets.all(13),
                        ),
                      child: Row(
                        
                        mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.chalkboard),
                        SizedBox(width:10),
                        Text(
                          'LES CHAMBRES',
                       style:GoogleFonts.poppins(
                            color:d_red,
                            fontSize:16,
                            fontWeight: FontWeight.w500,),

                        ),
                      ],
                     ),
                     ),
                   
               
                ],
                ),
               ),
              ),
                            SizedBox(height:10),
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
                      
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>client(),
                        ),
                        );
                      },
                      style:ElevatedButton.styleFrom(
                        shape:StadiumBorder(),
                        primary:Colors.white,
                        padding:EdgeInsets.all(13),
                        ),
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                       
                        SizedBox(width:10),
                        Text(
                          'LES CLIENTS',
                          style:GoogleFonts.poppins(
                            color:d_red,
                            fontSize:16,
                            fontWeight: FontWeight.w500,),
                          ),
                      ],
                     ),
                     ),
                   
               
                ],
                ),
               ),
              ),
                              SizedBox(height:10),
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
                      
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>reservation(),
                        ),
                        );
                      },
                      style:ElevatedButton.styleFrom(
                        shape:StadiumBorder(),
                        primary:Colors.white,
                        padding:EdgeInsets.all(13),
                        ),
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                       
                        SizedBox(width:10),
                        Text(
                          'LES RESERVATIONS',
                          style:GoogleFonts.poppins(
                            color:d_red,
                            fontSize:16,
                            fontWeight: FontWeight.w500,),
                          ),
                      ],
                     ),
                     ),
                   
               
                ],
                ),
               ),
              ),
                              SizedBox(height:10),
                          delayedAnimation(
                delay: 1400,
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
                        primary:Colors.white,
                        padding:EdgeInsets.all(13),
                        ),
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                       
                        SizedBox(width:10),
                        Text(
                          'LES FACTURES',
                          style:GoogleFonts.poppins(
                            color:d_red,
                            fontSize:16,
                            fontWeight: FontWeight.w500,),
                          ),
                      ],
                     ),
                     ),
                   
               
                ],
                ),
               ),
              ),
              SizedBox(height:10),
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
                        primary:Colors.white,
                        padding:EdgeInsets.all(15),
                        ),
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                       
                        SizedBox(width:1),
                        Text(
                          'LES STATISTIQUES',
                          style:GoogleFonts.poppins(
                            color:d_red,
                            fontSize:16,
                            fontWeight: FontWeight.w500,),
                          ),
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
