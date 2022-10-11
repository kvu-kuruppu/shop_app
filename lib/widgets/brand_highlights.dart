import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:shop_app/services/firebase_services.dart';
import 'package:shop_app/widgets/dots_indicator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
      child: Container(
        color: Colors.white.withOpacity(0.3),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // Brand Highlights
            Row(
              children: const [
                Text(
                  'Brand Highlights',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 180,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    PageView.builder(
                      itemCount: _brandAd.length,
                      onPageChanged: (value) {
                        setState(() {
                          scrollPosition = value.toDouble();
                        });
                      },
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Column(
                                  children: [
                                    // YouTube Ad Video About Brand
                                    Container(
                                      height: 120,
                                      color: Colors.deepOrange,
                                      child: YoutubePlayer(
                                        controller: YoutubePlayerController(
                                          initialVideoId: _brandAd[index]
                                              ['youtube'],
                                          flags: const YoutubePlayerFlags(
                                            autoPlay: true,
                                            mute: true,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        // Image 1
                                        Expanded(
                                          flex: 1,
                                          child: BrandHighlightItem(
                                            brandList: _brandAd,
                                            index: index,
                                            imgNo: 1,
                                            height: 50,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        // Image 2
                                        Expanded(
                                          flex: 1,
                                          child: BrandHighlightItem(
                                            brandList: _brandAd,
                                            index: index,
                                            imgNo: 2,
                                            height: 50,
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
                                  children: [
                                    BrandHighlightItem(
                                      brandList: _brandAd,
                                      index: index,
                                      imgNo: 3,
                                      height: 180,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
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
  const BrandHighlightItem({
    Key? key,
    required this.index,
    required this.imgNo,
    required this.height,
    required this.brandList,
  }) : super(key: key);

  final List brandList;
  final int index;
  final int imgNo;
  final double height;

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
