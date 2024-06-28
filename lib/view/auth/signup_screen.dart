// ignore_for_file: deprecated_member_use

import 'package:coinspace/config.dart';
import 'package:coinspace/common/theme/app_themes.dart';
import 'package:coinspace/services/api_service.dart';
import 'package:coinspace/view/auth/email_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _signup() async {
    String firstName = _firstName.text;
    String lastName = _lastName.text;
    String email = _email.text;
    String password = _password.text;
    if(firstName == "") {
      Fluttertoast.showToast(msg: "Please fill in your first name.");
      return;
    }
    if(lastName == ""){
      Fluttertoast.showToast(msg: "Please fill in your last name");
      return;
    }
    if(email == "") {
      Fluttertoast.showToast(msg: "Please fill in your email address");
      return;
    }
    if(password == "") {
      Fluttertoast.showToast(msg: "Please fill in your password");
      return;
    }

    final APIService apiService = APIService();
    try {
      Map<String, String> data = {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password
      };
      await apiService.postData("user/add", data);
      Fluttertoast.showToast(msg: "Please verify your email.");
      Get.offAll(const EmailScreen(), transition: Transition.fadeIn);

    } catch (e) {
      Fluttertoast.showToast(
          msg: "Error occurred: $e",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 20),
            const BackIcon(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const ClampingScrollPhysics(),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50),
                      Text(
                        "Join CoinSpace",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "Create your account. ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      HexColor(AppTheme.secondaryColorString!),
                                ),
                          ),
                          Text(
                            "Learn more",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: HexColor(AppTheme.primaryColorString!),
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      CustomTextField(
                        hintText: "First Name",
                        prefix: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            imageAssets.user,
                            color: HexColor(AppTheme.secondaryColorString!),
                          ),
                        ),
                        sufix: const SizedBox(),
                        textEditingController: _firstName,
                        inputType: TextInputType.name,
                        isObsecure: false,
                      ),
                      const SizedBox(height: 30),
                      CustomTextField(
                        hintText: "Last Name",
                        prefix: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            imageAssets.user,
                            color: HexColor(AppTheme.secondaryColorString!),
                          ),
                        ),
                        sufix: const SizedBox(),
                        textEditingController: _lastName,
                        inputType: TextInputType.name,
                        isObsecure: false,
                      ),
                      const SizedBox(height: 30),
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
                        textEditingController: _email,
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
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            imageAssets.eye,
                            color: HexColor(AppTheme.secondaryColorString!),
                          ),
                        ),
                        textEditingController: _password,
                        inputType: TextInputType.visiblePassword,
                        isObsecure: false,
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 40),
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color:
                                      HexColor(AppTheme.secondaryColorString!),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "I certify that I am 18 years of age or older, and I",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: HexColor(
                                          AppTheme.secondaryColorString!),
                                    ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    "agree to the ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: HexColor(
                                              AppTheme.secondaryColorString!),
                                        ),
                                  ),
                                  Text(
                                    "User Agreement ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: HexColor(
                                              AppTheme.primaryColorString!),
                                        ),
                                  ),
                                  Text(
                                    "and",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: HexColor(
                                              AppTheme.secondaryColorString!),
                                        ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Privacy Policy",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: HexColor(
                                          AppTheme.primaryColorString!),
                                    ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                      CustomButton(
                        text: "Sign Up",
                        onTap: _signup,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
