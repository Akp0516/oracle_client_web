import 'package:flutter/material.dart';

import '../Constants.dart';

class AnimatedBanner extends StatefulWidget {
  const AnimatedBanner({super.key});

  @override
  State<AnimatedBanner> createState() => _AnimatedBannerState();
}

class _AnimatedBannerState extends State<AnimatedBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeInAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeInAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, Constrants) {
      return Stack(
        children: [
          // Banner Image
          Image.asset(
            "assets/images/WE-Image/Banner.jpg",
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height *
                0.9, // Adjust this value as needed
            fit: BoxFit.cover,
          ),
          // Darkening Overlay
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          // Animated Text
          Positioned.fill(
            child: SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeInAnimation,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Think BIGGER Sell SMARTER",
                        style: thickStyle.copyWith(
                          fontSize: 64,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
