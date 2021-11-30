import 'package:store/data/models/episode_model.dart';
import 'package:store/data/web_services/episodes_service.dart';

class EpisodesRepo{
  EpisodeService service=EpisodeService();
  EpisodesRepo(this.service);

  Future<List<EpisodeModel>>getAllEpisodes()async{
    final episodes=await service.getAllEpisodes();
    return episodes.map((episode) =>EpisodeModel.fromJson(episode)).toList();
  }

}