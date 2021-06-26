import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:my_town/config/app/size_config.dart';
import 'package:my_town/presentation/widgets/default_button.dart';
import 'package:my_town/states_manegment/core/register/register_bloc.dart';
import 'package:my_town/states_manegment/location/location_cubit.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  String valueChoose;
  List listItem = null;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    context.read<LocationCubit>().fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(25)),
          child: Column(
            children: [
              BlocBuilder<LocationCubit, LocationState>(
                builder: (context, state) {
                  if (state is LocationLoaded) {
                    listItem.addAll(state.places.places);
                  }
                  return buildDropDown();
                },
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
                    context.read<RegisterBloc>().add(DataSubmitted());
                    print('Working');
                  }
                },
              )
            ],
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
                value: valueItem['id'], child: Text(valueItem['city'])))
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
                context.read<RegisterBloc>().add(NameChanged(name: text));
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
}
