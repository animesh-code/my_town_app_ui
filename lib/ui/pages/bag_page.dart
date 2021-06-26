import 'package:flutter/material.dart';

class BagPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            // color: Colors.blue,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  color: Colors.blue[400],
                  child: TabBar(
                    onTap: (_) {},
                    // isScrollable: true,
                    indicatorColor: Colors.white,
                    indicatorWeight: 6.0,
                    tabs: [
                      Tab(
                        child: Container(
                          child: Text(
                            'Bag',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text(
                            'Wishlist',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text(
                            'Orders',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 400,
                  child: TabBarView(children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset('assets/images/bag.png'),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset('assets/images/wishlist.png'),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset('assets/images/order.png'),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
