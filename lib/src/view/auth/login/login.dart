import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:instagram/src/reuseable_widget/app_buttons.dart';
import 'package:instagram/src/reuseable_widget/app_divider.dart';
import 'package:instagram/src/reuseable_widget/app_textfield.dart';
import 'package:instagram/src/reuseable_widget/custom_text.dart';
import 'package:instagram/src/utils/colors/app_colors.dart';
import 'package:instagram/src/utils/images/images.dart';
import 'package:instagram/src/view/auth/login/login_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 120,
                        child: ImageIcon(
                          AssetImage(AppImages.instagram),
                          size: 220,
                        ),
                      ),
                      Form(
                        key: viewModel.formKey,
                        child: Column(
                          children: [
                            CustomTextFields.squareTextField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyBoardType: TextInputType.emailAddress,
                              controller: viewModel.emailController,
                              fillColor: true,
                              borderColor: Colors.transparent,
                              hintText: 'Email',
                              hintColor: AppColors.white.withOpacity(0.8),
                              validator: (value) =>
                                  viewModel.validateEmail(value),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextFields.squareTextField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              fillColor: true,
                              keyBoardType: TextInputType.visiblePassword,
                              controller: viewModel.passwordController,
                              borderColor: Colors.transparent,
                              hintText: 'Password',
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    viewModel.rebuildUi();
                                    if (viewModel.visible) {
                                      viewModel.visible = false;
                                    } else {
                                      viewModel.visible = true;
                                    }
                                  },
                                  child: viewModel.visible == true
                                      ? Icon(Icons.visibility_off,
                                          color: AppColors.greyColor)
                                      : Icon(Icons.visibility,
                                          color: AppColors.greyColor)),
                              hintColor: AppColors.white.withOpacity(0.8),
                              obscureText: viewModel.visible,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            AppButtons.appButton(
                                ontap: () {
                                  viewModel.login(context);
                                  // viewModel.navigateToNavigationView();
                                  viewModel.formKey.currentState!.validate();
                                  viewModel.rebuildUi();
                                },
                                context: context,
                                fontWeight: FontWeight.w900,
                                size: 16,
                                title: 'Log In'),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'Forget your login details?  ',
                            children: [
                              TextSpan(
                                text: 'Get help the signing in.',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    launchUrl(
                                        Uri.parse(
                                            "https://help.instagram.com/"),
                                        mode: LaunchMode.externalApplication);
                                  },
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: () => viewModel.signIn(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.google,
                              height: 18,
                            ),
                            CustomText.customSizedText(
                                text: 'Log In with google', size: 12),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: Row(
                          children: [
                            Flexible(
                                child: appDivider(
                                    thickness: 1,
                                    color: AppColors.lightGreyColor)),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40.0),
                              child: CustomText.customSizedText(
                                  text: 'OR', size: 12),
                            ),
                            Flexible(
                              child: appDivider(
                                  thickness: 1,
                                  color: AppColors.lightGreyColor),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Don't have an account?  ",
                          style: const TextStyle(fontSize: 12),
                          children: [
                            TextSpan(
                              text: 'Sign Up',
                              style:
                                  const TextStyle(fontWeight: FontWeight.w700),
                              recognizer: TapGestureRecognizer()
                                ..onTap =
                                    () => viewModel.navigateToSignupView(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
