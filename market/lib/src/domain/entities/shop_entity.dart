import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:market/src/data/models/shops_model.dart';

class ShopEntity extends Equatable {
  final String id;
  final String placeId;
  final String shopCategoryId;
  final String name;
  final String number;
  final double ratings;
  final Address address;

  const ShopEntity(
      {@required this.id,
      @required this.placeId,
      @required this.shopCategoryId,
      @required this.name,
      @required this.number,
      @required this.ratings,
      this.address});

  @override
  List<Object> get props => [id, name];

  @override
  bool get stringify => true;
}
