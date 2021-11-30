import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store/data/models/episode_model.dart';
import 'package:store/data/repositories/episodes_repo.dart';

part 'episodes_state.dart';

class EpisodesCubit extends Cubit<EpisodesState> {
  EpisodesRepo _episodesRepo;
  List<EpisodeModel> episodes;

  EpisodesCubit(this.episodes, this._episodesRepo) : super(EpisodesInitial());

  List<EpisodeModel> getAllEpisodes() {
    _episodesRepo.getAllEpisodes().then((episodes) {
      emit(EpisodesLoaded(episodes));
      this.episodes = episodes;
    });
    return episodes;
  }
}
