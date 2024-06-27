import 'package:coinspace/config.dart';

import '../../../common/theme/app_css.dart';

class ProfitLossGraphWidget extends StatelessWidget {
  const ProfitLossGraphWidget({Key? key, required this.signal})
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "PROFIT/LOSS GRAPH",
                style: AppCss.poppinsRegular14
                    .copyWith(color: const Color(0x3C3C4399)),
              ),
              Expanded(child: Container()),
              Text(
                "MONTHLY GRAPH",
                style: AppCss.poppinsRegular14
                    .copyWith(color: const Color(0x3C3C4399)),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
