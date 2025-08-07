// class StoreModel {
//   final int id;
//   final String nameAr;
//   final String nameEn;
//   final String userId;
//   final int storeTypeId;
//   final String descriptionEn;
//   final String descriptionAr;
//   final bool isUniqueStore;
//   final String location;
//   final double locationLat;
//   final double locationLang;
//   final bool isOpen;
//   final bool hasOffer;
//   final String offerValue;
//   final bool isDeliveryFree;
//   final String phoneNumber;
//   final int storeStatus;
//   final String iconPath;
//   final String imagePath;
//   final List<StoreWorkingDay> storeWorkingDay;

//   StoreModel({
//     this.id = 0,
//     required this.nameAr,
//     required this.nameEn,
//     required this.userId,
//     required this.storeTypeId,
//     required this.descriptionEn,
//     required this.descriptionAr,
//     required this.isUniqueStore,
//     required this.location,
//     required this.locationLat,
//     required this.locationLang,
//     required this.isOpen,
//     required this.hasOffer,
//     required this.offerValue,
//     required this.isDeliveryFree,
//     required this.phoneNumber,
//     required this.storeStatus,
//     required this.iconPath,
//     required this.imagePath,
//     required this.storeWorkingDay,
//   });

//   Map<String, dynamic> toJson() => {
//         "Id": id,
//         "Name_Ar": nameAr,
//         "Name_En": nameEn,
//         "UserId": userId,
//         "StoreTypeId": storeTypeId,
//         "Description_En": descriptionEn,
//         "Description_Ar": descriptionAr,
//         "IsUniqueStore": isUniqueStore,
//         "Location": location,
//         "Location_Lat": locationLat,
//         "Location_Lang": locationLang,
//         "IsOpen": isOpen,
//         "hasOffer": hasOffer,
//         "OfferValue": offerValue,
//         "IsDeliveryFree": isDeliveryFree,
//         "PhoneNumber": phoneNumber,
//         "StoreStatus": storeStatus,
//         "Icon_path": iconPath,
//         "Image_path": imagePath,
//         "StoreWorkingDay": storeWorkingDay.map((e) => e.toJson()).toList(),
//       };
// }

// class StoreWorkingDay {
//   final int storeId;
//   final int dayOfWeek;
//   final String openingTime;
//   final String closingTime;

//   StoreWorkingDay({
//     required this.storeId,
//     required this.dayOfWeek,
//     required this.openingTime,
//     required this.closingTime,
//   });

//   Map<String, dynamic> toJson() => {
//         "StoreId": storeId,
//         "DayOfWeek": dayOfWeek,
//         "OpeningTime": openingTime,
//         "ClosingTime": closingTime,
//       };
// }
