class OfferModel {
  final String offerValue;
  final double price;
  final DateTime startDate;
  final DateTime endDate;
  final int productId;
  final String productNameAr;
  final String descriptionAr;
  final String imagePath;

  const OfferModel({
    required this.offerValue,
    required this.price,
    required this.startDate,
    required this.endDate,
    required this.productId,
    required this.productNameAr,
    required this.descriptionAr,
    required this.imagePath,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      offerValue: json['offerValue'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      startDate: DateTime.tryParse(json['start_date'] ?? '') ?? DateTime.now(),
      endDate: DateTime.tryParse(json['end_date'] ?? '') ?? DateTime.now(),
      productId: json['productId'] ?? 0,
      productNameAr: json['product_Name_Ar'] ?? '',
      descriptionAr: json['descriptionAr'] ?? '',
      imagePath: json['image_Path'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'offerValue': offerValue,
      'price': price,
      'start_date': startDate.toIso8601String(),
      'end_date': endDate.toIso8601String(),
      'productId': productId,
      'product_Name_Ar': productNameAr,
      'descriptionAr': descriptionAr,
      'image_Path': imagePath,
    };
  }
}
