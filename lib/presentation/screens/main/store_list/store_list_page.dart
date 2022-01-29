import 'package:flutter/material.dart';
import 'package:my_town/config/app/size_config.dart';
import 'package:my_town/constants/constants.dart';
import 'package:my_town/presentation/screens/main/store_list/components/body.dart';

class StoreListPage extends StatelessWidget {
  final String _storeName;

  StoreListPage(this._storeName);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          color: kDarkColor,
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          _storeName,
          style: TextStyle(
            color: kDarkColor,
          ),
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
                    color: kPrimaryColor,
                  ),
                  child: Center(
                      child: Text(
                    '12',
                    style: TextStyle(fontSize: 10),
                  )),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Body(),
    );
  }
}
