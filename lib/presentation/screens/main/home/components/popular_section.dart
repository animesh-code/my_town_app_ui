import 'package:flutter/material.dart';
import 'package:my_town/config/app/size_config.dart';
import 'package:my_town/constants/constants.dart';

class PopularSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Ink(
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(4),
          ),
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(12),
                  bottom: getProportionateScreenHeight(6),
                ),
                child: Text(
                  'Popular Stores',
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        fontWeight: FontWeight.w500,
                        color: kDarkColor,
                      ),
                ),
              ),
              Container(
                height: getProportionateScreenHeight(130),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                        left: getProportionateScreenWidth(16),
                        top: getProportionateScreenHeight(10),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 1,
                          color: kLightColor,
                        ),
                      ),
                      // height: getProportionateScreenHeight(80),
                      width: getProportionateScreenWidth(250),
                      child: InkWell(
                        onTap: () {},
                        splashColor: kSecondaryColor,
                        child: Ink(
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: getProportionateScreenWidth(8),
                                  right: getProportionateScreenWidth(8),
                                ),
                                color: Colors.amber,
                                height: getProportionateScreenHeight(80),
                                width: getProportionateScreenWidth(80),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Baked and Grill',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: kDarkColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(6),
                                  ),
                                  Text(
                                    'Restaurents',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: kLightColor,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(8),
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.delivery_dining,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width:
                                                getProportionateScreenWidth(4),
                                          ),
                                          Text(
                                            '2 hr',
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: kDarkColor,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: getProportionateScreenWidth(5),
                                      ),
                                      Container(
                                        height:
                                            getProportionateScreenHeight(10),
                                        width: getProportionateScreenWidth(1),
                                        color: kLightColor,
                                      ),
                                      SizedBox(
                                        width: getProportionateScreenWidth(5),
                                      ),
                                      Text(
                                        '1.8 kms',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: kDarkColor,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      SizedBox(
                                        width: getProportionateScreenWidth(5),
                                      ),
                                      Container(
                                        height:
                                            getProportionateScreenHeight(10),
                                        width: getProportionateScreenWidth(1),
                                        color: kLightColor,
                                      ),
                                      SizedBox(
                                        width: getProportionateScreenWidth(5),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star_border,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width:
                                                getProportionateScreenWidth(4),
                                          ),
                                          Text(
                                            '4.3',
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: kDarkColor,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(5),
                                  ),
                                  Container(
                                    width: getProportionateScreenWidth(145),
                                    height: getProportionateScreenHeight(1),
                                    color: kLightColor,
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(5),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.local_offer,
                                        size: 14,
                                        color: kPrimaryColor,
                                      ),
                                      SizedBox(
                                        width: getProportionateScreenWidth(5),
                                      ),
                                      Text(
                                        'Upto 30% off on 5 Products',
                                        // 'Exciting offers coming soon',
                                        style: TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
