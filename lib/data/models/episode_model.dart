import 'dart:core';

class EpisodeModel{
  late int episodeId;
  late String title;
  late int season;
  late int episode;
  late String airDate;
  late List<String>characters;

EpisodeModel.fromJson(Map<String,dynamic>json){
  episodeId=json['episode_id'];
  title=json['title'];
  season=json['season'];
  episode=json['episode'];
  airDate=json['air_date'];
  characters=json['characters'];

}

}