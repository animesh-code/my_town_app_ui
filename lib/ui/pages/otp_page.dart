import 'package:auth/auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_town/models/Credential.dart';
import 'package:my_town/states_manegment/auth/auth_cubit.dart';
import 'package:my_town/ui/pages/register_page.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:flutter/material.dart';

class OtpPage extends StatelessWidget {
  final String number;
  final IVerifyService _verifyService;

  OtpPage(this.number, this._verifyService);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: GestureDetector(
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        //   child: Icon(
        //     Icons.arrow_back,
        //     size: 30,
        //     color: Colors.black,
        //   ),
        // ),
        title: Text(
          "OTP Verification",
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Enter the OTP sent to ' + number,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black38,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          BlocConsumer<PreAuthCubit, AuthState>(
            listener: (context, state) {
              if (state is LodingState) {
                _showLoader(context);
              }
              if (state is CheckOtpSuccessState) {
                _hideLoader(context);
                Navigator.of(context).pushReplacementNamed('/register');
              }
              if (state is ErrorState) {
                _hideLoader(context);
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (context, state) {
              return OTPTextField(
                length: 4,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 60,
                style: TextStyle(fontSize: 17),
                textFieldAlignment: MainAxisAlignment.spaceEvenly,
                fieldStyle: FieldStyle.box,
                onChanged: (pin) {
                  print("Changed: " + pin);
                },
                onCompleted: (pin) {
                  print("Completed: " + pin);
                  final credential = Credential(code: pin, number: number);
                  BlocProvider.of<PreAuthCubit>(context)
                      .checkOtp(_verifyService, credential);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  _showLoader(context) {
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

  _hideLoader(context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
