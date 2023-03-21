

import 'dart:convert';

import 'package:food/model/myclient.dart';
import 'package:food/service/my_service.dart';
import 'package:http/http.dart';

class ClientService extends MyService{

  static List<MyClient> clientList = [
    MyClient(id: 1,prenom: "Modou",nom: 'Ndiaye',adresse: 'fann', telephone:773636363),
    MyClient(id: 1,prenom: "Niokhor",nom: 'Zongo',adresse: 'dakar', telephone:77897654)
  ];

  // permet d'ajouter un nouveau client
  Future<MyClient> addClient(MyClient myClient) async{
    // return  postRequest<MyClient>(
    //   url: '/clients',
    //   body:myClient.toMap(),
    //   success: (json){
    //     return MyClient.fromJson(jsonDecode(json));
    //   }
    // );

     clientList.add(myClient);
     return myClient;
  }

  // permet de recuperer la liste des clientes
  Future<List<MyClient>> listClient()async{
    // return getRequest<List<MyClient>>(
    //   url: '/clients',
    //   success: (json){
    //     List<MyClient> list=jsonDecode(json);
    //     return list.map((e) => MyClient.fromJson()).toList();
    //   }
    // );

    return clientList;
  }

  


}