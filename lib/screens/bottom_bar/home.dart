import 'package:flutter/material.dart';
import 'package:shop_app/widgets/banner.dart';
import 'package:shop_app/widgets/brand_highlights.dart';
import 'package:shop_app/widgets/category/category_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 25, 10, 109),
        title: const Text(
          'Shopping App',
          style: TextStyle(
            // color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              // color: Colors.black,
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 124, 178, 248),
      body: ListView(
        children: [
          Column(
            children: [
              // Search
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color.fromARGB(255, 25, 10, 109),
                      width: 4.0,
                    ),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: InputBorder.none,
                      hintText: 'Search',
                      contentPadding: EdgeInsets.fromLTRB(10, 14, 0, 0),
                      suffixIcon: Icon(
                        Icons.search,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              // Stuff
              SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    StuffText(text: '100% Genuine'),
                    StuffText(text: '4-7 Days Return'),
                    StuffText(text: 'Trusted Brands'),
                  ],
                ),
              ),
              // Banner
              const BannerWidget(),
              // Brand Highlights
              const BrandHighlights(),
              // Category
              const CategoryWidget(),
            ],
          ),
        ],
      ),
    );
  }
}

class StuffText extends StatelessWidget {
  final String text;

  const StuffText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.info_outline,
          size: 20,
          color: Color.fromARGB(255, 25, 10, 109),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            color: Color.fromARGB(255, 25, 10, 109),
          ),
        ),
      ],
    );
  }
}
