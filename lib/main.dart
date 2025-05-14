import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/core/di/injection_container.dart' as di;
import 'package:grocery_app/core/routes/app_router.dart';
import 'package:grocery_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:grocery_app/features/notifications/presentation/bloc/notifications_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (_) => di.sl<HomeBloc>()..add(LoadHomeDataEvent()),
        ),
        BlocProvider<NotificationsBloc>(
          create: (_) => di.sl<NotificationsBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Grocery App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF4CAF50),
            primary: const Color(0xFF4CAF50),
          ),
          useMaterial3: true,
          fontFamily: 'Quicksand',
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRouter.homeRoute,
      ),
    );
  }
}
