import 'package:flutter/material.dart';
import 'package:food/ServicePreference.dart';
import 'package:food/clients.dart';
import 'package:food/model/myclient.dart';
import 'package:food/service/client_service.dart';
import 'package:food/social-Page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'delayed_animation.dart';
import 'package:food/main.dart';
import 'login_page.dart';
import 'Menu.dart';


 class AjoutClient extends StatelessWidget {
    ClientService clientService = ClientService();
    TextEditingController controllerPrenom=TextEditingController();
    TextEditingController controllerNom=TextEditingController();
    TextEditingController controllerTelephone=TextEditingController();
    TextEditingController controllerAdresse=TextEditingController();

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
                      delay: 10, 
                      child: Text(
                        'Entrer les informations du client',
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
               SizedBox(height:35),

               loginForm(
                  controllerPrenom: controllerPrenom,
                  controllerNom: controllerNom,
                  controllerAdresse: controllerAdresse,
                  controllerTelephone: controllerTelephone,
               ),
    
               SizedBox(height:125),
               delayedAnimation(
                delay: 100, 
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
                        String prenom=controllerPrenom.text;
                        String nom=controllerNom.text;
                        String adresse=controllerAdresse.text;
                        int telephone=int.parse(controllerTelephone.text);
                        clientService.addClient(MyClient(
                          prenom: prenom,
                          nom: nom,
                          adresse: adresse,
                          telephone: telephone,
                        ));
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>client()));

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
                              delay:100,
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

  TextEditingController controllerPrenom=TextEditingController();
  TextEditingController controllerNom=TextEditingController();
  TextEditingController controllerTelephone=TextEditingController();
  TextEditingController controllerAdresse=TextEditingController();

  loginForm({
    required this.controllerPrenom,
    required this.controllerNom,
    required this.controllerAdresse,
    required this.controllerTelephone,
    Key ? key
  }):super(key: key);
  @override
    State<loginForm> createState() => _loginFormState();
}

class _loginFormState extends State<loginForm> {
  var _obscureText= true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
      horizontal:30,
      ),
        child:Column(
          children:[
            delayedAnimation(
            delay: 100,
             child: TextField(
              controller: widget.controllerNom,
              decoration:InputDecoration(
                labelText:'Entrer la nom',
                labelStyle: TextStyle(
                  color:Colors.grey[400],
                ),
              ),
             ),
             ),
            SizedBox(height:30),
            delayedAnimation(
              delay: 100, 
              child: TextField(
                controller: widget.controllerPrenom,
                obscureText: _obscureText,
                decoration:InputDecoration(
                  labelStyle:TextStyle(
                    color:Colors.grey[400],
                ),
                labelText:'entrer le prenom',
                suffixIcon:IconButton(
                    icon:Icon(
                      Icons.visibility,
                      color:Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText= !_obscureText;
                      });
                    },
                    ),
                ),
                ),
              ),
              SizedBox(height:30),
                      delayedAnimation(
            delay: 100,
             child: TextField(
              controller: widget.controllerAdresse,
              decoration:InputDecoration(
                labelText:'adress du clients',
                labelStyle: TextStyle(
                  color:Colors.grey[400],
                ),
              ),
             ),
             ),
              SizedBox(height:30),
                      delayedAnimation(
            delay: 100,
             child: TextField(
              controller: widget.controllerTelephone,
              
              decoration:InputDecoration(
                labelText:'Tephone du client',
                
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