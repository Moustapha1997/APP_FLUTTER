import 'package:flutter/material.dart';
import 'package:food/ServicePreference.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'delayed_animation.dart';
import 'package:food/main.dart';
import 'login_page.dart';
class socialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:Colors.white.withOpacity(0) ,
        leading:IconButton(
          icon:Icon(
            Icons.arrow_back,
            color:Colors.black,
            size:30,
            ),
              onPressed:() {
                  Navigator.pop(context);
          },
          ),
        ) ,
        body:SingleChildScrollView(
          child:Column(
            children:[
              delayedAnimation(delay: 1000, 
              child:Container(
                height:190,
                child:Image.asset('images/ima.jpg'),
              ), 
              ),
               delayedAnimation(
                delay: 1000, 
              child:Container(
                margin:const EdgeInsets.symmetric(
                  vertical:40,
                  horizontal:30,
                ),
                child:Column(
                  children:[
                    Text(
                      "Capitaine Henderson",
                      textAlign:  TextAlign.center,
                      style: GoogleFonts.poppins(
                        color:Color.fromARGB(255, 213, 117, 13),
                        fontSize:16,
                        fontWeight:FontWeight.w600
                      ),
                    ),
                    SizedBox(height:10),
                    Text(
                      "Fc dubai amoul decourager Focus si Projet bi",
                      textAlign:  TextAlign.center,
                      style: GoogleFonts.poppins(
                        color:Color.fromARGB(255, 213, 117, 13),
                        fontSize:16,
                        fontWeight:FontWeight.w600
                      )
                    ),
                  ],
                ),
              ), 
              ),
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
                        passerAInscrit();
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
                        mainAxisAlignment:MainAxisAlignment.center ,
                      children: [
                        Icon(Icons.mail_outline_outlined),
                        SizedBox(width:10),
                        Text('EMAIL')
                      ],
                     ),
                     ),
                     SizedBox(height:20),
                     ElevatedButton(
                      onPressed: () {
                          passerAInscrit();
                          Navigator.push(context, MaterialPageRoute(builder:(context)=>loginPage(),
                        ),
                        );
                      },
                      style:ElevatedButton.styleFrom(
                        shape:StadiumBorder(),
                        primary:Color(0xFF576dff),
                        padding:EdgeInsets.all(13),
                        ),
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.center ,
                      children: [
                        FaIcon(FontAwesomeIcons.facebook),
                        SizedBox(width:10),
                        Text(
                          'FACEBOOK',
                            style:GoogleFonts.poppins(
                            color:Colors.white,
                            fontSize:16,
                            fontWeight: FontWeight.w500

                          ),
                        ),
                      ],
                     ),
                     ),
                        SizedBox(height:20),
                     ElevatedButton(
                      onPressed: () {
                          passerAInscrit();
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
                        mainAxisAlignment:MainAxisAlignment.center ,
                      children: [
                        Image.asset('images/google.png',height: 20,),
                        SizedBox(width:10),
                        Text(
                          'GOOGLE',
                          style:GoogleFonts.poppins(
                            color:Colors.black,
                            fontSize:16,
                            fontWeight: FontWeight.w500

                          ),
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

  Future<void> passerAInscrit() async {
      print('Debut inscription');
      final prefs= await ServicePreferences.pref;
      (await prefs).setBool('inscrit', true);
      print('incription enregistrer');
  }
}