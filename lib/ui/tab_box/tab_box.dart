import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seven_exam/cubits/tab/tab_cubit.dart';
import 'package:seven_exam/data/notification_service/local_notification_service.dart';
import 'package:seven_exam/ui/tab_box/add_screen/add_screen.dart';
import 'package:seven_exam/ui/tab_box/get_page/get_page.dart';
import 'package:seven_exam/ui/tab_box/payment_screen/payment_screen.dart';
import 'package:seven_exam/utils/color.dart';
import 'package:seven_exam/utils/icons/app_icons.dart';
import 'package:seven_exam/utils/my_utils.dart';


class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}


class _TabBoxState extends State<TabBox> {
  handleFirebaseNotificationMessages() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      if (message.notification != null) {

        ///mana shu yerga local yoziladi
        var id = message.data['id'];

        LocalNotificationService.localNotificationService
            .showNotificationAndFireBase(id: int.parse(id));
      }
    });
  }

  setupInteractedMessage() async {
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      if (initialMessage.data['route'] == 'chat') {
        if(!mounted) return;
        Navigator.push(context, MaterialPageRoute(builder: (_) => const GetAllCardsScreen()));
      }
      if(initialMessage.data['cardNumber']=='1111 2222 3333 4444'){
        MyUtils.getMyToast(message: 'Karta Togri Tasdiqlandi!!!');
      }
    }

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.data['route'] == 'chat') {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const GetAllCardsScreen()));
      }
    });
  }

  List<Widget> screens = [];

  @override
  void initState() {
    handleFirebaseNotificationMessages();
    FirebaseMessaging.onMessageOpenedApp;
    setupInteractedMessage();
    // screens.add(HomeScreen());
    // screens.add(CoursesScreen());
    // screens.add(UserCoursesScreen());
    // screens.add(ProfileScreen());
    screens.add(AddScreen());
    screens.add(GetAllCardsScreen());
    screens.add(PaymentScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, state) {
        var index = context.watch<BottomNavCubit>().activePageIndex;
        return Scaffold(
          body: screens[index],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) =>
                BlocProvider.of<BottomNavCubit>(context).changePageIndex(value),
            items: [
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    const SizedBox(height: 10),
                    Icon(Icons.add,
                        size: 30,
                        color: index == 0
                            ? AppColors.LightBlueish
                            : AppColors.LightishGrey
                    )
                  ],
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppIcons.materialsIcon,
                    color: index == 1
                        ? AppColors.LightBlueish
                        : AppColors.LightishGrey,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppIcons.chatIcon,
                  color: index == 2 ? AppColors.LightBlueish: AppColors.LightishGrey,
                ),
                label: "",
              ),
            ],
          ),
        );
      },
    );
  }
}
