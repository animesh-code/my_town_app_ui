import 'package:flutter/material.dart';
import 'package:my_town/ui/pages/store_ui_page.dart';

class StoreListPage extends StatelessWidget {
  final String category;

  StoreListPage(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // backgroundColor: Colors.white,
        title: Text(
          category + ' Stores',
          // style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        // padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            ListCard(),
            ListCard(),
            ListCard(),
            ListCard(),
            ListCard(),
            ListCard(),
            ListCard(),
            ListCard(),
            ListCard(),
            ListCard(),
            ListCard(),
            ListCard(),
            ListCard(),
            ListCard(),
            ListCard(),
            ListCard(),
          ],
        ),
      ),
    );
  }
}

class ListCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => StoreUiPage(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 15, left: 10, right: 10),
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5.0,
              offset: Offset(5, 0),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(right: 10),
              height: 80,
              width: 100,
              color: Colors.amber,
            ),
            Expanded(
              child: Container(
                height: 80,
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rashik Bangali',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Palpara,Krishnagar,Nadia',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    Text('Ratings: 4/5')
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
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    '9:30 PM',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
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
