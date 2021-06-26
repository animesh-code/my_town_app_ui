import 'package:flutter/material.dart';
import 'package:my_town/ui/pages/product_detail_page.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(24),
      shrinkWrap: true,
      primary: false,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 0.75,
      children: [
        productCard(),
        productCard(),
        productCard(),
        productCard(),
        Container(
          height: 180,
          width: 180,
          color: Colors.yellow,
        ),
        Container(
          height: 180,
          width: 180,
          color: Colors.yellow,
        ),
        Container(
          height: 180,
          width: 180,
          color: Colors.yellow,
        ),
        Container(
          height: 180,
          width: 180,
          color: Colors.yellow,
        ),
        Container(
          height: 180,
          width: 180,
          color: Colors.yellow,
        ),
        Container(
          height: 180,
          width: 180,
          color: Colors.yellow,
        ),
        Container(
          height: 180,
          width: 180,
          color: Colors.yellow,
        ),
        Container(
          height: 180,
          width: 180,
          color: Colors.yellow,
        ),
      ],
    );
  }

  Widget productCard() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ProductDetailPage(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 12.0),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              width: 125,
              height: 125,
              child: Image.asset('assets/images/banana.jpg'),
            ),
            Text(
              'Banana',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),
            Text(
              '12 pcs - 500 to 900 gm',
              style: TextStyle(fontSize: 12),
            ),
            Spacer(),
            Divider(
              height: 0,
              thickness: 0.3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Rs. ${'36'}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Added to Bag'),
                          ),
                        );
                      });
                    },
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      size: 24,
                      color: Colors.green,
                    ),
                  ),
                  Container(
                    height: 24,
                    width: 0.2,
                    color: Colors.grey,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFav = !isFav;
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: isFav
                                ? Text('Added to Favourites')
                                : Text('Removed from Favourites'),
                          ),
                        );
                      });
                    },
                    child: isFav
                        ? Icon(
                            Icons.favorite_outlined,
                            color: Colors.red,
                            size: 24,
                          )
                        : Icon(
                            Icons.favorite_outline,
                            color: Colors.grey,
                            size: 24,
                          ),
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
