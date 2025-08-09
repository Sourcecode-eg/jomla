class BrandModel {
  final int? id;
  final String? nameAr;
  final String? nameEn;
  final String iconPath;

  const BrandModel({this.id, this.nameAr, this.nameEn, required this.iconPath});

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'] ?? 0,
      nameAr: json['name_Ar'] ?? '',
      nameEn: json['name_En'] ?? '',
      iconPath: json['icon_path'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_Ar': nameAr,
      'name_En': nameEn,
      'icon_path': iconPath,
    };
  }
}
