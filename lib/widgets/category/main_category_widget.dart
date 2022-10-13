import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:shop_app/models/main_category_model.dart';
import 'package:shop_app/widgets/category/sub_category_widget.dart';

class MainCategoryWidget extends StatefulWidget {
  final String? selectedCategory;

  const MainCategoryWidget({
    Key? key,
    this.selectedCategory,
  }) : super(key: key);

  @override
  State<MainCategoryWidget> createState() => _MainCategoryWidgetState();
}

class _MainCategoryWidgetState extends State<MainCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FirestoreListView<MainCategoryModel>(
        query: mainCategoryCollection(widget.selectedCategory),
        itemBuilder: (context, snapshot) {
          MainCategoryModel mainCategory = snapshot.data();
          return ExpansionTile(
            title: Text(mainCategory.mainCategory),
            textColor: Colors.deepOrange,
            iconColor: Colors.deepOrange,
            children: [
              SubCategoryWidget(
                selectedSubCategory: mainCategory.mainCategory,
              ),
            ],
          );
        },
      ),
    );
  }
}
