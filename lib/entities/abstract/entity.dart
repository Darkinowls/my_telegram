class Entity {
  static int _idCounter = 1;
  late int _id;

  Entity() {
    _id = _idCounter;
    _idCounter += 1;
  }

  int get id => _id;
}
