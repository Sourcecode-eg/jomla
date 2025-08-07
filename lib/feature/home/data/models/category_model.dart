class CategoryModel {
  final int id;
  final String nameAr;
  final String nameEn;
  final String iconPath;
  final int storeId;

  CategoryModel({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.iconPath,
    required this.storeId,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? 0,
      nameAr: json['name_Ar'] ?? '',
      nameEn: json['name_En'] ?? '',
      iconPath: json['icon_path'] ?? '',
      storeId: json['storeId'] ?? 0,
    );
  }
}
