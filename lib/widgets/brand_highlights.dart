import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:shop_app/services/firebase_services.dart';
import 'package:shop_app/widgets/dots_indicator.dart';

class BrandHighlights extends StatefulWidget {
  const BrandHighlights({Key? key}) : super(key: key);

  @override
  State<BrandHighlights> createState() => _BrandHighlightsState();
}

class _BrandHighlightsState extends State<BrandHighlights> {
  final FirebaseServices _service = FirebaseServices();
  double scrollPosition = 0;
  final List _brandAd = [];

  @override
  void initState() {
    getBrandAd();
    super.initState();
  }

  getBrandAd() {
    return _service.brandAd.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        setState(() {
          _brandAd.add(doc);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            // Brand Highlights
            Row(
              children: const [
                Text(
                  'Brand Highlights',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    // color: Colors.white,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 180,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  itemCount: _brandAd.length,
                  onPageChanged: (value) {
                    setState(() {
                      scrollPosition = value.toDouble();
                    });
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: SingleChildScrollView(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  Container(
                                    height: 150,
                                    color: Colors.red,
                                    child: BrandHighlightItem(
                                      brandList: _brandAd,
                                      index: index,
                                      imgNo: 1,
                                      height: 100,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      // Image 1
                                      Expanded(
                                        flex: 3,
                                        child: BrandHighlightItem(
                                          brandList: _brandAd,
                                          index: index,
                                          imgNo: 1,
                                          height: 100,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      // Image 2
                                      Expanded(
                                        flex: 3,
                                        child: BrandHighlightItem(
                                          brandList: _brandAd,
                                          index: index,
                                          imgNo: 2,
                                          height: 100,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            // Image 3
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  BrandHighlightItem(
                                    brandList: _brandAd,
                                    index: index,
                                    imgNo: 3,
                                    height: 210,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            _brandAd.isEmpty
                ? Container()
                : DotsIndicatorWidget(
                    scrollPosition: scrollPosition,
                    dots: _brandAd.length,
                  ),
          ],
        ),
      ),
    );
  }
}

class BrandHighlightItem extends StatelessWidget {
  final List brandList;
  final int index;
  final int imgNo;
  final double height;

  const BrandHighlightItem({
    Key? key,
    required this.brandList,
    required this.index,
    required this.imgNo,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: CachedNetworkImage(
        imageUrl: brandList[index]['image$imgNo'],
        fit: BoxFit.cover,
        placeholder: (context, url) => GFShimmer(
          child: Container(
            height: height,
            color: Colors.grey.shade400,
          ),
        ),
      ),
    );
  }
}
