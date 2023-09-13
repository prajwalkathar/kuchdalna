import 'package:cloud_firestore/cloud_firestore.dart';

class IVenue {
  String? id, capacity, name, location, price;
  List<dynamic>? images;
  bool? isSelected;

  IVenue({
    this.id,
    this.capacity,
    this.name,
    this.location,
    this.price,
    this.images,
    this.isSelected,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'capacity': capacity,
      'name': name,
      'location': location,
      'price': price,
      'images': images,
      'isSelected': isSelected,
    };
  }

  factory IVenue.fromJson(Map<String, dynamic> json) => IVenue(
        id: json["id"],
        capacity: json["capacity"],
        name: json["name"],
        location: json["location"],
        price: json["price"],
        images: json["images"],
        isSelected: json["isSelected"],
      );

  factory IVenue.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return IVenue(
        id: doc.id,
        capacity: data["capacity"],
        name: data["name"],
        location: data["location"],
        price: data["price"],
        images: data["images"],
        isSelected: false);
  }
}
