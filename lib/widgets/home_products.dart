import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/bottom_bar/product_details_screen.dart';
import 'package:shop_app/services/firebase_services.dart';

class HomeProducts extends StatelessWidget {
  final String? category;

  const HomeProducts({Key? key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseServices services = FirebaseServices();

    return StreamBuilder<QuerySnapshot>(
      stream:
          services.products.where('category', isEqualTo: category).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Something wrong!'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.data!.size == 0) {
          return const Center(child: Text('No products'));
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: snapshot.data!.size,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: snapshot.data!.size == 0 ? 1 / 0.1 : 1 / 1.5,
          ),
          itemBuilder: (context, index) {
            Map<String, dynamic> productData =
                snapshot.data!.docs[index].data() as Map<String, dynamic>;

            var id = snapshot.data!.docs[index].id;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(
                      id: id,
                      productData: productData,
                    ),
                  ));
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  height: 80,
                  width: 80,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 80,
                        child: CachedNetworkImage(
                          imageUrl: productData['imageUrl'][0],
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        productData['productName'],
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
