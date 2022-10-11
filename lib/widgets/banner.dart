import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/services/firebase_services.dart';
import 'package:getwidget/getwidget.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final FirebaseServices _service = FirebaseServices();
  double scrollPosition = 0;
  final List _bannerImg = [];

  @override
  void initState() {
    getBanners();
    super.initState();
  }

  getBanners() {
    return _service.homeBanner.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        setState(() {
          _bannerImg.add(doc['image']);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: _bannerImg.isEmpty
                ? GFShimmer(
                    showShimmerEffect: true,
                    mainColor: Colors.grey.shade500,
                    secondaryColor: Colors.grey.shade400,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      color: Colors.grey.shade300,
                    ),
                  )
                : Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    color: Colors.grey.shade200,
                    child: PageView.builder(
                      itemCount: _bannerImg.length,
                      onPageChanged: (value) {
                        setState(() {
                          scrollPosition = value.toDouble();
                        });
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(
                          _bannerImg[index],
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: DotsIndicator(
            dotsCount: 3,
            position: scrollPosition,
            decorator: const DotsDecorator(
              color: Colors.grey,
              activeColor: Color.fromARGB(255, 33, 53, 167),
              spacing: EdgeInsets.all(8),
              size: Size.square(6),
              activeSize: Size(12, 6),
            ),
          ),
        ),
      ],
    );
  }
}
