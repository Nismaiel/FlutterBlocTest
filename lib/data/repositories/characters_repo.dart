import 'package:store/data/models/characters_model.dart';
import 'package:store/data/web_services/characters_services.dart';

class CharactersRepo {
  final CharactersServices charactersServices;
  CharactersRepo(this.charactersServices);


  //Map Data To Json Then pass it to cubit as a list//
Future<List<Character>>getAllCharacters()async{

  final characters=await charactersServices.getAllCharacters();
  return characters.map((char) => Character.fromJson(char)).toList();
}

}
