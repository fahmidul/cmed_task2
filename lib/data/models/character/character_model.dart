class CharacterModel {
  String? id;
  String? name;
  String? house;
  String? actor;
  String? image;


  CharacterModel({this.id, this.name, this.house, this.actor, this.image});

  @override
  String toString() {
    return 'CharacterModel{id: $id, name: $name, house: $house, actor: $actor, image: $image}';
  }

  CharacterModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        house = json['house'],
        actor = json['actor'],
        image = json['image'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'house': house,
        'actor': actor,
        'image': image,
      };
}
