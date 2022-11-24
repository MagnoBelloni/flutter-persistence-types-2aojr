import 'package:floor/floor.dart';

@entity
class Book {
  @primaryKey
  int? id;
  final String name;
  final String description;

  Book(this.name, this.description, {this.id});
}
