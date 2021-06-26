import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:my_town/ui/pages/home_page.dart';

class RegisterPage extends StatefulWidget {
  final IVerifyService _verifyService;
  RegisterPage(this._verifyService);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String valueChoose;
  List listItem = [
    'Krishnagar,Nadia,westBengal',
    'Ranaghat,Nadia,westBengal',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome ",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        textTheme: Theme.of(context).textTheme,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'Enter your Information',
                style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: DropdownButton(
                hint: Text('Choose your city'),
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 40,
                isExpanded: true,
                underline: SizedBox(),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                value: valueChoose,
                onChanged: (newValue) {
                  setState(() {
                    valueChoose = newValue;
                  });
                },
                items: listItem
                    .map((valueItem) => DropdownMenuItem(
                        value: valueItem, child: Text(valueItem)))
                    .toList(),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  textCapitalization: TextCapitalization.words,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Your Name',
                    alignLabelWithHint: true,
                  ),
                  cursorColor: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ConstrainedBox(
              constraints: BoxConstraints.expand(
                width: double.infinity - 50.0,
                height: 58.0,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    // padding: EdgeInsets.symmetric(horizontal: 105, vertical: 18),
                    textStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => HomePage()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: Text(
                  'CREATE ACCOUNT',
                  style: TextStyle(fontSize: 16, letterSpacing: 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
