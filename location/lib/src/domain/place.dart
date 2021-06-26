class Places {
  List<Place> places;

  Places({this.places});

  Places.fromJson(Map<String, dynamic> json) {
    if (json['places'] != null) {
      places = <Place>[];
      json['places'].forEach((v) {
        places.add(new Place.fromJson(v));
      });
    }
  }
}

class Place {
  String id;
  String city;
  String district;
  String state;
  String country;

  Place({this.id, this.city, this.district, this.state, this.country});

  Place.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    city = json['city'];
    district = json['district'];
    state = json['state'];
    country = json['country'];
  }
}
