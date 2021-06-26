import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:my_town/config/app/size_config.dart';
import 'package:my_town/constants/routing_constants.dart';
import 'package:my_town/presentation/widgets/default_button.dart';
import 'package:my_town/states_manegment/core/form_submission_status.dart';
import 'package:my_town/states_manegment/core/number/number_bloc.dart';

class InputForm extends StatefulWidget {
  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  String inputNumber;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildInputField(),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          DefaultButton(
            text: 'GET OTP',
            press: submitNumber,
          ),
        ],
      ),
    );
  }

  Widget buildInputField() {
    return BlocConsumer<NumberBloc, NumberState>(
      listener: (context, state) {
        final formStatus = state.formStatus;

        if (formStatus is FormSubmitting) {
          _showLoader(context);
        }

        if (formStatus is SubmissionFailed) {
          print('Number submission failed');
          _hideLoader(context);
          _showSnackBar(context, formStatus.exception.toString());
        }

        if (formStatus is SubmissionSuccess) {
          _hideLoader(context);
          Navigator.of(context)
              .pushNamed(OtpRoute, arguments: inputNumber.toString());
        }
      },
      builder: (context, state) {
        return InternationalPhoneNumberInput(
          maxLength: 10,
          countries: ['IN'],
          spaceBetweenSelectorAndTextField: 0,
          onInputChanged: (PhoneNumber number) {
            setState(() {
              inputNumber = number.toString();
            });
            context
                .read<NumberBloc>()
                .add(NumberChanged(number: number.toString()));
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
          // textFieldController: controller,
          formatInput: false,
          keyboardType:
              TextInputType.numberWithOptions(signed: true, decimal: true),
          inputBorder: OutlineInputBorder(),
          onSaved: (PhoneNumber number) {
            // print('On Saved: ');
          },
        );
      },
    );
  }

  submitNumber() {
    if (_formKey.currentState.validate()) {
      // print('Working');
      context.read<NumberBloc>().add(NumberSubmitted());
    }
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
