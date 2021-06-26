import 'package:flutter/material.dart';
import 'package:my_town/constants/constants.dart';

class CustomAppBar extends StatefulWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 1,
      backgroundColor: Colors.white,
      floating: true,
      title: Container(
        color: kTextColor.withOpacity(0.5),
        child: TextField(
          textInputAction: TextInputAction.search,
          onSubmitted: (value) {
            print(value);
            search(value);
          },
          controller: _searchController,
          style: TextStyle(fontSize: 18),
          decoration: InputDecoration(
            hintText: 'Search accross your city',
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            prefixIcon: Icon(Icons.search),
            suffixIcon: _searchController.text.isEmpty
                ? null
                : InkWell(
                    onTap: () => _searchController.clear(),
                    child: Icon(Icons.clear),
                  ),
          ),
        ),
      ),
    );
  }

  void search(String text) {
    //
  }
}
