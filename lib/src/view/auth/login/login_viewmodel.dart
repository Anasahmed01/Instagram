import 'package:flutter/material.dart';
import 'package:instagram/src/google_api/google.dart';
import 'package:instagram/src/service/storage/storage_service.dart';
import 'package:instagram/src/view/auth/sign_up/sign_up.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../reuseable_widget/alert_dialog.dart';
import '../../navigation/navigation.dart';

class LoginViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();

  String? validateEmail(value) {
    RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    } else {
      return null;
    }
  }

  // String? validatePassword(value) {
  //   if (value!.isEmpty) {
  //     return 'Please enter a password';
  //   }
  //   if (value.length != 6) {
  //     return 'please enter a 6-latters password';
  //   }
  //   return null;
  // }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool visible = true;

  navigateToNavigationView() {
    locator<NavigationService>().replaceWithTransition(
      const NavigationView(),
      opaque: true,
    );
  }

  navigateToSignupView() {
    locator<NavigationService>().navigateWithTransition(
      const SignUpView(),
    );
  }

  Future signIn(context) async {
    final user = await GoogleSignInApi.login();
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Sign in Faild!'),
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const NavigationView(),
        ),
      );
    }
  }

  String email = 'demo@gmail.com';
  String password = '123456';

  login(context) {
    LocalStorageServices.saveUser(password: password, userEmail: email);

    if (email == emailController.text && password == passwordController.text) {
      navigateToNavigationView();
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text('Invalid credential!'),
      //   ),
      // );
      showAlertDialog(
        title: 'Invalid credential!',
        content: 'Please enter a valid credential.',
        context: context,
      );
    }
  }
}
