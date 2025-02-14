import 'package:flutter/material.dart';

import '../Constants.dart';

class ExpertiseSection extends StatefulWidget {
  const ExpertiseSection({super.key});

  @override
  State<ExpertiseSection> createState() => _ExpertiseSectionState();
}

class _ExpertiseSectionState extends State<ExpertiseSection> {
  bool _isWeb = true;
  Widget bulletPoint(
    String heading,
    String text,
  ) {
    return Container(
      width: _isWeb ? MediaQuery.sizeOf(context).width * 0.55 : screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            heading,
            style: headingText,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: normalText,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget circleImage(String image) {
    return Opacity(
      opacity: _isWeb ? 1 : 0.5,
      child: ClipOval(
        child: SizedBox(
          width: _isWeb ? screenWidth * 0.2 : screenWidth,
          height: _isWeb
              ? screenWidth * 0.2
              : screenHeight * 0.3, // Maintain aspect ratio
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _isWeb = isWeb(context);
    return Center(
      child: Container(
          alignment: Alignment.center,
          // height: screenHeight,
          width: screenWidth * 0.8,
          child: _isWeb
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Why Choose Oracle Solutions for Your E-Commerce Needs?',
                        style: headingText.copyWith(fontSize: 38),
                      ),
                    ),
                    Row(
                      children: [
                        circleImage("assets/images/image9.png"),
                        SizedBox(
                          width: 10,
                        ),
                        bulletPoint('Cost-Effective Strategies',
                            "We understand that every business is unique, which is why we offer customized e-commerce solutions that fit your specific goals. By tailoring our services to meet your exact needs, we ensure maximum value while optimizing your costs, so you can achieve more with your budget."),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: bulletPoint('Reliable & Responsive Support',
                              "We are committed to providing timely and dependable support to keep your operations running seamlessly. Our experienced support team is always available to tackle any issues, ensuring your business continues to operate smoothly at all times."),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        circleImage("assets/images/image4.jpg"),
                      ],
                    ),
                    Row(
                      children: [
                        circleImage("assets/images/image1.jpg"),
                        SizedBox(
                          width: 10,
                        ),
                        bulletPoint('Proactive E-Commerce Solutions',
                            "We don't just react to problems – we anticipate them. By identifying potential challenges before they arise, we implement proactive strategies to prevent disruptions. Our forward-thinking approach helps keep your business ahead of the competition."),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Why Choose Oracle Solutions?',
                        style: headingText.copyWith(fontSize: 38),
                      ),
                    ),
                    Stack(
                      children: [
                        Positioned(
                            // top: screenHeight * 0.1,
                            child: circleImage("assets/images/image9.png")),
                        bulletPoint('Cost-Effective Strategies',
                            "We understand that every business is unique, which is why we offer customized e-commerce solutions that fit your specific goals. By tailoring our services to meet your exact needs, we ensure maximum value while optimizing your costs, so you can achieve more with your budget."),
                      ],
                    ),
                    Stack(
                      children: [
                        Positioned(
                            // top: 100,
                            child: circleImage("assets/images/image4.jpg")),
                        Container(
                          child: bulletPoint('Reliable & Responsive Support',
                              "We are committed to providing timely and dependable support to keep your operations running seamlessly. Our experienced support team is always available to tackle any issues, ensuring your business continues to operate smoothly at all times."),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Positioned(
                            // top: 100,
                            child: circleImage("assets/images/image1.jpg")),
                        bulletPoint('Proactive E-Commerce Solutions',
                            "We don't just react to problems – we anticipate them. By identifying potential challenges before they arise, we implement proactive strategies to prevent disruptions. Our forward-thinking approach helps keep your business ahead of the competition."),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                  ],
                )),
    );
  }
}
