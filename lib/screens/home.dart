import 'package:ahlan_mobile/constants.dart';
import 'package:ahlan_mobile/widgets/custom_tabbar_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Tab> tabs = [
    const Tab(text: 'Rubrik'),
    const Tab(text: 'E-Magazine'),
  ];

  @override
  void initState() {
    _tabController = TabController(
      length: tabs.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, value) => [
          SliverAppBar(
            snap: true,
            floating: true,
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/bg.png',
                        ),
                        fit: BoxFit.fill,
                      ))),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 30.0,
                        right: 30.0,
                        bottom: 50.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Inspirasi Emas Santri Muda Bangsa',
                              style: TextStyle(
                                color: Constants.subheadingColor,
                                fontSize: 8.5,
                                fontFamily: Constants.headingFontFamily,
                              )),
                          Text('Ahlan Magazine',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: Constants.headingFontFamily,
                              )),
                          Text(
                              'Hi I’m AHLAN! My copies are spread across Sabang until Merauke and even Malaysia, Singapore, Thailand, Brunei Darussalam, Qatar, and Australia. I present myself in a unique, direct, and personal approach. AHLAN! Focused on dakwah, creativity, out of the box, and young moslem society.',
                              style: TextStyle(
                                color: Constants.subheadingColor,
                                fontSize: 8.5,
                                fontFamily: Constants.globalFontFamily,
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottom: TabBar(
              tabs: tabs,
              labelColor: Colors.white,
              labelStyle:
                  const TextStyle(fontFamily: Constants.globalFontFamily),
              controller: _tabController,
            ),
          ),
        ],
        body: TabBarView(
            controller: _tabController,
            children:
                tabs.map((tab) => CustomTabBarView(type: tab.text!)).toList()),
      ),
    );
  }
}
