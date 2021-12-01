import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/business_logic/episodes_cubit.dart';
import 'package:store/constants/colors.dart';
import 'package:store/data/models/episode_model.dart';

class EpisodesScreen extends StatefulWidget {
  const EpisodesScreen({Key? key}) : super(key: key);

  @override
  State<EpisodesScreen> createState() => _EpisodesScreenState();
}

class _EpisodesScreenState extends State<EpisodesScreen> {
  List<EpisodeModel>? allEpisodes;

  @override
  void initState() {
    super.initState();
    allEpisodes = BlocProvider.of<EpisodesCubit>(context).getAllEpisodes();
  }

  Widget? buildWidgetBloc() {
    return BlocBuilder<EpisodesCubit, EpisodesState>(
      builder: (ctx, state) {
        if (state is EpisodesLoaded) {
          allEpisodes = state.episodes;
          return buildLoadedListWidget();
        } else {
          return const CircularProgressIndicator(
            color: MyColors.myYellow,
          );
        }
      },
    );
  }

  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(color: MyColors.myGrey, child: Column(
        children: [buildEpisodeList()],
      ),),
    );
  }

  Widget buildEpisodeList() {
    return GridView.builder(
      shrinkWrap: true,
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            childAspectRatio: 2 / 3),
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: allEpisodes!.length,
        itemBuilder: (ctx,index){
          return episodeItem(allEpisodes![index]);
        }
    );
  }
  Widget episodeItem(EpisodeModel episode){
    return Text(episode.title.toString(),style:const TextStyle(color: Colors.white,fontSize: 18),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Episodes'),),
      body: buildWidgetBloc(),
    );
  }
}
