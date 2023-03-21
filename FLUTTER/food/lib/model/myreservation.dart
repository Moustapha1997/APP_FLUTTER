 
class MyReservation{
  int ? id;
  String ? date_arrivee;
  String ? date_depart;
  String? tarif;
   int? id_client;
   int? num_chambre;
   String?nom;
   String? prenom;

  MyReservation({this.id,this.nom,this.prenom, this.date_arrivee, this.date_depart, this.tarif,this.id_client,this.num_chambre});

  MyReservation.fromJson(Map<String,dynamic> json):
    id=json['id_reservation'],
    nom=json['nom'],
    prenom=json['prenom'],
    date_arrivee=json['date_arrivee'],
    date_depart=json['date_depart'],
    tarif=json['tarif'],
    id_client=json['id_client'],
     num_chambre=json['num_chambre']
  ;

  Map<String,dynamic> toMap(){
    return {
      'id_reservation':id,
      'nom':nom,
      'prenom':prenom,
      'date_arrivee': date_arrivee,
      'date_depart': date_depart,
      'tarif':tarif,
      'id_client':id_client,
      'num_chambre':num_chambre,
    };
  }


}