import './shops_model.dart';

class ShopsResultModel {
  Metadata metadata;
  List<ShopModel> shops;

  ShopsResultModel({this.metadata, this.shops});

  ShopsResultModel.fromJson(Map<String, dynamic> json) {
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    if (json['shops'] != null) {
      shops = new List<ShopModel>();
      json['shops'].forEach((v) {
        shops.add(new ShopModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.metadata != null) {
      data['metadata'] = this.metadata.toJson();
    }
    if (this.shops != null) {
      data['shops'] = this.shops.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Metadata {
  Null page;
  int pageSize;
  int totalPages;

  Metadata({this.page, this.pageSize, this.totalPages});

  Metadata.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    pageSize = json['page_size'];
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['page_size'] = this.pageSize;
    data['total_pages'] = this.totalPages;
    return data;
  }
}
