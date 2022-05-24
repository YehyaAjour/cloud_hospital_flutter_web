import 'package:cloud_hospital/apis/dashboard_apis.dart';
import 'package:flutter/material.dart';


import 'helpers/local_navigator.dart';
import 'helpers/reponsiveness.dart';
import 'widgets/large_screen.dart';
import 'widgets/side_menu.dart';
import 'widgets/top_nav.dart';


class SiteLayout extends StatefulWidget {
  @override
  State<SiteLayout> createState() => _SiteLayoutState();
}

class _SiteLayoutState extends State<SiteLayout> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  void initState() {
    DashboardApis.dashboardApis.getAllDoctor();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar:  topNavigationBar(context, scaffoldKey),
      drawer: Drawer(
        child: SideMenu(),
      ),
      body: ResponsiveWidget(
        largeScreen: LargeScreen(),
      smallScreen: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: localNavigator(),
      )
      ),
    );
  }
}
