class Person {
  int? id;
  final String firstName;
  final String lastName;

  Person(this.firstName, this.lastName, {this.id});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "firstName": firstName,
      "lastName": lastName,
    };
  }
}
