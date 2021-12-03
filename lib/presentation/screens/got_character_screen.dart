import 'package:flutter/material.dart';
import 'package:store/data/models/got_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/business_logic/got_characters_cubit.dart';

class GotCharacterScreen extends StatefulWidget {
  const GotCharacterScreen({Key? key}) : super(key: key);

  @override
  _GotCharacterScreenState createState() => _GotCharacterScreenState();
}

class _GotCharacterScreenState extends State<GotCharacterScreen> {
  List<GotCharacters>?allCharacters;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<GotCharactersCubit>(context).getAllCharacters();
  }

  Widget? buildBlocWidget() {
    return BlocBuilder<GotCharactersCubit, GotCharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = state.characters;
          return buildLoadedListWidget();
        } else {
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }

  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Column(children: [
          buildCharactersList()
        ],),);
  }

  Widget buildCharactersList() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1),
        itemCount: allCharacters?.length,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (ctx, index) {
          return characterItem(allCharacters![index]);
        });
  }

  Widget characterItem(GotCharacters char) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
      child: GridTile(child: Container(color: Colors.grey,
          child: char.image.isNotEmpty ? FadeInImage.assetNetwork(
            placeholder: 'assets/images/loading.gif',
            image: char.image,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,) : Image.asset('assets/images/loading.gif')),
        footer: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
              horizontal: 15, vertical: 10),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text('${char.firstName}${char.title}${char.lastName}',
            style: const TextStyle(
              height: 1.3,
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,),
            maxLines: 2,
            textAlign: TextAlign.center,),),),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(
        'Game of thrones', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black54,),
  body: buildBlocWidget(),
    );
  }
}
