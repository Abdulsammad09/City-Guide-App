class City {
  final int id;
  final String name;
  final String imageUrl;

  City({required this.id, required this.name, required this.imageUrl});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: int.parse(json['id'].toString()),
      name: json['name'],
      imageUrl: json['image_url'],
    );
  }
}

class Hotel {
  final int id;
  final String name;
  final String imageUrl;

  Hotel({required this.id, required this.name, required this.imageUrl});

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      id: int.parse(json['id'].toString()),
      name: json['name'],
      imageUrl: json['image_url'],
    );
  }
}

// Repeat similarly for Restaurant and Event
