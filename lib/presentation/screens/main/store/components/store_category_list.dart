import 'package:flutter/material.dart';
import 'package:my_town/constants/constants.dart';

class StoreCategoryList extends StatelessWidget {
  final List stores = [
    {
      "name": "Grocery",
      "color": Color(0xffE2F3C2),
      "image": 'assets/images/grocery.png',
    },
    {
      "name": "Restaurants",
      "color": Color(0xffFCE8A8),
      "image": 'assets/images/restaurents.png',
    },
    {
      "name": "Books",
      "color": Color(0xffDFECF8),
      "image": 'assets/images/books.png',
    },
    {
      "name": "Gift & Deco.",
      "color": Color(0xffFFDBC5),
      "image": 'assets/images/gift.png',
    },
    {
      "name": "Medicine",
      "color": Color(0xffFCE8A8),
      "image": 'assets/images/medicine.png',
    },
    {
      "name": "Stationary",
      "color": Color(0xffDFEED4),
      "image": 'assets/images/stationary.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 120.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: stores.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: showStores,
                  child: Container(
                    margin: EdgeInsets.only(left: 8),
                    padding: EdgeInsets.all(15),
                    height: 90.0,
                    width: 90.0,
                    decoration: BoxDecoration(
                      color: stores[index]['color'],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.asset(
                      stores[index]['image'],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  stores[index]['name'],
                  style: TextStyle(
                    color: kDarkColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void showStores() {
    //
  }
}
