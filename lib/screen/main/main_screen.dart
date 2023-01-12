import 'package:flutter/material.dart';
import 'package:flutter_template/extension/colors.dart';
import 'package:provider/provider.dart';

import '../home/view/home_view.dart';
import '../home/viewModel/home_view_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  late PageController _pageController;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    Center(
      child: Text('JUST A CHAT..'),
    ),
    Center(
      child: Text('JUST A SETTING..'),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(_selectedIndex);
    });
  }

  @override
  void initState() {
    _pageController = PageController();
    _pageController = PageController(initialPage: _selectedIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppColors colors = Theme.of(context).extension<AppColors>()!;
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: _widgetOptions,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'Home',
              backgroundColor: colors.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.chat),
              label: 'Chat',
              backgroundColor: colors.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: 'Setting',
              backgroundColor: colors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
