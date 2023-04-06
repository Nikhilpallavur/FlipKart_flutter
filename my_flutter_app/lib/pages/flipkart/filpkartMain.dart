import 'package:flutter/src/widgets/framework.dart';
import 'package:my_flutter_app/utils/flipkart/variables/tabVariables.dart';
import 'landingPage/main.dart';

class FlipkartClone extends StatefulWidget {
  const FlipkartClone({super.key});

  @override
  State<FlipkartClone> createState() => _FlipkartCloneState();
}

class _FlipkartCloneState extends State<FlipkartClone> {
  @override
  Widget build(BuildContext context) {
    return MyHomePageMain(
      selectedButtonProps: FLIPKART,
      selectedTabProps: BOTTOM_TABS.Home.name,
    );
  }
}
