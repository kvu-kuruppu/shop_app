import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:shop_app/models/category_model.dart';
import 'package:shop_app/widgets/category/main_category_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCategory == null ? 'Categories' : selectedCategory.toString(),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_rounded,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Row(
        children: [
          Container(
            width: 100,
            color: Colors.grey.withOpacity(0.2),
            child: FirestoreListView<CategoryModel>(
              query: categoryCollection,
              itemBuilder: (context, snapshot) {
                CategoryModel category = snapshot.data();
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedCategory = category.categoryName;
                    });
                  },
                  child: Container(
                    color: selectedCategory == category.categoryName
                        ? Colors.white
                        : Colors.grey.withOpacity(0.2),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: CachedNetworkImage(
                            imageUrl: category.image,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Text(
                            category.categoryName,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: (selectedCategory == category.categoryName)
                                  ? Colors.deepOrange
                                  : Colors.black,
                            ),
                          ),
                        ),
                        // const Divider(),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          MainCategoryWidget(selectedCategory: selectedCategory),
        ],
      ),
    );
  }
}
