import 'package:flutter/material.dart';
import 'package:my_town/config/app/size_config.dart';
import 'package:my_town/constants/constants.dart';

class FeaturedSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Ink(
        color: Colors.white,
        child: Container(
          margin:
              EdgeInsets.symmetric(vertical: getProportionateScreenHeight(4)),
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(18),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(12),
                  bottom: getProportionateScreenHeight(6),
                ),
                child: Text(
                  'Best Offers',
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        fontWeight: FontWeight.w500,
                        color: kDarkColor,
                      ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: getProportionateScreenHeight(12)),
                height: getProportionateScreenHeight(180),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                          left: getProportionateScreenWidth(12),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            width: 1,
                            color: kLightColor,
                          ),
                        ),
                        width: getProportionateScreenWidth(130),
                        child: GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Container(
                                color: Colors.amber,
                                height: getProportionateScreenHeight(75),
                                width: double.infinity,
                              ),
                              Text('Product Name'),
                              Text('500g'),
                              Text('\$23'),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Add'.toUpperCase(),
                                  style: TextStyle(color: kPrimaryColor),
                                ),
                                style: ButtonStyle(
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal: 25,
                                    ),
                                  ),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                    kPrimaryColor,
                                  ),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      side: BorderSide(color: kPrimaryColor),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
