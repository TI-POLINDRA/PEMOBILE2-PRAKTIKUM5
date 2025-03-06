class CategoryModel {
  final String name;
  final String image;
  final String? description;

  CategoryModel(this.name, this.description, this.image);

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(json['name'], json['description'], json['image']);
  }
}
