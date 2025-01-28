import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genotek/core/constants/app_text_styles.dart';
import 'package:genotek/core/constants/sizes.dart';
import 'package:genotek/core/constants/strings.dart';
import 'package:genotek/features/price_list/presentation/bloc/price_bloc.dart';
import 'package:genotek/features/price_list/presentation/bloc/price_event.dart';
import 'package:genotek/features/price_list/presentation/bloc/price_state.dart';
import 'package:genotek/features/price_list/presentation/widgets/price_content.dart';

class PriceView extends StatelessWidget {
  const PriceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appTitle),
      ),
      body: BlocBuilder<PriceBloc, PriceState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(Sizes.contentPadding),
            child: Column(
              children: [
                Text(
                  Strings.priceListTitle,
                  style: TextStyles.heading,
                ),
                Expanded(
                  child: PriceContent(state: state),
                ),
                ElevatedButton(
                  onPressed: () =>
                      context.read<PriceBloc>().add(const PriceEvent.load()),
                  child: Text(Strings.refreshButtonText),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
