import 'package:flutter/material.dart';
import 'package:oracle_solutions_project/Constants.dart';

class ServiceSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text(
            "Our Services",
            style: headingText.copyWith(fontSize: 38),
          ),
          const SizedBox(
            height: 14,
          ),
          ShrinkingList(),
          const Divider(),
        ],
      ),
    );
  }
}

class ShrinkingList extends StatelessWidget {
  final List<ServiceItem> services = [
    ServiceItem(
      title: "Ecommerce Account Management",
      description:
          "Comprehensive services for seller accounts, including optimization, inventory, and performance monitoring.\n* Account Setup & Optimization\n* Inventory & Order Management\n* Performance Monitoring\n* Customer Service & Feedback Management\nOur dedicated team ensures your accounts operate seamlessly while you focus on growing your business.",
      icon: Icons.web,
    ),
    ServiceItem(
      title: "Social Media Marketing Services",
      description:
          "Strategies for building brand awareness and driving sales through social platforms.\n* Content Creation and Curation\n* Community Management\n* Paid Advertising\n* Daily Posting, Reels, Stories, and Images\nWe specialize in creating impactful campaigns tailored to your audience for maximum engagement.",
      icon: Icons.smartphone,
    ),
    ServiceItem(
      title: "E-Commerce Platform Setup",
      description:
          "Setup and integration of online stores tailored to your goals.\n* Platform Setup & Integration\n* Product Listing Management\n* Market Research & Strategy Development\n* Ongoing Maintenance & Support\n* Custom E-Commerce Development\nLet us handle the technical complexities so you can focus on delivering exceptional shopping experiences.",
      icon: Icons.design_services,
    ),
    ServiceItem(
      title: "Performance Analytics & Reporting",
      description:
          "Data-driven insights to monitor and enhance your online business.\n* Detailed Sales Reports\n* Customer Behavior Analysis\n* Market Trend Insights\nWe provide actionable recommendations to help you make informed business decisions.",
      icon: Icons.design_services,
    ),
    ServiceItem(
      title: "Custom Development Solutions",
      description:
          "Tailored technology solutions to meet unique business challenges.\n* Bespoke Web Development\n* Mobile App Integration\n* API Development and Automation\nEmpower your business with cutting-edge tools and platforms designed just for you.",
      icon: Icons.design_services,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool shouldShrink = constraints.maxWidth < 600;
          return Container(
            height: MediaQuery.sizeOf(context).width > 1111
                ? 830
                : MediaQuery.sizeOf(context).width > 741
                    ? 1300
                    : 2140,
            child: Wrap(
              spacing: 30.0, // Space between widgets
              runSpacing: 25.0, // Space between rows
              children: List.generate(5, (index) {
                double scale = shouldShrink ? 0.5 : 1.0;
                return Transform.scale(
                  scale: 1,
                  child: SizedBox(
                      width: 340,
                      height: 420,
                      child: HoverExpandableTile(service: services[index])),
                );
              }),
            ),
          );
        },
      ),
    );
  }
}

class HoverExpandableTile extends StatefulWidget {
  final ServiceItem service;

  const HoverExpandableTile({Key? key, required this.service})
      : super(key: key);

  @override
  _HoverExpandableTileState createState() => _HoverExpandableTileState();
}

class _HoverExpandableTileState extends State<HoverExpandableTile> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
            color: ColorTheme.lightGrey,
            borderRadius: BorderRadius.circular(12),
          ),
          width: 250,
          height: 250,
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: 340,
            height: 420,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: ColorTheme.mainTextColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  width: 50,
                  height: 50,
                  child: Icon(
                    Icons.trending_up,
                    color: Colors.white,
                  ),
                ),
                Text(
                  widget.service.title,
                  style: headingText,
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Text(
                    widget.service.description,
                    style: simpleText,
                  ),
                ),
              ],
            ),
          ),
        ),
        // ),
      ]),
    );
  }
}

class ServiceItem {
  final String title;
  final String description;
  final IconData icon;

  ServiceItem(
      {required this.title, required this.description, required this.icon});
}
