import 'package:flutter/material.dart';
import 'package:food/ServicePreference.dart';
import 'package:food/social-Page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'delayed_animation.dart';
import 'package:food/main.dart';
import 'login_page.dart';

class ChambreHotel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title:Text('LISTES DES CHAMBRES'),
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
                        primary:Colors.white,
                        padding:EdgeInsets.all(13),
                        ),
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                       
                        SizedBox(width:10),
                        Text(
                          'LISTE DES CHAMBRE LIBRE',
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
                        primary:Colors.white,
                        padding:EdgeInsets.all(13),
                        ),
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                       
                        SizedBox(width:10),
                        Text(
                          'LISTES DES CHAMBRE OCCUPEES',
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
                        primary:Colors.white,
                        padding:EdgeInsets.all(13),
                        ),
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                       
                        SizedBox(width:10),
                        Text(
                          'LISTE DES CHAMBRE RESERVEES',
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
                        primary:Colors.white,
                        padding:EdgeInsets.all(13),
                        ),
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                       
                        SizedBox(width:10),
                        Text(
                          'MODIFIE LA CLASSE D UN CHAMBRE',
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
