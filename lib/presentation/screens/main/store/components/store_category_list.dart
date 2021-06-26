import 'package:flutter/material.dart';
import 'package:my_town/constants/constants.dart';

class StoreCategoryList extends StatelessWidget {
  final List stores;
  final Function press;
  StoreCategoryList({
    @required this.stores,
    @required this.press,
  });

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
                  onTap: press,
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
}
