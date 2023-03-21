
import 'package:http/http.dart' as http;

class MyService{
  static final String _server="http://192.168.1.1";

  //permet de traiter les request post
  Future<T> postRequest<T>({required String url,required Map<String,dynamic> body,required T Function(String) success}) async{
     var response = await http.post(
              Uri.https(_server, url),
               body: body
    );
    if(response.statusCode==200){
      return success(response.body);
    }
    throw Exception('erreur request $url');
    
  }

  //pour traiter des requete get
  Future<T> getRequest<T>({required String url,required T Function(String) success}) async{
     var response = await http.get(
              Uri.https(_server, url),
    );
    if(response.statusCode==200){
      return success(response.body);
    }
    throw Exception('erreur request $url');
    
  }

  
}