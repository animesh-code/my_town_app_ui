import 'package:flutter/material.dart';
import 'package:my_town/presentation/screens/main/store_list/components/list_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: ListView.separated(
        itemCount: 20,
        separatorBuilder: (_, __) =>
            Container(height: 1, color: Colors.grey[200]),
        itemBuilder: (context, index) {
          return ListCard();
        },
      ),
    );
  }
}
