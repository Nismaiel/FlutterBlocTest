import 'package:dio/dio.dart';
import 'package:store/constants/strings.dart';
class CharactersServices{
  late Dio dio;
  CharactersServices(){
    BaseOptions options=BaseOptions(
      baseUrl:baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout:20*1000 ,///20 sec
      receiveTimeout:20*1000 ,///20 sec
    );
    dio=Dio(options);
  }

  //Get Data and pass it to characters repository//
  Future<List<dynamic>>getAllCharacters()async{
    try{  Response response=await dio.get('characters');
    print(response.data.toString());
    return response.data;}catch(e){
      print(e.toString());
      return[];
    }

  }

}