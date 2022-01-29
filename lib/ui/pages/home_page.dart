import 'package:flutter/material.dart';
import 'package:my_town/ui/pages/bag_page.dart';
import 'package:my_town/ui/pages/store_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final _screens = [
    Container(
      child: Center(
        child: Text('Home'),
      ),
    ),
    StorePage(),
    BagPage(),
    Container(
      child: Center(
        child: Text('Services'),
      ),
    ),
    Container(
      child: Center(
        child: Text('Wallet'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            size: 30,
            color: Color(0xFF1D2651),
          ),
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nutan Durgapur',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF66C9B),
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_outlined,
              size: 28,
              color: Color(0xFFF66C9B),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 30,
              color: Color(0xFF1D2651),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        bottomOpacity: 0,
        textTheme: Theme.of(context).textTheme,
      ),
      body: Stack(
        children: _screens
            .asMap()
            .map((i, screen) => MapEntry(
                  i,
                  Offstage(
                    offstage: _selectedIndex != i,
                    child: screen,
                  ),
                ))
            .values
            .toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (i) {
          setState(() => _selectedIndex = i);
        },
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
        selectedItemColor: Color(0xFF1D2651),
        unselectedItemColor: Color(0xFFB1BACC),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            activeIcon: Icon(Icons.apps),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront),
            activeIcon: Icon(Icons.storefront_rounded),
            label: 'Stores',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            activeIcon: Icon(Icons.shopping_bag),
            label: 'Bag',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle_outlined),
            activeIcon: Icon(Icons.supervised_user_circle),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            activeIcon: Icon(Icons.account_balance_wallet),
            label: 'Wallet',
          ),
        ],
      ),
    );
  }
}
