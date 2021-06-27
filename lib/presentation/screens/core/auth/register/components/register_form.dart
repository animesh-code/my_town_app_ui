import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:my_town/config/app/size_config.dart';
import 'package:my_town/presentation/widgets/default_button.dart';
import 'package:my_town/states_manegment/core/form_submission_status.dart';
import 'package:my_town/states_manegment/core/register/register_bloc.dart';
import 'package:my_town/states_manegment/location/location_cubit.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  String valueChoose;
  List listItem = [];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    BlocProvider.of<LocationCubit>(context).fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          final formStatus = state.formStatus;
          if (formStatus is FormSubmitting) {
            print('Form Submittibg');
            _showLoader(context);
          } else if (formStatus is SubmissionSuccess) {
            _hideLoader(context);
            _showSnackBar(context, 'Logged in');
          } else if (formStatus is SubmissionFailed) {
            _hideLoader(context);
            _showSnackBar(context, formStatus.exception.toString());
          }
        },
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(getProportionateScreenWidth(25)),
            child: Column(
              children: [
                BlocListener<LocationCubit, LocationState>(
                  listener: (context, state) {
                    if (state is LocationLoaded) {
                      setState(() {
                        listItem.addAll(state.places.places);
                      });
                      print(state.places);
                      print(state.places.places);
                    } else if (state is LocationInterrupt) {
                      print(' <----- Message');
                    }
                  },
                  child: buildDropDown(),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                buildTextInput(),
                SizedBox(
                  height: getProportionateScreenHeight(25),
                ),
                DefaultButton(
                  text: 'CREATE ACCOUNT',
                  press: () {
                    if (_formKey.currentState.validate()) {
                      BlocProvider.of<RegisterBloc>(context)
                          .add(DataSubmitted());
                      print('Working');
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDropDown() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: DropdownButton(
        disabledHint: Text('Loading...'),
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
          BlocProvider.of<RegisterBloc>(context)
              .add(PlaceIdChanged(placeId: newValue));
        },
        items: listItem
            .map((valueItem) => DropdownMenuItem(
                value: (valueItem as Place).id,
                child: Text(
                  (valueItem as Place).city +
                      ',' +
                      (valueItem as Place).district +
                      ',' +
                      (valueItem as Place).state,
                )))
            .toList(),
      ),
    );
  }

  Widget buildTextInput() {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              onChanged: (text) {
                print(text);
                BlocProvider.of<RegisterBloc>(context)
                    .add(NameChanged(name: text));
              },
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
        );
      },
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
