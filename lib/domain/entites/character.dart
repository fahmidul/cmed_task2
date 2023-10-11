class Character {
  String? id;
  String? name;
  String? house;
  String? actor;
  String? image;

  Character({this.id, this.name, this.house, this.actor, this.image});

  @override
  String toString() {
    return 'Character{id: $id, name: $name, house: $house, actor: $actor, image: $image}';
  }
}
