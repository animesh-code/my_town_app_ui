import 'package:flutter/material.dart';
import 'package:my_town/config/app/size_config.dart';
import 'package:my_town/constants/constants.dart';

class ListCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  getProportionateScreenHeight(15),
                ),
                color: Colors.amber,
              ),
              margin: EdgeInsets.only(right: 10),
              height: getProportionateScreenHeight(90),
              width: getProportionateScreenWidth(90),
            ),
            Expanded(
              child: Container(
                height: getProportionateScreenHeight(80),
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rashik Bangali',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Palpara,Krishnagar,Nadia',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: Colors.grey),
                    ),
                    Row(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_pin,
                                size: 16,
                                color: Colors.grey,
                              ),
                              Text(
                                '2.5 km',
                                style: TextStyle(color: kDarkColor),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: getProportionateScreenWidth(30)),
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.star_rate,
                                size: 16,
                                color: Colors.grey,
                              ),
                              Text(
                                '4/5',
                                style: TextStyle(color: kDarkColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Open',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '8:00 AM',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                  Text(
                    '9:30 PM',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
