class GotCharacters{
   late int id;
   late  String firstName;
   late String lastName;
   late String fullName;
   late String title;
   late String family;
   late String image;

GotCharacters.fromJson(Map<String,dynamic>json){
  id=json['id'];
  firstName=json['firstName'];
  lastName=json['lastName'];
  fullName=json['fullName'];
  title=json['title'];
  family=json['family'];
  image=json['imageUrl'];
  }
}