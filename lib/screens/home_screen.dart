import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/app_footer.dart';
import '../widgets/sidebar.dart';
import '../widgets/main_content_area.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppHeader(),
          Expanded(
            child: Row(
              children: [
                const Sidebar(side: SidebarSide.left),
                const Expanded(
                  flex: 3,
                  child: MainContentArea(),
                ),
                const Sidebar(side: SidebarSide.right),
              ],
            ),
          ),
          const AppFooter(),
        ],
      ),
    );
  }
}