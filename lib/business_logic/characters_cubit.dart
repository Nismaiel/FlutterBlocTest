import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store/data/models/characters_model.dart';
import 'package:store/data/repositories/characters_repo.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepo _charactersRepo;
  List<Character>characters=[];

  CharactersCubit(this._charactersRepo,this.characters) : super(CharactersInitial());

  //getting data from repo//
  List<Character> getAllCharacters() {
    _charactersRepo.getAllCharacters().then((characters) {
      //emit streams the data to the ui//
      emit(CharactersLoaded(characters));
      this.characters=characters;
    });
    return characters;
  }
}
