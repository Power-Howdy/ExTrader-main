// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:coinspace/config.dart';
import 'package:coinspace/common/theme/app_themes.dart';
import 'package:coinspace/services/api_service.dart';
import 'package:coinspace/services/secure_storage.dart';
import 'package:coinspace/view/auth/signup_screen.dart';
import 'package:coinspace/view/tab_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Instance of SecureStorage
  final SecureStorage secureStorage = SecureStorage();

  @override
  void dispose() {
    // Dispose controllers when the widget is removed from the widget tree
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    final APIService apiService = APIService();
    try {
      // var response = await apiService.connect(
      //   user: "1235711927",
      //   password: "j7izyye",
      //   host: '88.150.180.170',
      //   port: 443,
      // );

      // Assuming 'connect' method returns the response directly for this example
      // Parse response, save access key, and navigate on success
      //String responseBody = await response.stream.bytesToString();
      // await secureStorage.saveAccessKey(response);
      // print("test");
      Get.offAll(
        const TabScreen(),
        transition: Transition.rightToLeft,
      );
    } catch (e) {
      // Handle exceptions from the request
      print("Exception occurred: $e");
      // Optionally, show an error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const ClampingScrollPhysics(),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery.of(context).padding.top + 20),
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              imageAssets.appIcon,
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Welcome",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Sign in to your account",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: HexColor(AppTheme.secondaryColorString!),
                            ),
                      ),
                      const SizedBox(height: 40),
                      CustomTextField(
                        hintText: "Email",
                        prefix: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            imageAssets.email,
                            color: HexColor(AppTheme.secondaryColorString!),
                          ),
                        ),
                        sufix: const SizedBox(),
                        textEditingController: TextEditingController(),
                        inputType: TextInputType.emailAddress,
                        isObsecure: false,
                      ),
                      const SizedBox(height: 30),
                      CustomTextField(
                        hintText: "Password",
                        prefix: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            imageAssets.lock,
                            color: HexColor(AppTheme.secondaryColorString!),
                          ),
                        ),
                        sufix: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            imageAssets.eye,
                            color: HexColor(AppTheme.secondaryColorString!),
                          ),
                        ),
                        textEditingController: TextEditingController(),
                        inputType: TextInputType.emailAddress,
                        isObsecure: false,
                      ),
                      const SizedBox(height: 30),
                      CustomButton(
                        text: "Sign In",
                        onTap: _login,
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: Text(
                          "Forgot password?",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: HexColor(AppTheme.primaryColorString!),
                              ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(
                  () => const SignupScreen(),
                  transition: Transition.rightToLeft,
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account? ",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: HexColor(AppTheme.secondaryColorString!),
                        ),
                  ),
                  Text(
                    "Sign Up",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: HexColor(AppTheme.primaryColorString!),
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
