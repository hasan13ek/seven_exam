import 'dart:developer';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seven_exam/blocs/card_bloc/card_bloc.dart';
import 'package:seven_exam/blocs/card_bloc/card_event.dart';
import 'package:seven_exam/cubits/get_card/get_card_cubit.dart';
import 'package:seven_exam/cubits/tab/tab_cubit.dart';
import 'package:seven_exam/data/repositories/card_repository.dart';
import 'package:seven_exam/route.dart';
import 'package:seven_exam/utils/constants.dart';
import 'package:seven_exam/utils/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) =>
              CardRepository(firebaseFirestore: FirebaseFirestore.instance),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BottomNavCubit(),
          ),
          BlocProvider(
            create: (context) => CardBloc(
              cardRepository: context.read<CardRepository>(),
            ),
          ),
          BlocProvider(create: (context)=>GetCardsCubit(context.read<CardRepository>(),)..fetchAllAppointments(),)
        ],
        child: MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => AdaptiveTheme(
        light: AppTheme.lightTheme,
        dark: AppTheme.darkTheme,
        initial: AdaptiveThemeMode.system,
        builder: (light, dark) => MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: 'Seven Exam',
          theme: light,
          darkTheme: dark,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: MyRouter.generateRoute,
          initialRoute: splashPage,
        ),
      ),
    );
  }
}
