import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/business_logic/characters_cubit.dart';
import 'package:store/constants/strings.dart';
import 'package:store/data/models/characters_model.dart';
import 'package:store/data/repositories/characters_repo.dart';
import 'package:store/data/web_services/characters_services.dart';
import 'package:store/presentation/screens/character_details.dart';
import 'package:store/presentation/screens/character_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AppRouter {
  late CharactersRepo charactersRepo;
  late CharactersCubit charactersCubit;
  List<Character> characters = [];

  AppRouter() {
    charactersRepo = CharactersRepo(CharactersServices());
    charactersCubit = CharactersCubit(charactersRepo, characters);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
            builder: (_){
              return BlocProvider(
                create:(ctx)=> charactersCubit,
                child:const CharacterScreen(),
              );
            });

      case characterDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const CharacterDetailsScreen());
    }
  }
}
