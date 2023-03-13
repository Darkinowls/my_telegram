import 'entity.dart';

class Contact extends Entity{
  // photo?
  late String name;
  late String? tag;
  late final String? phone;

  Contact.name({required this.name, this.tag, this.phone});
}