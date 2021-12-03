
class Character{
late int charId;
late String name;
late String nickname;
late String image;
late String deadOrAlive;
late List<dynamic>? jobs;
late List <dynamic>?appearanceOfSeasonsBB;
late String actorName;
late String category;
late List<dynamic>appearanceOfBetterCallSaul;

Character.fromJson(Map<String,dynamic> json){
  charId=json['char_id'];
  name=json['name'];
  nickname=json['nickname'];
  image=json['img'];
  deadOrAlive=json['status'];
  jobs=json['occupation'];
  appearanceOfSeasonsBB=json['apperance'];
  actorName=json['portrayed'];
  category=json['category'];

}

}