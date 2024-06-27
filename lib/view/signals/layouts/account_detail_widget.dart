import 'package:coinspace/config.dart';

import '../../../common/theme/app_css.dart';

class AccountDetailWidget extends StatelessWidget {
  const AccountDetailWidget({Key? key, required this.signal}) : super(key: key);

  final SignalsModel signal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: InkWell(
        onTap: () {
          Get.to(
            () => SignalDetailView(signal: signal),
            transition: Transition.rightToLeft,
          );
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "balance :",
                      style: AppCss.poppinsRegular12,
                    ),
                    Text(
                      "XXXXXX",
                      style: AppCss.poppinsRegular17,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "holding profit/loss :",
                      style: AppCss.poppinsRegular12,
                    ),
                    Text(
                      "XXXXXX",
                      style: AppCss.poppinsRegular17,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "total profit/loss :",
                      style: AppCss.poppinsRegular12,
                    ),
                    Text(
                      "XXXXXX",
                      style: AppCss.poppinsRegular17,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "growth rate :",
                      style: AppCss.poppinsRegular12,
                    ),
                    Text(
                      "XXXXXX",
                      style: AppCss.poppinsRegular17,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "average monthly profit :",
                      style: AppCss.poppinsRegular12,
                    ),
                    Text(
                      "XXXXXX",
                      style: AppCss.poppinsRegular17,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "deposits :",
                      style: AppCss.poppinsRegular12,
                    ),
                    Text(
                      "XXXXXX",
                      style: AppCss.poppinsRegular17,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
