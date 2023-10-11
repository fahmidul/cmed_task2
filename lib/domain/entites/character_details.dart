class CharacterDetails {
  String? id;
  String? name;
  String? gender;
  String? house;
  String? dateOfBirth;
  String? eyeColour;
  String? hairColour;
  String? actor;
  bool? alive;
  String? image;

  CharacterDetails({this.id, this.name, this.gender, this.house, this.dateOfBirth, this.eyeColour, this.hairColour, this.actor, this.alive, this.image});

  @override
  String toString() {
    return 'CharacterDetailsModel{id: $id, name: $name, gender: $gender, house: $house, dateOfBirth: $dateOfBirth, eyeColour: $eyeColour, hairColour: $hairColour, actor: $actor, alive: $alive, image: $image}';
  }
}
