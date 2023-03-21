import 'package:flutter/material.dart';
import 'package:food/ServicePreference.dart';
import 'package:food/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Welcome_page.dart';


const d_red = const Color(0xFFF9717D);
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  Future<bool?> estInscrit()async{
    final prefs= await ServicePreferences.pref;
    return prefs.getBool('inscrit');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion des Hotels',
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool?>(
        future: estInscrit(),
        builder:(context,state){
          if(state.hasData){
            if(state.data!=null && state.data!){
              print("l'utilisateur est inscrit");
              return loginPage();
            }
          }
          print("l'utilisateur n'est pas inscript");
          return WelcomePage();
        } ,
      )
      );
  
  }
}


  


