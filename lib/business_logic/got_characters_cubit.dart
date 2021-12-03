import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store/data/models/got_model.dart';
import 'package:store/data/repositories/got_character_repo.dart';

part 'got_characters_state.dart';

class GotCharactersCubit extends Cubit<GotCharactersState> {
  GotCharacterRepo characterRepo;
  List<GotCharacters>gotCharacters=[];

  GotCharactersCubit(this.gotCharacters,this.characterRepo) : super(GotCharactersInitial());

List<GotCharacters>getAllCharacters(){
  characterRepo.getAllCharacters().then((characters){
    emit(CharactersLoaded(characters));
    gotCharacters=characters;
  });
  return gotCharacters;
}
}
