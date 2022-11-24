import 'dart:async';

import 'package:floor/floor.dart';
import 'package:persistence_types/floor/daos/book_dao.dart';
import 'package:persistence_types/floor/models/book.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Book])
abstract class AppDatabase extends FloorDatabase {
  BookDAO get bookDAO;
}