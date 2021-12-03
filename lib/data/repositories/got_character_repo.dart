import 'package:store/data/models/got_model.dart';
import 'package:store/data/web_services/got_service.dart';

class GotCharacterRepo{
  GotService gotService;
  GotCharacterRepo(this.gotService);

  Future<List<GotCharacters>>getAllCharacters()async{
    final characters=await gotService.getAllCharacters();
    return characters.map((characters) =>GotCharacters.fromJson(characters) ).toList();
  }
}