
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/app_router.dart';
import 'package:store/business_logic/characters_cubit.dart';
import 'package:store/constants/colors.dart';
import 'package:store/data/models/characters_model.dart';
import 'package:store/presentation/screens/episodes_screen.dart';
import 'package:store/presentation/widgets/character_item.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  List<Character>? allCharacters;
  AppRouter? appRouter;

  @override
  void initState() {
    super.initState();
    allCharacters =
        BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget? buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (ctx, state) {
        if (state is CharactersLoaded) {
          //fetch the characters from the characters loaded in cubit state
          allCharacters = state.characters;
          return buildLoadedListWidget();
        } else {
          return const Center(
              child: CircularProgressIndicator(
                color: MyColors.myYellow,
              ));
        }
      },
    );
  }

  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [buildCharactersList()],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: allCharacters!.length,
        itemBuilder: (ctx, index) {
          return CharacterItem(
            character: allCharacters![index],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: const Text(
          'Characters',
          style: TextStyle(color: MyColors.myGrey),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const EpisodesScreen()));
              },
              child: const Text(
                'Episodes',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: buildBlocWidget(),
    );
  }
}
