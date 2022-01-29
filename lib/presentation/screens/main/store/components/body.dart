import 'package:flutter/material.dart';
import 'package:my_town/config/app/size_config.dart';
import 'package:my_town/constants/constants.dart';
import 'package:my_town/presentation/screens/main/store/components/store_category_list.dart';
import 'package:my_town/presentation/widgets/custom_app_bar.dart';
import 'package:my_town/presentation/widgets/custom_search_bar.dart';
import 'package:my_town/presentation/widgets/custom_slider.dart';

class Body extends StatelessWidget {
  final List _sliderImages = [
    "assets/images/slide_1.jpg",
    "assets/images/slide_2.jpg",
    "assets/images/slide_3.jpg",
  ];

  final List _stores = [
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
    return CustomScrollView(
      slivers: [
        CustomSearchBar(),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(
              top: getProportionateScreenHeight(8),
              bottom: getProportionateScreenHeight(12),
              left: getProportionateScreenWidth(8),
              right: getProportionateScreenWidth(8),
            ),
            child: CustomSliderWidget(
              items: _sliderImages,
            ),
          ),
        ),
        StoreCategoryList(),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(top: getProportionateScreenHeight(20)),
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(15),
            ),
            child: Text(
              'Popular Offers',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SliverGrid.count(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2), blurRadius: 12.0),
                ],
              ),
              margin: EdgeInsets.all(getProportionateScreenHeight(15)),
              // color: kPrimaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: kDarkColor.withOpacity(0.2),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    width: double.infinity,
                    height: 130,
                    child: Image.asset(
                      'assets/images/slide_2.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Text(
                    '50% Off on Everything',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: getProportionateScreenWidth(15),
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(5),
                  ),
                  Text(
                    "Mother's Hut",
                    style: TextStyle(
                      color: kDarkColor,
                      fontSize: getProportionateScreenWidth(15),
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(getProportionateScreenHeight(15)),
              color: kPrimaryColor,
            ),
            Container(
              margin: EdgeInsets.all(getProportionateScreenHeight(15)),
              color: kPrimaryColor,
            ),
            Container(
              margin: EdgeInsets.all(getProportionateScreenHeight(15)),
              color: kPrimaryColor,
            ),
          ],
        )
      ],
    );
  }

  void showStores() {
    //
  }
}
