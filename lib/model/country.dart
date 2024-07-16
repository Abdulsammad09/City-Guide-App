class Country {
  final int id;
  final String name;
  final String imagePath;

  Country({required this.id, required this.name, required this.imagePath});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      name: json['name'],
      imagePath: json['image_path'],
    );
  }
}
