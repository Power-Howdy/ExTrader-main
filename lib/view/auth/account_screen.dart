// ignore_for_file: deprecated_member_use

import 'package:coinspace/config.dart';
import 'package:coinspace/common/theme/app_themes.dart';
import 'package:coinspace/view/auth/number_screen.dart';
import 'package:coinspace/view/auth/personal_information_screen.dart';

class AccountScreen extends StatefulWidget {
  final bool isAuth;
  const AccountScreen({super.key, required this.isAuth});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 60),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const ClampingScrollPhysics(),
                children: [
                  Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            imageAssets.accountImage,
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Let's secure your account",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  const SizedBox(height: 20),
                  widget.isAuth == true
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var i = 0; i < 3; i++)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      i == 0
                                          ? "Step1. Create your account"
                                          : i == 1
                                              ? "Step2. Phone Number"
                                              : "Step3. Verify your identity",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: i == 2
                                                  ? HexColor(AppTheme
                                                      .primaryColorString!)
                                                  : HexColor(AppTheme
                                                      .secondaryColorString!)),
                                    ),
                                    i == 0 || i == 1
                                        ? SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: Image.asset(
                                              imageAssets.check,
                                            ),
                                          )
                                        : Text(
                                            "5 min",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: i == 1
                                                      ? HexColor(AppTheme
                                                          .primaryColorString!)
                                                      : HexColor(AppTheme
                                                          .secondaryColorString!),
                                                ),
                                          ),
                                  ],
                                ),
                              )
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var i = 0; i < 3; i++)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      i == 0
                                          ? "Step1. Create your account"
                                          : i == 1
                                              ? "Step2. Phone Number"
                                              : "Step3. Verify your identity",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: i == 1
                                                  ? HexColor(AppTheme
                                                      .primaryColorString!)
                                                  : HexColor(AppTheme
                                                      .secondaryColorString!)),
                                    ),
                                    i == 0
                                        ? SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: Image.asset(
                                              imageAssets.check,
                                            ),
                                          )
                                        : Text(
                                            i == 1 ? "1 min" : "5 min",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: i == 1
                                                      ? HexColor(AppTheme
                                                          .primaryColorString!)
                                                      : HexColor(AppTheme
                                                          .secondaryColorString!),
                                                ),
                                          ),
                                  ],
                                ),
                              )
                          ],
                        )
                ],
              ),
            ),
            CustomButton(
              text: "Next",
              onTap: () {
                if (widget.isAuth == true) {
                  Get.to(
                    () => const PersonalInformationScreen(),
                    transition: Transition.rightToLeft,
                  );
                } else {
                  Get.to(
                    () => const NumberScreen(),
                    transition: Transition.rightToLeft,
                  );
                }
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
