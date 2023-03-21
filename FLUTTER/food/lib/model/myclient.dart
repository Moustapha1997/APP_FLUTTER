 
class MyClient{
  int ? id;
  String ? nom;
  String ? prenom;
  String ? adresse;
  int ? telephone;

  MyClient({this.id, this.nom, this.prenom, this.adresse,this.telephone});

  MyClient.fromJson(Map<String,dynamic> json):
    id=json['id_client'],
    nom=json['Nom_client'],
    prenom=json['Prenom_client'],
    adresse=json['Adresse_client'],
    telephone=json['Telephone_client']
  ;

  Map<String,dynamic> toMap(){
    return {
      'id_client':id,
      'Nom_client': nom,
      'Prenom_client':prenom,
      'Adresse_client':adresse,
      'Telephone_client':telephone
    };
  }


}