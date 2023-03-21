import 'package:flutter/material.dart';
import 'package:food/ServicePreference.dart';
import 'package:food/service/client_service.dart';
import 'package:food/social-Page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'delayed_animation.dart';
import 'package:food/main.dart';
import 'login_page.dart';
import 'Ajout_Client.dart';

class client extends StatelessWidget {
  ClientService clientService=ClientService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title:Text('LISTE DES CLIENTS'),
            backgroundColor: d_red,
            actions: [
              IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>AjoutClient()));
                }, 
                icon: Icon(Icons.add)
              )
            ],
      ) ,
        body: FutureBuilder(
          future: clientService.listClient(),
          builder: (context,snap){
            if(snap.hasData){
              return ListView.builder(
                itemBuilder: (context,index){
                  return ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text('${snap.data![index].prenom} ${snap.data![index].nom}'),
                    subtitle: Text('${snap.data![index].adresse} ${snap.data![index].telephone}'),
                  );
                },
                itemCount:snap.data!.length , 
              );
            }
            return Container();
          },

          )
        );
  }
  }
