import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit/core/dummy_data.dart';
import 'package:reddit/core/services/services_locator.dart';
import 'package:reddit/presentation/controller/bloc/post_bloc.dart';
import 'package:reddit/presentation/screens/settings_Screen.dart';
import 'core/error/certificate_verify.dart';
import 'presentation/screens/main_screen.dart';

void main() async {
  ServicesLocator().init();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  sl<PostBloc>()..add(UpdatePostEvent(post: DummyData.post)))
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const MainScreen()));
  }
}
