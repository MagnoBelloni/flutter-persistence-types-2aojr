import 'package:floor/floor.dart';
import 'package:persistence_types/floor/models/book.dart';

@dao
abstract class BookDAO {
  @Query('SELECT * FROM Book')
  Future<List<Book>> findAllBooks();

  @insert
  Future<int> insertBook(Book book);

  @delete
  Future<int> deleteBook(Book book);
}