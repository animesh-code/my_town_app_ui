import 'package:flutter/material.dart';
import 'package:my_town/presentation/screens/main/store_list/components/body.dart';

class StoreListPage extends StatelessWidget {
  final String _storeName;

  StoreListPage(this._storeName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.arrow_back),
      ),
      title: Text(_storeName),
    );
  }
}
