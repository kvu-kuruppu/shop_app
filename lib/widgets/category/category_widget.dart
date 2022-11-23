import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:shop_app/models/category_model.dart';
import 'dart:developer' as devtools show log;

import 'package:shop_app/screens/bottom_bar.dart';
import 'package:shop_app/widgets/home_products.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
      child: Column(
        children: [
          // Products for you
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Products for you',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              InkWell(
                onTap: () {},
                child: const Text('View All', style: TextStyle(fontSize: 14)),
              ),
            ],
          ),

          const Divider(),

          SizedBox(
            height: 40,
            child: Row(
              children: [
                Expanded(
                  child: FirestoreListView<CategoryModel>(
                    scrollDirection: Axis.horizontal,
                    query: categoryCollection,
                    itemBuilder: (context, snapshot) {
                      CategoryModel category = snapshot.data();
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                        child: ActionChip(
                          backgroundColor:
                              _selectedCategory == category.categoryName
                                  ? Colors.green
                                  : Colors.amber,
                          label: Text(category.categoryName),
                          onPressed: () {
                            setState(() {
                              devtools.log(category.categoryName);
                              _selectedCategory = category.categoryName;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 5),
                // View All
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 25, 10, 109),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BottomBar(
                            index: 1,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Products List
          HomeProducts(category: _selectedCategory),
        ],
      ),
    );
  }
}
