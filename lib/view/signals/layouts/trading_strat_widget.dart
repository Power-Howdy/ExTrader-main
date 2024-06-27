import 'package:coinspace/config.dart';

import '../../../common/theme/app_css.dart';

class TradingStrategyWidget extends StatelessWidget {
  const TradingStrategyWidget({Key? key, required this.signal})
      : super(key: key);

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
          child: Text(
            "texttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttext",
            style: AppCss.poppinsRegular17,
          ),
        ),
      ),
    );
  }
}
