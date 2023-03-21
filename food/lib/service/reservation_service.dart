

import 'dart:convert';

import 'package:food/model/myclient.dart';
import 'package:food/service/my_service.dart';
import 'package:http/http.dart';
import 'package:food/service/reservation_service.dart';
import 'package:food/AjoutReservation.dart';
import 'package:food/model/myreservation.dart';

class ReservationService extends MyService{

  static List<MyReservation> reservationList = [
    MyReservation(id: 1,nom:"Ndiaye",prenom: "Mamadou",  date_arrivee: "27/12/2021  ",date_depart: '27/01/2022 ',tarif: '35000  ', id_client:773636363,num_chambre:1),
    MyReservation(id: 1, nom:"Lamine",prenom: "Zongo",  date_arrivee: "27/01/2021  ",date_depart: '27/03/2022  ',tarif: '70000  ', id_client:773636363,num_chambre:1),
  ];
  // permet d'ajouter un nouveau client
  Future<MyReservation> addReservation(MyReservation myReservation) async{
    ///return  postRequest<MyClient>(
    //   url: '/clients',
    //   body:myClient.toMap(),
    //   success: (json){
    //     return MyClient.fromJson(jsonDecode(json));
    //   }
    // );

     reservationList.add(myReservation);
     return myReservation;
  }

  // permet de recuperer la liste des clientes
  Future<List<MyReservation>> listReservation()async{
    // return getRequest<List<MyClient>>(
    //   url: '/clients',
    //   success: (json){
    //     List<MyClient> list=jsonDecode(json);
    //     return list.map((e) => MyClient.fromJson(e)).toList();
    //   }
    // );

    return reservationList;
  }

  


}



