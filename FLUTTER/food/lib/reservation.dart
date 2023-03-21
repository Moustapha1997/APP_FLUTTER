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
import 'package:food/reservation.dart';
import 'AjoutReservation.dart';
import 'package:food/service/reservation_service.dart';

class reservation extends StatelessWidget {
  ReservationService reservationService=ReservationService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title:Text('LISTE DES RESERVATIONS'),
            backgroundColor: d_red,
            actions: [
              IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>AjoutReservation()));
                }, 
                icon: Icon(Icons.add)
              )
            ],
      ) ,
        body: FutureBuilder(
          future: reservationService.listReservation(),
          builder: (context,snap){
            if(snap.hasData){
              return ListView.builder(
                itemBuilder: (context,index){
                  return ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text('${snap.data![index].nom} ${snap.data![index].prenom}'),
                    subtitle: Text('${snap.data![index].date_arrivee} ${snap.data![index].date_depart}${snap.data![index].num_chambre}'),

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
