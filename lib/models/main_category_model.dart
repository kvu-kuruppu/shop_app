import 'package:shop_app/services/firebase_services.dart';

class MainCategoryModel {
  MainCategoryModel({required this.category, required this.mainCategory});

  MainCategoryModel.fromJson(Map<String, Object?> json)
      : this(
          category: json['category']! as String,
          mainCategory: json['mainCategory']! as String,
        );

  final String category;
  final String mainCategory;

  Map<String, Object?> toJson() {
    return {
      'category': category,
      'mainCategory': mainCategory,
    };
  }
}

FirebaseServices _service = FirebaseServices();

mainCategoryCollection(selectedCategory) {
  return _service.mainCategory
      .where('approved', isEqualTo: true)
      .where('category', isEqualTo: selectedCategory)
      .withConverter<MainCategoryModel>(
        fromFirestore: (snapshot, _) =>
            MainCategoryModel.fromJson(snapshot.data()!),
        toFirestore: (movie, _) => movie.toJson(),
      );
}

// final mainCategoryCollection = _service.mainCategory
//     .where('approved', isEqualTo: true)
//     .withConverter<MainCategoryModel>(
//       fromFirestore: (snapshot, _) => MainCategoryModel.fromJson(snapshot.data()!),
//       toFirestore: (movie, _) => movie.toJson(),
//     );
