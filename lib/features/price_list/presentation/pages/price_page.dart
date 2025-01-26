import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genotek/core/constants/strings.dart';
import 'package:genotek/core/di/injection_container.dart';
import 'package:genotek/core/services/logger.dart';
import 'package:genotek/features/price_list/presentation/bloc/price_bloc.dart';
import 'package:genotek/features/price_list/presentation/bloc/price_event.dart';
import 'package:genotek/features/price_list/presentation/bloc/price_state.dart';
import 'package:genotek/features/price_list/presentation/pages/price_view.dart';

class PricePage extends StatelessWidget {
  const PricePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          final bloc = sl<PriceBloc>();
          Logger.log('${Strings.debugCreatingBloc}$bloc');
          bloc.add(const PriceEvent.load());
          return bloc;
        },
        child: BlocListener<PriceBloc, PriceState>(
          listener: (context, state) {
            Logger.log('${Strings.debugStateChanged}$state');
          },
          child: const PriceView(),
        ),
      ),
    );
  }
}
