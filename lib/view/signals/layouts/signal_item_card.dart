import 'package:coinspace/config.dart';

import '../../../common/theme/app_css.dart';

class SignalItemView extends StatelessWidget {
  const SignalItemView({Key? key, required this.signal}) : super(key: key);

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Image.asset(
                          signal.userIamge,
                          height: 42.0,
                          width: 42.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const HSpace(15.0),
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              signal.signalName,
                              style: AppCss.poppinsBold16
                                  .textColor(Theme.of(context).primaryColor),
                            ),
                            const VSpace(10.0),
                            Image.asset(
                              signal.country,
                              height: 15.0,
                              width: 26.0,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: CustomPaint(painter: LinePainter()),
                      ),
                    ],
                  ),
                  Text(
                    '${signal.growth}%',
                    style:
                        AppCss.poppinsBold16.textColor(const Color(0xff34C759)),
                  ),
                ],
              ),
              const VSpace(25.0),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Text(
                          signal.firstTradeDate,
                          style: AppCss.poppinsBold16,
                        ),
                        const VSpace(10.0),
                        Text(
                          "first trade\n date",
                          textAlign: TextAlign.center,
                          style: AppCss.poppinsRegular12,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Text(
                          signal.avgProfit,
                          style: AppCss.poppinsBold16,
                        ),
                        const VSpace(10.0),
                        Text(
                          "average monthly\n profit",
                          textAlign: TextAlign.center,
                          style: AppCss.poppinsRegular11,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              imageAssets.userGroup,
                              height: 40.0,
                              width: 70.0,
                            ),
                            Positioned(
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Center(
                                  child: Text(
                                    signal.subscribers.toString(),
                                    style: AppCss.poppinsRegular11,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Text(
                          signal.balance.toString(),
                          style: AppCss.poppinsBold20,
                        ),
                        const VSpace(10.0),
                        Text(
                          "USD",
                          textAlign: TextAlign.center,
                          style: AppCss.poppinsRegular12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(size.width, -30);
    final p2 = Offset(20, size.height + 20);
    // final Shader gradientShader = LinearGradient(
    //   colors: [Colors.green, Colors.white],
    //   begin: Alignment.topCenter,
    //   end: Alignment.bottomCenter,
    // ).createShader(Rect.fromPoints(p1, p2));

    final paint = Paint()
      ..color = const Color(0xff00C7BE)
      ..strokeWidth = 1.5;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) => false;
}
