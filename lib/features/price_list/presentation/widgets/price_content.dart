import 'package:flutter/material.dart';
import 'package:genotek/core/constants/app_colors.dart';
import 'package:genotek/core/constants/app_text_styles.dart';
import 'package:genotek/core/constants/sizes.dart';
import 'package:genotek/core/constants/strings.dart';
import 'package:genotek/features/price_list/presentation/bloc/price_state.dart';
import 'package:genotek/features/price_list/presentation/widgets/price_table.dart';

class PriceContent extends StatelessWidget {
  final PriceState state;

  const PriceContent({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return state.when(
      initial: () => Center(child: Text(Strings.loading)),
      loading: () => const Center(child: CircularProgressIndicator()),
      loaded: (prices) => prices.isEmpty
          ? Center(child: Text(Strings.empty))
          : PriceTable(prices: prices),
      error: (_) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline,
                color: AppColors.error, size: Sizes.errorIconSize),
            SizedBox(height: Sizes.errorSpacing),
            Text(
              Strings.error,
              style: TextStyles.error,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
