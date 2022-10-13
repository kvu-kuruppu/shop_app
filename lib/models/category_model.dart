import 'package:shop_app/services/firebase_services.dart';

class CategoryModel {
  CategoryModel({required this.categoryName, required this.image});

  CategoryModel.fromJson(Map<String, Object?> json)
      : this(
          categoryName: json['categoryName']! as String,
          image: json['image']! as String,
        );

  final String categoryName;
  final String image;

  Map<String, Object?> toJson() {
    return {
      'categoryName': categoryName,
      'image': image,
    };
  }
}

FirebaseServices _service = FirebaseServices();

final categoryCollection = _service.categories
    .where('active', isEqualTo: true)
    .withConverter<CategoryModel>(
      fromFirestore: (snapshot, _) => CategoryModel.fromJson(snapshot.data()!),
      toFirestore: (movie, _) => movie.toJson(),
    );
