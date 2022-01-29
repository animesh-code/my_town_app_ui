import 'package:flutter/material.dart';
import 'package:my_town/config/app/size_config.dart';
import 'package:my_town/constants/constants.dart';
import 'package:my_town/ui/pages/products_page.dart';

class StoreUiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.1,
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            color: kDarkColor,
            onPressed: () {},
            // icon: Icon(Icons.close),
            icon: Icon(Icons.arrow_back),
          ),
          title: Text(
            'Store Name',
            style: TextStyle(color: kDarkColor, fontWeight: FontWeight.w600),
          ),
          actions: [
            Stack(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    color: kDarkColor,
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    height: getProportionateScreenHeight(16),
                    width: getProportionateScreenWidth(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        getProportionateScreenHeight(10),
                      ),
                      color: kSecondaryColor,
                    ),
                    child: Center(
                        child: Text(
                      '8',
                      style: TextStyle(fontSize: 10),
                    )),
                  ),
                ),
              ],
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: kDarkColor,
            indicatorWeight: 3.0,
            onTap: (index) {
              print(index);
            },
            tabs: [
              Tab(
                child: Container(
                  child: Text(
                    'Home',
                    style: TextStyle(color: kDarkColor, fontSize: 18.0),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    'Home',
                    style: TextStyle(
                      color: kDarkColor,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    'Home',
                    style: TextStyle(color: kDarkColor, fontSize: 18.0),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    'Home',
                    style: TextStyle(color: kDarkColor, fontSize: 18.0),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    'Home',
                    style: TextStyle(color: kDarkColor, fontSize: 18.0),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    'Home',
                    style: TextStyle(color: kDarkColor, fontSize: 18.0),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    'Home',
                    style: TextStyle(color: kDarkColor, fontSize: 18.0),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    'Home',
                    style: TextStyle(color: kDarkColor, fontSize: 18.0),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ProductsPage(),
            Center(
              child: Text('Home'),
            ),
            Center(
              child: Text('Home'),
            ),
            Center(
              child: Text('Home'),
            ),
            Center(
              child: Text('Home'),
            ),
            Center(
              child: Text('Home'),
            ),
            Center(
              child: Text('Home'),
            ),
            Center(
              child: Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}
