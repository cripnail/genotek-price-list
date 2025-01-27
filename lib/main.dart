import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genotek/core/constants/app_colors.dart';
import 'package:genotek/core/constants/strings.dart';
import 'package:genotek/core/di/injection_container.dart';
import 'package:genotek/core/services/logger.dart';
import 'package:genotek/features/price_list/presentation/bloc/price_bloc.dart';
import 'package:genotek/features/price_list/presentation/bloc/price_event.dart';
import 'package:genotek/features/price_list/presentation/pages/price_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Logger.log(Strings.logInit);
  await init();
  Logger.log(Strings.logRun);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appTitle,
      theme: ThemeData(
        primarySwatch: AppColors.primary,
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
      ),
      home: BlocProvider(
        create: (_) => sl<PriceBloc>()..add(const PriceEvent.load()),
        child: const Scaffold(body: SafeArea(child: PriceView())),
      ),
    );
  }
}
