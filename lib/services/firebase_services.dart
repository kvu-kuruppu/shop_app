import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  CollectionReference homeBanner = FirebaseFirestore.instance.collection('home_banner');
  CollectionReference brandAd = FirebaseFirestore.instance.collection('brand_ad');
}