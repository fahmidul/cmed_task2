class CharacterDetailsModel {
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

  CharacterDetailsModel({this.id, this.name, this.gender, this.house, this.dateOfBirth, this.eyeColour, this.hairColour, this.actor, this.alive, this.image});

  @override
  String toString() {
    return 'CharacterDetailsModel{id: $id, name: $name, gender: $gender, house: $house, dateOfBirth: $dateOfBirth, eyeColour: $eyeColour, hairColour: $hairColour, actor: $actor, alive: $alive, image: $image}';
  }

  CharacterDetailsModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        gender = json['gender'],
        house = json['house'],
        dateOfBirth = json['dateOfBirth'],
        eyeColour = json['eyeColour'],
        hairColour = json['hairColour'],
        actor = json['actor'],
        alive = json['alive'],
        image = json['image'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'gender': gender,
        'house': house,
        'dateOfBirth': dateOfBirth,
        'eyeColour': eyeColour,
        'hairColour': hairColour,
        'actor': actor,
        'alive': alive,
        'image': image,
      };
}
