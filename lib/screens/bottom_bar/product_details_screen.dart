import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String id;
  final Map<String, dynamic> productData;

  const ProductDetailsScreen({
    Key? key,
    required this.id,
    required this.productData,
  }) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int index = 0;

  String? shippingCharge;

  late ScrollController scrollController;

  bool _isScrollDown = true;

  bool _showAppBar = true;

  @override
  void initState() {
    scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        _isScrollDown = true;
        setState(() {});
      }

      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        _isScrollDown = false;
        setState(() {});
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List imageList = widget.productData['imageUrl'] as List;

    double discount = (widget.productData['regularPrice'] -
            widget.productData['salesPrice']) *
        100 /
        widget.productData['regularPrice'];

    String regularPrice = NumberFormat.currency(name: 'LKR ')
        .format(widget.productData['regularPrice']);

    String salesPrice = NumberFormat.currency(name: 'LKR ')
        .format(widget.productData['salesPrice']);

    widget.productData['shippingCharge'] != null
        ? shippingCharge = NumberFormat.currency(name: 'LKR ')
            .format(widget.productData['shippingCharge'])
        : shippingCharge = 'Free';

    return SafeArea(
      child: Scaffold(
        appBar: _isScrollDown
            ? AppBar(
                backgroundColor: Colors.grey.shade200,
                iconTheme: const IconThemeData(color: Colors.black),
                elevation: 0,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart_outlined),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz),
                  ),
                ],
              )
            : null,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Images
                SizedBox(
                  height: 300,
                  child: Stack(
                    children: [
                      PageView(
                        onPageChanged: (value) {
                          setState(() {
                            index = value;
                          });
                        },
                        children: imageList.map((e) {
                          return CachedNetworkImage(imageUrl: e);
                        }).toList(),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 150),
                          child: Container(
                            width: 50,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              '${index + 1} / ${imageList.length}',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Selling Price
                    Text(
                      salesPrice,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.deepOrange,
                      ),
                    ),

                    Row(
                      children: [
                        IconButton(
                          splashRadius: 20,
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border, size: 20),
                        ),
                        IconButton(
                          splashRadius: 20,
                          onPressed: () {},
                          icon: const Icon(Icons.share, size: 20),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // Regular Price and Discount
                Row(
                  children: [
                    Text(
                      regularPrice,
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text('${discount.toInt()}%'),
                  ],
                ),

                const SizedBox(height: 10),

                // Product Name
                Text(
                  widget.productData['productName'],
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                // Rating
                Row(
                  children: const [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    SizedBox(width: 5),
                    Text('(5)'),
                  ],
                ),

                const Divider(height: 20, thickness: 1),

                // Specifications
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        height: 300,
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Specifications',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      const Icon(Icons.arrow_forward_ios, size: 15),
                    ],
                  ),
                ),

                const Divider(height: 20, thickness: 1),

                // Delivery
                Row(
                  children: [
                    // Delivery
                    Expanded(
                      child: Text(
                        'Delivery',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ),

                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Address and Location Pin
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              // Address
                              Flexible(
                                child: Text(
                                  '36/26, Lionel Jayasinghe  Mawatha, Panagoda Homagama',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 14),
                                ),
                              ),

                              // Location Pin
                              Icon(
                                Icons.location_pin,
                                size: 16,
                                color: Colors.red,
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          const Text('Home delivery 3-5 day(s)'),

                          const SizedBox(height: 10),

                          Text(
                            'Delivery Charge: $shippingCharge',
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const Divider(height: 20, thickness: 1),

                // Rating & Reviews
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rating & Reviews (10)',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    const Text(
                      'View All...',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Rating 1
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User - ${DateFormat.yMMMMd().format(DateTime.now())}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        const Text(
                          'Good Product, Good quality\nOn time delivery',
                          style: TextStyle(fontSize: 11),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(Icons.star, color: Colors.amber, size: 14),
                        Icon(Icons.star, color: Colors.amber, size: 14),
                        Icon(Icons.star, color: Colors.amber, size: 14),
                        Icon(Icons.star_half, color: Colors.amber, size: 14),
                        Icon(Icons.star_border, color: Colors.amber, size: 14),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // Rating 2
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User - ${DateFormat.yMMMMd().format(DateTime.now())}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        const Text(
                          'Good Product, Good quality\nOn time delivery',
                          style: TextStyle(fontSize: 11),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(Icons.star, color: Colors.amber, size: 14),
                        Icon(Icons.star, color: Colors.amber, size: 14),
                        Icon(Icons.star, color: Colors.amber, size: 14),
                        Icon(Icons.star_half, color: Colors.amber, size: 14),
                        Icon(Icons.star_border, color: Colors.amber, size: 14),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // Rating 3
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User - ${DateFormat.yMMMMd().format(DateTime.now())}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        const Text(
                          'Good Product, Good quality, On time delivery',
                          style: TextStyle(fontSize: 11),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(Icons.star, color: Colors.amber, size: 14),
                        Icon(Icons.star, color: Colors.amber, size: 14),
                        Icon(Icons.star, color: Colors.amber, size: 14),
                        Icon(Icons.star_half, color: Colors.amber, size: 14),
                        Icon(Icons.star_border, color: Colors.amber, size: 14),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // Rating 4
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User - ${DateFormat.yMMMMd().format(DateTime.now())}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        const Text(
                          'Good Product, Good quality, On time delivery',
                          style: TextStyle(fontSize: 11),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(Icons.star, color: Colors.amber, size: 14),
                        Icon(Icons.star, color: Colors.amber, size: 14),
                        Icon(Icons.star, color: Colors.amber, size: 14),
                        Icon(Icons.star_half, color: Colors.amber, size: 14),
                        Icon(Icons.star_border, color: Colors.amber, size: 14),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // Rating 5
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User - ${DateFormat.yMMMMd().format(DateTime.now())}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        const Text(
                          'Good Product, Good quality, On time delivery',
                          style: TextStyle(fontSize: 11),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(Icons.star, color: Colors.amber, size: 14),
                        Icon(Icons.star, color: Colors.amber, size: 14),
                        Icon(Icons.star, color: Colors.amber, size: 14),
                        Icon(Icons.star_half, color: Colors.amber, size: 14),
                        Icon(Icons.star_border, color: Colors.amber, size: 14),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          color: Colors.grey.shade200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  // Store
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.store_mall_directory_outlined,
                        color: Colors.deepOrange,
                      ),
                      Text(
                        'Store',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(width: 20),

                  // Chat
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.chat_outlined,
                        color: Colors.deepOrange,
                      ),
                      Text(
                        'Chat',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  // Buy Now
                  Container(
                    width: 90,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      'Buy Now',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(width: 20),

                  // Add to Cart
                  Container(
                    width: 90,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 187, 45, 26),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      'Add to Cart',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
