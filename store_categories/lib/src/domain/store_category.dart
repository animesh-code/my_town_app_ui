class StoreCategories {
  List<Category> categories;

  StoreCategories({this.categories});

  StoreCategories.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Category>[];
      json['categories'].forEach((v) {
        categories.add(new Category.fromJson(v));
      });
    }
  }
}

class Category {
  String id;
  String title;
  String displayImage;

  Category({this.id, this.title, this.displayImage});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    displayImage = json['display_image'];
  }
}
