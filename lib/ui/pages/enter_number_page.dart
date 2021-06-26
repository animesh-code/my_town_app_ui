import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:my_town/models/Credential.dart';
import 'package:my_town/states_manegment/auth/auth_cubit.dart';
import 'package:my_town/ui/pages/otp_page.dart';

class EnterNumberPage extends StatelessWidget {
  final IVerifyService _verifyService;

  EnterNumberPage(this._verifyService);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: NumberInput(_verifyService),
        ),
      ),
    );
  }
}

class NumberInput extends StatefulWidget {
  final IVerifyService _verifyService;

  NumberInput(this._verifyService);

  @override
  _NumberInputState createState() => _NumberInputState();
}

class _NumberInputState extends State<NumberInput> {
  var inputNumber;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        padding: EdgeInsets.only(bottom: 80.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // SizedBox(
            //   height: 220,
            //   child: Image.asset('assets/images/holding-phone.png'),
            // ),
            Container(
              margin: EdgeInsets.only(top: 50.0),
              height: 120.0,
              child: BlocConsumer<PreAuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is LodingState) {
                    _showLoader();
                  }
                  if (state is RequestOtpSuccessState) {
                    print('The Number: ' + inputNumber.toString());
                    _hideLoader();
                    Navigator.of(context).pushNamed('/otp',
                        arguments: {'number': inputNumber.toString()});
                  }
                  if (state is ErrorState) {
                    _hideLoader();
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text(state.message)));
                  }
                },
                builder: (context, state) {
                  return Column(
                    children: [
                      Text(
                        'Mobile Verification',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'We will send you an One Time Password on this mobile number',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Colors.black26,
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            InternationalPhoneNumberInput(
              spaceBetweenSelectorAndTextField: 0,
              onInputChanged: (PhoneNumber number) {
                // print(number.phoneNumber);
                print(number);
                setState(() {
                  inputNumber = number;
                });
              },
              onInputValidated: (bool value) {
                print(value);
              },
              selectorConfig: SelectorConfig(
                selectorType: PhoneInputSelectorType.DIALOG,
              ),
              ignoreBlank: false,
              autoValidateMode: AutovalidateMode.disabled,
              selectorTextStyle: TextStyle(color: Colors.black),
              initialValue: number,
              textFieldController: controller,
              formatInput: false,
              keyboardType:
                  TextInputType.numberWithOptions(signed: true, decimal: true),
              inputBorder: OutlineInputBorder(),
              onSaved: (PhoneNumber number) {
                // print('On Saved: $number');
              },
            ),
            SizedBox(
              height: 15,
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
                  // _showLoader();
                  final credential = Credential(number: inputNumber.toString());
                  if (formKey.currentState.validate()) {
                    print('working------');
                    BlocProvider.of<PreAuthCubit>(context)
                        .requestOtp(widget._verifyService, credential);
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (_) => OtpPage(inputNumber.toString())));

                  }
                },
                child: Text(
                  'GET OTP',
                  style: TextStyle(fontSize: 16, letterSpacing: 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  _showLoader() {
    var alert = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      content: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white70,
        ),
      ),
    );
    showDialog(
        context: context, barrierDismissible: true, builder: (_) => alert);
  }

  _hideLoader() {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
