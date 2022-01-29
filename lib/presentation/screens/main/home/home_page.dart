import 'package:flutter/material.dart';
import 'package:my_town/config/app/size_config.dart';
import 'package:my_town/constants/constants.dart';
import 'package:my_town/presentation/screens/main/home/components/featured_section.dart';
import 'package:my_town/presentation/screens/main/home/components/popular_section.dart';
import 'package:my_town/presentation/widgets/custom_app_bar.dart';
import 'package:my_town/presentation/widgets/custom_search_bar.dart';
import 'package:my_town/presentation/widgets/custom_slider.dart';
import 'package:my_town/presentation/widgets/drawer_widget.dart';
import 'package:my_town/presentation/widgets/image_card.dart';
import 'package:my_town/presentation/widgets/section.dart';

class HomePage extends StatelessWidget {
  final List _sliderImages = [
    "assets/images/slide_1.jpg",
    "assets/images/slide_2.jpg",
    "assets/images/slide_3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: CustomAppBar(
        appBar: AppBar(),
        title: TextButton(
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'User Location',
                style: TextStyle(
                  color: kDarkColor,
                  fontSize: getProportionateScreenHeight(16),
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: kDarkColor,
              ),
            ],
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: CustomScrollView(
          slivers: [
            CustomSearchBar(),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                margin:
                    EdgeInsets.only(bottom: getProportionateScreenHeight(8)),
                padding: EdgeInsets.only(
                  top: getProportionateScreenHeight(8),
                  bottom: getProportionateScreenHeight(6),
                  left: getProportionateScreenWidth(12),
                  right: getProportionateScreenWidth(12),
                ),
                child: CustomSliderWidget(
                  items: _sliderImages,
                ),
              ),
            ),
            PopularSection(),
            SliverToBoxAdapter(
              child: SizedBox(
                height: getProportionateScreenHeight(8),
              ),
            ),
            FeaturedSection(),
            SliverToBoxAdapter(
              child: SizedBox(
                height: getProportionateScreenHeight(8),
              ),
            ),
            SliverToBoxAdapter(
              child: Section(
                'Hot Deals',
                _sliderImages.map((imagePath) => ImageCard(imagePath)).toList(),
              ),
            ),
            PopularSection(),
          ],
        ),
      ),
    );
  }
}

Future<void> _refresh() {
  return Future.delayed(Duration(seconds: 3));
}
