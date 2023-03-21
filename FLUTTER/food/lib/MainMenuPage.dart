import 'package:flutter/material.dart';
import 'package:food/ServicePreference.dart';
import 'package:food/social-Page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'delayed_animation.dart';
import 'package:food/main.dart';
import 'login_page.dart';
import 'Menu.dart';

 class MainMenuPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
            elevation: 0,
        backgroundColor:Colors.white.withOpacity(0) ,
        leading:IconButton(
          icon:Icon(
            Icons.close,
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
              Container(
                margin:EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal:30,
                ),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    delayedAnimation(
                      delay: 1500, 
                      child: Text(
                        'Entrer les Informations de votre Hotel',
                        style:GoogleFonts.poppins(
                          color: d_red,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                        
                      ),
                      ),

                  ],
                ),
              ),
               SizedBox(height:10),

               loginForm(),
    
               SizedBox(height:15),
               delayedAnimation(
                delay: 1000, 
                child : ElevatedButton(
                  
                  style:ElevatedButton.styleFrom(
                    shape:StadiumBorder(),
                    primary:d_red,
                    padding: EdgeInsets.symmetric(
                      horizontal: 125,
                      vertical:13,
                    ),
                  ),
                    child:Text(
                      'Enregistrer',
                      style:GoogleFonts.poppins(
                        color:Colors.white,
                        fontSize:15,
                        fontWeight: FontWeight.w500,
                      ),
                      ),
                      onPressed: (){
                        Navigator.push(
                          context, 
                        MaterialPageRoute(
                        builder: (context) => Menu(),
                        ),
                        );
                      },
                ),
                ),
                SizedBox(height:90),
                Align(
                  alignment: Alignment.centerRight,
                  child:Row(
                    children: [
                      Padding(
                        padding:EdgeInsets.only(right:35),
                          child:TextButton(
                            onPressed: () {
                              passerAInscrit();
                              Navigator.push(context,MaterialPageRoute(builder:(context)=>socialPage()));
                            },
                            child :delayedAnimation(
                              delay:100,
                              child:Text(
                                "DEINSCRIT",
                                style: GoogleFonts.poppins(
                                  color:Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                              ),
                          ),
                            
                          ),
                          Spacer(),
                      Padding(
                        padding:EdgeInsets.only(right:35),
                          child:TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child :delayedAnimation(
                              delay:6500,
                              child:Text(
                                "SKIP",
                                style: GoogleFonts.poppins(
                                  color:Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                              ),
                          ),
                            
                          ),
                    ],
                  ),
                    ),
                 ],
          ),
        ) ,
      );
    
  }
  Future<void> passerAInscrit() async {
    print('Debut inscription');
    final prefs= await ServicePreferences.pref;
    (await prefs).setBool('inscrit', false);
    print('incription enregistrer');
  }
}


class loginForm extends StatefulWidget {
@override
  State<loginForm> createState() => _loginFormState();
}

class _loginFormState extends State<loginForm> {
  var _obscureText= true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
      horizontal:10,
      ),
        child:Column(
          children:[
            delayedAnimation(
            delay: 1500,
             child: TextField(
              decoration:InputDecoration(
                labelText:"Entrer le nom de votre hotel",
                labelStyle: TextStyle(
                  color:Colors.grey[400],
                ),
              ),
             ),
             ),
            SizedBox(height:10),
            delayedAnimation(
              delay: 1500, 
              child: TextField(
                obscureText: _obscureText,
                decoration:InputDecoration(
                  labelStyle:TextStyle(
                    color:Colors.grey[400],
                ),
                labelText:"snombre d'étage",
                
                ),
                ),
              ),
              SizedBox(height:10),
                      delayedAnimation(
            delay: 1500,
             child: TextField(
              decoration:InputDecoration(
                labelText:"nombre de chambre par étage",
                labelStyle: TextStyle(
                  color:Colors.grey[400],
                ),
              ),
             ),
             ),

              SizedBox(height:10),
             
              SizedBox(height:10),
                      delayedAnimation(
            delay: 1500,
             child: TextField(
              decoration:InputDecoration(
                labelText:"Tarif normal economique",
                labelStyle: TextStyle(
                  color:Colors.grey[400],
                ),
              ),
             ),
             ),

              SizedBox(height:10),
                      delayedAnimation(
            delay: 1500,
             child: TextField(
              decoration:InputDecoration(
                labelText:'Tarif normal standart',
                labelStyle: TextStyle(
                  color:Colors.grey[400],
                ),
              ),
             ),
             ),

              SizedBox(height:10),
                      delayedAnimation(
            delay: 1500,
             child: TextField(
              decoration:InputDecoration(
                labelText:"tarif normal annexe",
                labelStyle: TextStyle(
                  color:Colors.grey[400],
                ),
              ),
             ),
             ),
             ],
            ),
            ) ;
       }
       



}