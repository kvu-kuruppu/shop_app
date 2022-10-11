import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class BrandHighlights extends StatefulWidget {
  const BrandHighlights({Key? key}) : super(key: key);

  @override
  State<BrandHighlights> createState() => _BrandHighlightsState();
}

class _BrandHighlightsState extends State<BrandHighlights> {
  double scrollPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
      child: Container(
        color: Colors.white,
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
                    PageView(
                      onPageChanged: (value) {
                        setState(() {
                          scrollPosition = value.toDouble();
                        });
                      },
                      children: [
                        Padding(
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
                                      child: const Center(
                                        child: Text(
                                          'YouTube Ad Video\nAbout Brand',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            height: 45,
                                            color: Colors.red,
                                            child: const Center(
                                              child: Text(
                                                'Ad',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            height: 45,
                                            color: Colors.red,
                                            child: const Center(
                                              child: Text(
                                                'Ad',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
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
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 175,
                                      color: Colors.blue,
                                      child: const Center(
                                        child: Text(
                                          'Ad',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
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
                                      child: const Center(
                                        child: Text(
                                          'YouTube Ad Video\nAbout Brand',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            height: 45,
                                            color: Colors.red,
                                            child: const Center(
                                              child: Text(
                                                'Ad',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            height: 45,
                                            color: Colors.red,
                                            child: const Center(
                                              child: Text(
                                                'Ad',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
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
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 175,
                                      color: Colors.blue,
                                      child: const Center(
                                        child: Text(
                                          'Ad',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
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
                                      child: const Center(
                                        child: Text(
                                          'YouTube Ad Video\nAbout Brand',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            height: 45,
                                            color: Colors.red,
                                            child: const Center(
                                              child: Text(
                                                'Ad',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            height: 45,
                                            color: Colors.red,
                                            child: const Center(
                                              child: Text(
                                                'Ad',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
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
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 175,
                                      color: Colors.blue,
                                      child: const Center(
                                        child: Text(
                                          'Ad',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            DotsIndicator(
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
          ],
        ),
      ),
    );
  }
}
