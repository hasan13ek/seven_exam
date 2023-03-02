import 'package:flutter/material.dart';
import 'package:seven_exam/utils/constants.dart';
import 'package:seven_exam/utils/lottie/app_lottie.dart';
import 'package:lottie/lottie.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    onNextPage();
  }

  onNextPage() {
    Future.delayed(const Duration(seconds: 3), () async {
      /// bu yerga qaysi screen o'tilish yoziladi???
      Navigator.pushNamedAndRemoveUntil(context, tabBox, (route) => false);
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: LottieBuilder.asset(
            AppLottie.creditCard,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),
    );
  }
}
