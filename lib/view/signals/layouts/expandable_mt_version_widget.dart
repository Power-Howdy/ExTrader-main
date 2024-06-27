import 'package:coinspace/config.dart';

import '../../../common/theme/app_css.dart';

class ExpandableMTVersionWidget extends StatefulWidget {
  const ExpandableMTVersionWidget({super.key});

  @override
  State<ExpandableMTVersionWidget> createState() =>
      _ExpandableMTVersionWidgetState();
}

class _ExpandableMTVersionWidgetState extends State<ExpandableMTVersionWidget> {
  bool isExpandedPanel = false;
  String selectedMTVersion = "MT5";

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      dividerColor: Colors.grey,
      expansionCallback: (int index, bool value) {
        setState(() {
          isExpandedPanel = !isExpandedPanel;
        });
      },
      elevation: 1,
      children: [
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Text(
                selectedMTVersion,
                textAlign: TextAlign.left,
                style: AppCss.poppinsRegular17.copyWith(color: Colors.black),
              ),
            );
          },
          body: Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    selectedMTVersion = "MT5";
                    isExpandedPanel = !isExpandedPanel;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "MT5",
                    textAlign: TextAlign.center,
                    style: AppCss.poppinsRegular17
                        .copyWith(color: const Color(0x3C3C4399)),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectedMTVersion = "MT4";
                    isExpandedPanel = !isExpandedPanel;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "MT4",
                    textAlign: TextAlign.center,
                    style: AppCss.poppinsRegular17
                        .copyWith(color: const Color(0x3C3C4399)),
                  ),
                ),
              ),
            ],
          ),
          isExpanded: isExpandedPanel,
          // canTapOnHeader: true,
          backgroundColor: Colors.white,
        ),
      ],
    );
  }
}
