import 'package:flutter/material.dart';
import 'package:instagram/src/view/auth/login/login.dart';
import 'package:instagram/src/view/navigation/navigation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../google_api/google.dart';
import '../../../reuseable_widget/alert_dialog.dart';
import '../../../service/storage/storage_service.dart';

class SignUpViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();

  String? validateEmail(value) {
    RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    } else {
      return null;
    }
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool visible = true;
  bool conFPvisible = true;

  navigateToNavigationView() {
    locator<NavigationService>().replaceWithTransition(const NavigationView());
  }

  navigateToLoginView() {
    locator<NavigationService>().navigateWithTransition(
      const LoginView(),
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

  signUp(BuildContext context) {
    if (passwordController.text == confirmPasswordController.text) {
      if (formKey.currentState!.validate() == true) {
        LocalStorageServices.saveUser(
            password: passwordController.text, userEmail: emailController.text);

        navigateToNavigationView();
      } else {
        formKey.currentState!.validate();
      }
    } else {
      showAlertDialog(
        title: 'Invalid credential!',
        content: 'Confirm password not match.',
        context: context,
      );
    }
  }
}
