import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  CollectionReference homeBanner = FirebaseFirestore.instance.collection('home_banner');
  CollectionReference brandAd = FirebaseFirestore.instance.collection('brand_ad');
  CollectionReference categories = FirebaseFirestore.instance.collection('categories');
  CollectionReference mainCategory = FirebaseFirestore.instance.collection('mainCategory');
  CollectionReference subCategory = FirebaseFirestore.instance.collection('subCategory');
  CollectionReference products = FirebaseFirestore.instance.collection('products');
}