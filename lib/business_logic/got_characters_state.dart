part of 'got_characters_cubit.dart';

@immutable
abstract class GotCharactersState {}

class GotCharactersInitial extends GotCharactersState {}
class CharactersLoaded extends GotCharactersState{
  final List<GotCharacters>characters;
  CharactersLoaded(this.characters);
}
