import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/constants/strings.dart';
import 'package:store/presentation/screens/character_details.dart';
import 'package:store/presentation/screens/character_screen.dart';

class AppRouter{
  Route? generateRoute(RouteSettings settings){
    switch(settings.name){
      case charactersScreen:
        return MaterialPageRoute(builder:(_)=>const CharacterScreen());
        case characterDetailsScreen:
        return MaterialPageRoute(builder:(_)=>const CharacterDetailsScreen());

    }
  }
}