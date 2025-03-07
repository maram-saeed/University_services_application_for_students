import 'package:flutter/material.dart';
// import 'package:uniapp/screens/complete_profile/complete_profile_screen.dart';
// import 'package:uniapp/screens/sign_in/components/custom_suffix_icon.dart';
// import 'package:uniapp/screens/sign_in/components/default_button.dart';
// import 'package:uniapp/screens/sign_in/components/form_error.dart';
// import 'package:uniapp/services/auth.dart';
// import '../../../constants.dart';
import 'package:flutter_application_2/size_config.dart';
import 'signIn/formError.dart';
import 'signIn/defaultButton.dart';
import 'signIn/custom_suffix_icon.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  //final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? uni;
  String? confirm_password;
  bool remember = false;
  final List<String> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error!);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error!);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConformPassFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continuer",
            // press: () async {
            //   if (_formKey.currentState!.validate()) {
            //     _formKey.currentState!.save();
            //     // if all are valid then go to success screen
            //     // dynamic result =
            //     //     await _auth.registerWithEmailAndPassword(email, password);
            //     // if (result == null) {
            //     //   //1.format firebase error,add/remove error.
            //     //   // 2.check user email if already registered,before registering with password
            //     //   errors.add(result);
            //     // } else {
            //     //   print(result);
            //     //   Navigator.pushNamed(context, CompleteProfileScreen.routeName);
            //     // }
            //   }
            // },
          ),
        ],
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirm_password = newValue,
      // onChanged: (value) {
      //   // if (value.isNotEmpty) {
      //   //   removeError(error: kPassNullError);
      //   // } else if (value.isNotEmpty && password == confirm_password) {
      //   //   removeError(error: kMatchPassError);
      //   // }
      //   // confirm_password = value;
      // },
      // validator: (value) {
      //   // if (value.isEmpty) {
      //   //   addError(error: kPassNullError);
      //   //   return "";
      //   // } else if ((password != value)) {
      //   //   addError(error: kMatchPassError);
      //   //   return "";
      //   // }
      //   // return null;
      // },
      decoration: InputDecoration(
        labelText: "Confirmez le mot de passe",
        hintText: "Reconfirmez le mot de passe",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      // onChanged: (value) {
      //   // if (value.isNotEmpty) {
      //   //   removeError(error: kPassNullError);
      //   // } else if (value.length >= 8) {
      //   //   removeError(error: kShortPassError);
      //   // }
      //   // password = value;
      // },
      // validator: (value) {
      //   // if (value.isEmpty) {
      //   //   addError(error: kPassNullError);
      //   //   return "";
      //   // } else if (value.length < 8) {
      //   //   addError(error: kShortPassError);
      //   //   return "";
      //   // }
      //   // return null;
      // },
      decoration: InputDecoration(
        labelText: "Mot de passe",
        hintText: "Saisissez votre mot de passe",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      // onChanged: (value) {
      //   // if (value.isNotEmpty) {
      //   //   removeError(error: kEmailNullError);
      //   // } else if (emailValidatorRegExp.hasMatch(value)) {
      //   //   removeError(error: kInvalidEmailError);
      //   // }
      //   // return null;
      // },
      // validator: (value) {
      //   // if (value.isEmpty) {
      //   //   addError(error: kEmailNullError);
      //   //   return "";
      //   // } else if (!emailValidatorRegExp.hasMatch(value)) {
      //   //   addError(error: kInvalidEmailError);
      //   //   return "";
      //   // }
      //   // return null;
      // },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
