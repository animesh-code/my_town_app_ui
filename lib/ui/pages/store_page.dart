import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_town/ui/pages/store_list_page.dart';
import 'package:my_town/ui/widgets/custom_slider.dart';

class StorePage extends StatefulWidget {
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final _searchController = TextEditingController();
  String valueChoose;
  List filters = [
    'All',
    'Stores',
    'Services',
    'Products',
    'Businesses',
  ];

  List stores = [
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
  void initState() {
    super.initState();
    _searchController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 1,
            backgroundColor: Colors.white,
            floating: true,
            title: Container(
              color: Colors.grey.withOpacity(0.15),
              child: TextField(
                onSubmitted: (value) {
                  print(value);
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
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 8),
              child: CustomSliderWidget(
                items: [
                  "assets/images/slide_1.jpg",
                  "assets/images/slide_2.jpg",
                  "assets/images/slide_3.jpg",
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 120.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stores.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => StoreListPage(
                                stores[index]['name'],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 8),
                          padding: EdgeInsets.all(15),
                          height: 90.0,
                          width: 90.0,
                          decoration: BoxDecoration(
                            color: stores[index]['color'],
                            borderRadius: BorderRadius.circular(5),
                            // image: DecorationImage(
                            //   image: AssetImage('assets/images/grocery.png'),
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                          child: Image.asset(
                            stores[index]['image'],
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        stores[index]['name'],
                        style: GoogleFonts.varelaRound(
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(left: 10, top: 20, bottom: 5, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Offers in different stores',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text('See all'),
                ],
              ),
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 2,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                height: 140,
                width: 140,
                color: Colors.yellow,
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 140,
                width: 140,
                color: Colors.yellow,
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 140,
                width: 140,
                color: Colors.yellow,
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 140,
                width: 140,
                color: Colors.yellow,
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 140,
                width: 140,
                color: Colors.yellow,
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 140,
                width: 140,
                color: Colors.yellow,
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(8),
              height: 200,
              color: Colors.green,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(8),
              height: 200,
              color: Colors.green,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(8),
              height: 200,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
