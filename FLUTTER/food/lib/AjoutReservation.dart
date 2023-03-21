import 'package:flutter/material.dart';
import 'package:food/ServicePreference.dart';
import 'package:food/clients.dart';
import 'package:food/model/myclient.dart';
import 'package:food/model/myreservation.dart';
import 'package:food/service/client_service.dart';
import 'package:food/social-Page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'delayed_animation.dart';
import 'package:food/main.dart';
import 'login_page.dart';
import 'Menu.dart';
import 'package:food/service/reservation_service.dart';




 class AjoutReservation extends StatelessWidget {
  TextEditingController controllerPrenom=TextEditingController();
    TextEditingController controllerNom=TextEditingController();
    ReservationService reservationService = ReservationService();
    TextEditingController controllerDateArrivee=TextEditingController();
    TextEditingController controllerDateDepart=TextEditingController();
    TextEditingController controllerTarif=TextEditingController();
    TextEditingController controllerNumChambre=TextEditingController();

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
                  controllerNom: controllerNom,
                  controllerPrenom: controllerPrenom,
                  controllerDateArrivee: controllerDateArrivee,
                  controllerDateDepart: controllerDateDepart,
                  controllerTarif: controllerTarif,
                  controllerNumChambre: controllerNumChambre,
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
                         String nom=controllerNom.text;
                          String prenom=controllerPrenom.text;
                        String date_arrivee=controllerDateArrivee.text;
                        String date_depart=controllerDateDepart.text;
                        String tarif=controllerDateDepart.text;
                         int num_chambre=int.parse(controllerNumChambre.text);
                        reservationService.addReservation(
                          MyReservation(
                            nom: nom,
                            prenom: prenom,
                          date_arrivee: date_arrivee,
                          date_depart: date_depart,
                          tarif: tarif,
                          num_chambre: num_chambre,
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
    TextEditingController controllerDateArrivee=TextEditingController();
    TextEditingController controllerDateDepart=TextEditingController();
    TextEditingController controllerTarif=TextEditingController();
    TextEditingController controllerNumChambre=TextEditingController();

  loginForm({
    required this.controllerNom,
    required this.controllerPrenom,
     required this.controllerDateArrivee,
    required this.controllerDateDepart,
    required this.controllerTarif,
    required this.controllerNumChambre,
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
                labelText:'Entrer le nom',
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
                labelText:'Entrer le prenom',
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
                controller: widget.controllerDateArrivee,
                obscureText: _obscureText,
                decoration:InputDecoration(
                  labelStyle:TextStyle(
                    color:Colors.grey[400],
                ),
                labelText:'Entrer la date d arrivee',
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
                controller: widget.controllerDateDepart,
                obscureText: _obscureText,
                decoration:InputDecoration(
                  labelStyle:TextStyle(
                    color:Colors.grey[400],
                ),
                labelText:'entrer la date de depart',
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
              controller: widget.controllerTarif,
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
              controller: widget.controllerNumChambre,
              
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