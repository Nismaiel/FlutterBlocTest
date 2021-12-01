import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/business_logic/characters_cubit.dart';
import 'package:store/business_logic/episodes_cubit.dart';
import 'package:store/constants/strings.dart';
import 'package:store/data/models/characters_model.dart';
import 'package:store/data/models/episode_model.dart';
import 'package:store/data/repositories/characters_repo.dart';
import 'package:store/data/repositories/episodes_repo.dart';
import 'package:store/data/web_services/characters_services.dart';
import 'package:store/data/web_services/episodes_service.dart';
import 'package:store/presentation/screens/character_screen.dart';
import 'package:store/presentation/screens/episodes_screen.dart';

class AppRouter {
  late CharactersRepo charactersRepo;
  late CharactersCubit charactersCubit;
  List<Character> characters = [];
  late EpisodesRepo episodesRepo;
  late EpisodesCubit episodesCubit;
  List<EpisodeModel> episodes = [];

  AppRouter() {
    charactersRepo = CharactersRepo(CharactersServices());
    charactersCubit = CharactersCubit(charactersRepo, characters);
    episodesRepo = EpisodesRepo(EpisodeService());
    episodesCubit = EpisodesCubit(episodes, episodesRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(builder: (_) {
          return BlocProvider(
            create: (ctx) => charactersCubit,
            child: const CharacterScreen(),
          );
        });

      case episodesScreen:

        return MaterialPageRoute(builder: (_) {
          return BlocProvider(
            create: (ctx) => episodesCubit,
            child: const EpisodesScreen(),
          );
        });
    }
  }
}
