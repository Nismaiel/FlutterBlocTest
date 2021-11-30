part of 'episodes_cubit.dart';

@immutable
abstract class EpisodesState {}

class EpisodesInitial extends EpisodesState {}
class EpisodesLoaded extends EpisodesState{
  final List<EpisodeModel>episodes;
  EpisodesLoaded(this.episodes);
}