import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:shop_app/models/sub_category_model.dart';

class SubCategoryWidget extends StatelessWidget {
  final String? selectedSubCategory;

  const SubCategoryWidget({
    Key? key,
    this.selectedSubCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FirestoreQueryBuilder<SubCategoryModel>(
        query: subCategoryCollection(
          selectedSubCategory: selectedSubCategory,
        ),
        builder: (context, snapshot, _) {
          if (snapshot.isFetching) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text('error ${snapshot.error}');
          }

          return GridView.builder(
            shrinkWrap: true,
            itemCount: snapshot.docs.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: snapshot.docs.isEmpty ? 1 / 0.1 : 1 / 1.1,
            ),
            itemBuilder: (context, index) {
              // // if we reached the end of the currently obtained items, we try to
              // // obtain more items
              // if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
              //   // Tell FirestoreQueryBuilder to try to obtain more items.
              //   // It is safe to call this function from within the build method.
              //   snapshot.fetchMore();
              // }

              SubCategoryModel subCategory = snapshot.docs[index].data();

              return InkWell(
                onTap: () {
                  print(
                      'Main Category: ${subCategory.mainCategoryName} | Main Category: ${subCategory.subCategoryName}');
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: CachedNetworkImage(
                          imageUrl: subCategory.image,
                          placeholder: (context, _) {
                            return Container(
                              height: 60,
                              width: 60,
                              color: Colors.grey.shade300,
                            );
                          },
                        ),
                      ),
                    ),
                    Text(subCategory.subCategoryName),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
