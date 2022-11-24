import 'package:cloud_firestore/cloud_firestore.dart';

class Car {
  final String name;
  final String model;

  DocumentReference? reference;

  Car(this.name, this.model);

  Map<String, dynamic> toJson() => {"name": this.name, "model": this.model};

  Car.fromMap(Map<String, dynamic> map, {this.reference})
      : name = map['name'],
        model = map['model'];

  Car.fromSnapshot(QueryDocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>,
            reference: snapshot.reference);
}
