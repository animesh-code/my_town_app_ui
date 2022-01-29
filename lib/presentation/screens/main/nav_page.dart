import 'package:flutter/material.dart';
import 'package:my_town/config/app/size_config.dart';
import 'package:my_town/constants/constants.dart';
import 'package:my_town/presentation/screens/main/bag/bag_page.dart';
import 'package:my_town/presentation/screens/main/home/home_page.dart';
import 'package:my_town/presentation/screens/main/profile/profile_page.dart';
import 'package:my_town/presentation/screens/main/services/services_page.dart';
import 'package:my_town/presentation/screens/main/store/store_page.dart';
import 'package:my_town/presentation/widgets/drawer_widget.dart';

class NavPage extends StatefulWidget {
  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _selectedIndex = 0;
  List _screens = [
    HomePage(),
    StorePage(),
    BagPage(),
    ServicesPage(),
    ProfilePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      drawer: DrawerWidget(),
      // appBar: AppBar(
      //   iconTheme: IconThemeData(color: kDarkColor),
      //   centerTitle: true,
      //   // leading: IconButton(
      //   //   onPressed: () {
      //   //     ScaffoldState().openDrawer();
      //   //   },
      //   //   icon: ImageIcon(
      //   //     AssetImage('assets/images/align-left.png'),
      //   //     size: 24,
      //   //     color: kDarkColor,
      //   //   ),
      //   // ),
      //   title: Row(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       // ImageIcon(
      //       //   AssetImage('assets/images/place-icon.png'),
      //       //   size: 24,
      //       //   color: kDarkColor,
      //       // ),
      //       Text(
      //         'Nutan Durgapur',
      //         style: TextStyle(
      //           fontSize: 16,
      //           fontWeight: FontWeight.bold,
      //           color: Color(0xFFF66C9B),
      //         ),
      //       ),
      //       // ImageIcon(
      //       //   AssetImage('assets/images/arrow-down.png'),
      //       //   size: 24,
      //       //   color: kDarkColor,
      //       // ),
      //     ],
      //   ),
      //   actions: [
      //     // IconButton(
      //     //   onPressed: () {
      //     //     showSearch(
      //     //       context: context,
      //     //       delegate: CustomSearchDelegate(),
      //     //     );
      //     //   },
      //     //   icon: ImageIcon(
      //     //     AssetImage('assets/images/search.png'),
      //     //     size: 24,
      //     //     color: kDarkColor,
      //     //   ),
      //     // ),
      //     IconButton(
      //       onPressed: () {
      //         showGeneralDialog(
      //           context: context,
      //           barrierDismissible: false,
      //           transitionDuration: Duration(milliseconds: 0),
      //           transitionBuilder:
      //               (context, animation, secondaryAnimation, child) {
      //             return FadeTransition(
      //               opacity: animation,
      //               child: ScaleTransition(
      //                 scale: animation,
      //                 child: child,
      //               ),
      //             );
      //           },
      //           pageBuilder: (context, animation, secondaryAnimation) {
      //             return Scaffold(
      //               body: SafeArea(
      //                 child: Container(
      //                   width: MediaQuery.of(context).size.width,
      //                   height: MediaQuery.of(context).size.height,
      //                   padding: EdgeInsets.all(20),
      //                   color: Colors.white,
      //                   child: Column(
      //                     children: [
      //                       Text('Cart products'),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             );
      //           },
      //         );
      //       },
      //       icon: ImageIcon(
      //         AssetImage('assets/images/bag1.png'),
      //         size: 24,
      //         color: kDarkColor,
      //       ),
      //     ),
      //   ],
      //   backgroundColor: Colors.white,
      //   elevation: 1,
      //   bottomOpacity: 0,
      //   textTheme: Theme.of(context).textTheme,
      // ),
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
            icon: ImageIcon(
              AssetImage('assets/images/home2.png'),
              size: 24,
            ),
            activeIcon: ImageIcon(
              AssetImage('assets/images/home2.png'),
              size: 24,
              color: kDarkColor,
            ),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/food.png'),
              size: 24,
            ),
            activeIcon: ImageIcon(
              AssetImage('assets/images/food.png'),
              size: 24,
              color: kDarkColor,
            ),
            label: 'Grocery',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/fast-food.png'),
              size: 24,
            ),
            activeIcon: ImageIcon(
              AssetImage('assets/images/fast-food.png'),
              size: 24,
              color: kDarkColor,
            ),
            label: 'Food',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/shopping-bag.png'),
              size: 24,
            ),
            activeIcon: ImageIcon(
              AssetImage('assets/images/shopping-bag.png'),
              color: kDarkColor,
              size: 24,
            ),
            label: 'Stores',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/people.png'),
              size: 24,
            ),
            activeIcon: ImageIcon(
              AssetImage('assets/images/people.png'),
              size: 24,
              color: kDarkColor,
            ),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/offer.png'),
              size: 24,
            ),
            activeIcon: ImageIcon(
              AssetImage('assets/images/offer.png'),
              size: 24,
              color: kDarkColor,
            ),
            label: 'Offers',
          ),

          // BottomNavigationBarItem(
          //   icon: Icon(Icons.account_balance_wallet_outlined),
          //   activeIcon: Icon(Icons.account_balance_wallet),
          //   label: 'Wallet',
          // ),
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListTile(
      title: Text('Results'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListTile(
      title: Text('Suggestion'),
    );
  }
}
