import 'package:flutter/material.dart';
import 'package:oracle_solutions_project/main_src_file/service_area.dart';
import '../Constants.dart';
import 'contact_area.dart';
import 'expertise_area.dart';
import 'introduction_area.dart';

class OracleSolutionsPage extends StatefulWidget {
  const OracleSolutionsPage({super.key});

  @override
  OracleSolutionsPageState createState() => OracleSolutionsPageState();
}

class OracleSolutionsPageState extends State<OracleSolutionsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;

  final GlobalKey _introKey = GlobalKey();
  final GlobalKey _whyChooseUsKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _scrollController = ScrollController();

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        _scrollToSection(_tabController.index);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(int index) {
    final sectionKeys = [
      _introKey,
      _servicesKey,
      _whyChooseUsKey,
      _contactKey,
    ];

    final targetContext = sectionKeys[index].currentContext;
    if (targetContext != null) {
      Scrollable.ensureVisible(
        targetContext,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  Widget _buildSection(GlobalKey key, Widget content) {
    return Container(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: content,
    );
  }

  Widget _buildHeader(bool isWeb) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo Section
          Row(
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 40,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Oracle Solutions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2B2B2B),
                    ),
                  ),
                  if (isWeb)
                    const Text(
                      'Think Bigger Sell Smarter',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF666666),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                ],
              ),
            ],
          ),

          // Navigation Tabs
          if (isWeb)
            TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: ColorTheme.navBarColor,
              unselectedLabelColor: const Color(0xFF666666),
              labelStyle: headingText.copyWith(fontSize: 16),
              unselectedLabelStyle: normalText,
              indicatorColor: ColorTheme.navBarColor,
              tabs: const [
                Tab(text: 'Home'),
                Tab(text: 'Services'),
                Tab(text: 'Why Choose Us'),
                Tab(text: 'Contact'),
              ],
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isWeb = MediaQuery.of(context).size.width > 768;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: isWeb
          ? PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: _buildHeader(isWeb),
            )
          : AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: Image.asset(
                'assets/images/logo.png',
                height: 40,
              ),
              bottom: TabBar(
                controller: _tabController,
                unselectedLabelStyle: normalText.copyWith(fontSize: 13),
                labelStyle: headingText.copyWith(
                    fontSize: 16, color: ColorTheme.navBarColor),
                tabs: const [
                  Tab(text: 'Home'),
                  Tab(text: 'Services'),
                  Tab(text: 'Why\nChoose Us'),
                  Tab(text: 'Contact'),
                ],
              ),
            ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(_introKey, const IntroductionSection()),
            _buildSection(_servicesKey, ServiceSection()),
            _buildSection(_whyChooseUsKey, const ExpertiseSection()),
            _buildSection(_contactKey, const ContactSection()),
          ],
        ),
      ),
    );
  }
}
