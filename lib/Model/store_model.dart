class StoreModel {
  late int id;
  late String title;
  late String description;
  late String category;
  late String thumbnail;
  late int price;
  late String brand;
  late List<String> images; // New field for image URLs

  StoreModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.price,
      required this.thumbnail,
      required this.images,
      required this.brand});

  StoreModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    thumbnail = json['thumbnail'];
    price = json['price'];
    images = List<String>.from(json['images'] ?? []); // Ensure null-safety
    brand = json['brand'];
  }
}
