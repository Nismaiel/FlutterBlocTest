import 'package:dio/dio.dart';
import 'package:store/constants/strings.dart';

class GotService {
  late Dio dio;

  gotServices() {
    BaseOptions options = BaseOptions(
        baseUrl: gotUrl,
        connectTimeout: 1000 * 20,
        receiveTimeout: 1000 * 20,
        receiveDataWhenStatusError: true);
  dio=Dio(options);
  }

  Future<List<dynamic>>getAllCharacters()async{
    try{
      Response response=await dio.get('v2/Characters');
      return response.data;
    }catch(e){
      print(e.toString());
      return[];
    }
  }
}
