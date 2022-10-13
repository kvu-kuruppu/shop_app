import 'package:shop_app/services/firebase_services.dart';

class SubCategoryModel {
  SubCategoryModel({
    required this.mainCategoryName,
    required this.subCategoryName,
    required this.image,
  });

  SubCategoryModel.fromJson(Map<String, Object?> json)
      : this(
          mainCategoryName: json['mainCategoryName']! as String,
          subCategoryName: json['subCategoryName']! as String,
          image: json['image']! as String,
        );

  final String mainCategoryName;
  final String subCategoryName;
  final String image;

  Map<String, Object?> toJson() {
    return {
      'mainCategoryName': mainCategoryName,
      'subCategoryName': subCategoryName,
      'image': image,
    };
  }
}

FirebaseServices _service = FirebaseServices();

subCategoryCollection({selectedSubCategory}) {
  return _service.subCategory
      .where('active', isEqualTo: true)
      .where('mainCategoryName', isEqualTo: selectedSubCategory)
      .withConverter<SubCategoryModel>(
        fromFirestore: (snapshot, _) =>
            SubCategoryModel.fromJson(snapshot.data()!),
        toFirestore: (movie, _) => movie.toJson(),
      );
}

// final mainCategoryCollection = _service.mainCategory
//     .where('approved', isEqualTo: true)
//     .withConverter<MainCategoryModel>(
//       fromFirestore: (snapshot, _) => MainCategoryModel.fromJson(snapshot.data()!),
//       toFirestore: (movie, _) => movie.toJson(),
//     );
