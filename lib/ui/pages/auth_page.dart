import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_town/models/Credential.dart';
import 'package:my_town/states_manegment/auth/auth_cubit.dart';
import 'package:my_town/ui/pages/check_otp.dart';
import 'package:my_town/ui/widgets/numeric_pad.dart';

class AuthPage extends StatefulWidget {
  final IVerifyService _verifyService;

  AuthPage(this._verifyService);
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String _phoneNumber = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<PreAuthCubit, AuthState>(
          listener: (_, state) {
            if (state is ErrorState) {
              // ignore: deprecated_member_use
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.message,
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFFFFFFF),
                          Color(0xFFF7F7F7),
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 130,
                          child: Image.asset('assets/images/holding-phone.png'),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 24, horizontal: 64),
                          child: Text(
                            "You'll receive a 4 digit code to verify next.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                              color: Color(0xFF818181),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.13,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 230,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Enter your phone",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '+91',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    _phoneNumber,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: _phoneNumber.length != 10
                                ? () {}
                                : () {
                                    final credential =
                                        Credential(number: "91" + _phoneNumber);
                                    BlocProvider.of<PreAuthCubit>(context)
                                        .requestOtp(
                                            widget._verifyService, credential);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CheckOtp(
                                              phoneNumber: _phoneNumber)),
                                    );
                                  },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFFFDC3D),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Continue",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                NumericPad(
                  onNumberSelected: (value) {
                    if (_phoneNumber.length == 0) {
                      setState(() {
                        if (value != -1) {
                          _phoneNumber = _phoneNumber + value.toString();
                        } else {
                          return;
                        }
                      });
                    } else {
                      _phoneNumber.length == 10
                          ? setState(() {
                              if (value != -1) {
                                print(_phoneNumber);
                              } else {
                                _phoneNumber = _phoneNumber.substring(
                                    0, _phoneNumber.length - 1);
                              }
                            })
                          : setState(() {
                              if (value != -1) {
                                _phoneNumber = _phoneNumber + value.toString();
                              } else {
                                _phoneNumber = _phoneNumber.substring(
                                    0, _phoneNumber.length - 1);
                              }
                            });
                    }
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
