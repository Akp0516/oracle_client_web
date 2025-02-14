import 'package:flutter/material.dart';
import 'package:oracle_solutions_project/Constants.dart';

class IntroductionSection extends StatefulWidget {
  const IntroductionSection({super.key});

  @override
  State<IntroductionSection> createState() => _IntroductionSectionState();
}

class _IntroductionSectionState extends State<IntroductionSection> {
  bool _isWeb = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _isWeb = isWeb(context);

    return _isWeb
        ? Center(
            child: Container(
              padding: EdgeInsets.only(top: 16, bottom: 6, left: 16, right: 10),
              width: screenWidth,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: screenWidth * 0.45,
                        // height: screenHeight,
                        child: Column(
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Row(
                                children: [
                                  Text(
                                    "Think",
                                    style: thickStyle.copyWith(fontSize: 64),
                                  ),
                                  Text(
                                    " BIGGER",
                                    style: boldStyle.copyWith(fontSize: 84),
                                  ),
                                ],
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Row(
                                children: [
                                  Text(
                                    "Sell",
                                    style: thickStyle,
                                  ),
                                  Text(
                                    " SMARTER",
                                    style: boldStyle,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: screenWidth * 0.04),
                              width: screenWidth * 0.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Unlock Your E-Commerce Potential with Oracle Solutions',
                                    style: headingText,
                                  ),
                                  const SizedBox(height: 30.0),
                                  Text(
                                    'At Oracle Solutions, we specialize in delivering top-tier e-commerce services designed to help your business succeed in the digital world. With years of experience and a team of skilled professionals, we provide end-to-end solutions that drive growth, increase efficiency, and improve your online sales performance.',
                                    style: normalText,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Image.asset(
                            "assets/images/image7.png",
                            width: screenWidth * 0.53 - 16,
                            height: screenHeight * 0.4,
                          ),
                          SizedBox(height: 20),
                          Image.asset(
                            "assets/images/image8.png",
                            width: screenWidth * 0.53 - 16,
                            height: screenHeight * 0.4,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: screenWidth * 0.35 - 16,
                        height: screenHeight * 0.64,
                        margin: EdgeInsets.only(right: 80),
                        // Ensure the height is proportional to width
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image: AssetImage("assets/images/image5.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: screenWidth * 0.04),
                            width: screenWidth * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Are You Tapping into the Full Potential of E-Commerce Marketplaces?',
                                  style: headingText,
                                ),
                                const SizedBox(height: 30.0),
                                Text(
                                  'Did you know that only 30-40% of sellers are fully leveraging the potential of e-commerce through marketplaces like Amazon, Flipkart, Meesho, Ajio, and more?At Oracle Solutions, we bring extensive experience working with clients across the USA, UK, Dubai, and India. Our team is skilled in understanding diverse customer demographics and is well-versed in the complex buying behaviors of consumers globally, helping you unlock your business full potential. style: normalText',
                                  style: normalText,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const Divider(),
                ],
              ),
            ),
          )
        : Container(
            padding: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 10),
            width: screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: screenWidth - 26,
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Positioned(
                            top: screenWidth * 0.3,
                            child: Column(
                              children: [
                                Opacity(
                                  opacity: 0.4,
                                  child: Image.asset(
                                    "assets/images/bg.jpg",
                                    width: screenWidth - 26,
                                    height: screenHeight * 0.6,
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.4,
                                  child: Image.asset(
                                    "assets/images/image5.png",
                                    width: screenWidth - 26,
                                    height: screenHeight,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Row(
                                  children: [
                                    Text(
                                      "Think",
                                      style: thickStyle.copyWith(fontSize: 64),
                                    ),
                                    Text(
                                      " BIGGER",
                                      style: boldStyle.copyWith(fontSize: 84),
                                    ),
                                  ],
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Row(
                                  children: [
                                    Text(
                                      "Sell",
                                      style: thickStyle,
                                    ),
                                    Text(
                                      " SMARTER",
                                      style: boldStyle,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding:
                                    EdgeInsets.only(top: screenWidth * 0.04),
                                width: screenWidth - 26,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Unlock Your E-Commerce Potential with Oracle Solutions',
                                      style: headingText,
                                    ),
                                    const SizedBox(height: 30.0),
                                    Text(
                                      'At Oracle Solutions, we specialize in delivering top-tier e-commerce services designed to help your business succeed in the digital world. With years of experience and a team of skilled professionals, we provide end-to-end solutions that drive growth, increase efficiency, and improve your online sales performance.',
                                      style: normalText,
                                    ),
                                    const SizedBox(height: 30.0),
                                    Text(
                                      'Are You Tapping into the Full Potential of E-Commerce Marketplaces?',
                                      style: headingText,
                                    ),
                                    const SizedBox(height: 30.0),
                                    Text(
                                      'Did you know that only 30-40% of sellers are fully leveraging the potential of e-commerce through marketplaces like Amazon, Flipkart, Meesho, Ajio, and more?At Oracle Solutions, we bring extensive experience working with clients across the USA, UK, Dubai, and India. Our team is skilled in understanding diverse customer demographics and is well-versed in the complex buying behaviors of consumers globally, helping you unlock your business full potential.',
                                      style: normalText,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(),
              ],
            ),
          );
  }
}
