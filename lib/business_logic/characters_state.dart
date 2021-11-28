part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

//What happens when characters loaded!!//
class CharactersLoaded extends CharactersState {
  //This list is from character cubit file//
  final List<Character> characters;
  CharactersLoaded(this.characters);
}