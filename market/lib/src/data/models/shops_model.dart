import 'package:market/src/domain/entities/shop_entity.dart';

class ShopModel extends ShopEntity {
  final String id;
  final String placeId;
  final String shopCategoryId;
  final String name;
  final String number;
  final double ratings;
  final Address address;

  ShopModel(
      {this.id,
      this.placeId,
      this.shopCategoryId,
      this.name,
      this.number,
      this.ratings,
      this.address})
      : super(
            id: id,
            placeId: placeId,
            shopCategoryId: shopCategoryId,
            name: name,
            number: number,
            ratings: ratings,
            address: address);

  factory ShopModel.fromJson(Map<String, dynamic> json) {
    return ShopModel(
      id: json['id'],
      placeId: json['place_id'],
      shopCategoryId: json['shop_category_id'],
      name: json['name'],
      number: json['number'],
      ratings: json['ratings']?.toDouble() ?? 0.0,
      address: json['address'] != null
          ? new Address.fromJson(json['address'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['place_id'] = this.placeId;
    data['shop_category_id'] = this.shopCategoryId;
    data['name'] = this.name;
    data['number'] = this.number;
    data['ratings'] = this.ratings;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    return data;
  }
}

class Address {
  String street;
  String locality;
  String city;
  int pin;

  Address({this.street, this.locality, this.city, this.pin});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    locality = json['locality'];
    city = json['city'];
    pin = json['pin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street'] = this.street;
    data['locality'] = this.locality;
    data['city'] = this.city;
    data['pin'] = this.pin;
    return data;
  }
}
