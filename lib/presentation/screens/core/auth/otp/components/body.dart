import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_town/config/app/size_config.dart';
import 'package:my_town/constants/routing_constants.dart';
import 'package:my_town/presentation/widgets/default_button.dart';
import 'package:my_town/states_manegment/core/form_submission_status.dart';
import 'package:my_town/states_manegment/core/login_state.dart';
import 'package:my_town/states_manegment/core/otp/otp_bloc.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class Body extends StatelessWidget {
  final String number;
  Body(this.number);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Enter the OTP sent to ' + number,
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.grey),
        ),
        SizedBox(height: getProportionateScreenHeight(25)),
        BlocConsumer<OtpBloc, OtpState>(
          listener: (context, state) {
            final loginState = state.loginstate;
            final formStatus = state.formStatus;

            if (formStatus is FormSubmitting || loginState is AttemptingLogin) {
              _showLoader(context);
            } else if (loginState is LoginSuccess &&
                formStatus is SubmissionSuccess) {
              _showSnackBar(context, 'Route to home');
              // Route to home
            } else if ((loginState is LoginFailed &&
                    formStatus is SubmissionSuccess) ||
                formStatus is SubmissionSuccess) {
              // Route to register
              _hideLoader(context);
              Navigator.of(context).pushReplacementNamed(RegisterRoute);
            } else if (formStatus is SubmissionFailed) {
              _hideLoader(context);
              _showSnackBar(context, formStatus.exception.toString());
              BlocProvider.of<OtpBloc>(context).add(OtpFailed());
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
                context.read<OtpBloc>().add(OtpChanged(otp: pin));
                print("Changed: " + pin);
              },
              onCompleted: (pin) {
                //
              },
            );
          },
        ),
        SizedBox(
          height: getProportionateScreenHeight(25),
        ),
        BlocBuilder<OtpBloc, OtpState>(
          builder: (context, state) {
            return DefaultButton(
              text: 'SUBMIT',
              press: () {
                context.read<OtpBloc>().add(OtpSubmitted());
              },
            );
          },
        ),
      ],
    );
  }

  void _showLoader(BuildContext context) {
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

  void _hideLoader(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
