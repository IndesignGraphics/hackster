import 'package:flutter/material.dart';
import 'package:hackster/screens/add_post.dart';
import 'package:hackster/screens/scan_page.dart';
import 'package:hackster/screens/tools_page.dart';
import 'package:hackster/widgets/app_drawer.dart';

import 'home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  late List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': const HomePage()},
      {'page': const AddPost()},
      {'page': const ScanPage()},
      {'page': const ToolsPage()},
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Farmer Name"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: _selectedPageIndex == 0
                ? const Icon(Icons.home_filled)
                : const Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _selectedPageIndex == 1
                ? const Icon(Icons.add_a_photo)
                : const Icon(Icons.add_a_photo_outlined),
            label: 'Add Post',
          ),
          BottomNavigationBarItem(
            icon: _selectedPageIndex == 2
                ? const Icon(Icons.document_scanner)
                : const Icon(Icons.document_scanner_outlined),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: _selectedPageIndex == 4
                ? const Icon(Icons.handyman)
                : const Icon(Icons.handyman_outlined),
            label: 'Tools',
          ),
        ],
      ),
    );
  }
}
