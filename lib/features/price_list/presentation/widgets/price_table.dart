import 'package:flutter/material.dart';
import 'package:genotek/core/constants/app_text_styles.dart';
import 'package:genotek/core/constants/sizes.dart';
import 'package:genotek/core/constants/strings.dart';
import 'package:genotek/features/price_list/domain/entities/price.dart';

class PriceTable extends StatelessWidget {
  final List<Price> prices;

  const PriceTable({super.key, required this.prices});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth;

        return DataTable(
          columnSpacing: Sizes.tableColumnSpacing,
          horizontalMargin: Sizes.tableHorizontalMargin,
          dataRowMinHeight: Sizes.tableRowMinHeight,
          dataRowMaxHeight: Sizes.tableRowMaxHeight,
          columns: [
            DataColumn(
              label: Expanded(
                flex: Sizes.nameColumnFlex,
                child: Text(Strings.columnName,
                    style: TextStyles.tableHeader,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            DataColumn(
              label: Expanded(
                flex: Sizes.defaultColumnFlex,
                child: Text(Strings.columnPrice,
                    style: TextStyles.tableHeader,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            DataColumn(
              label: Expanded(
                flex: Sizes.defaultColumnFlex,
                child: Text(Strings.columnStartPrice,
                    style: TextStyles.tableHeader,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            DataColumn(
              label: Expanded(
                flex: Sizes.defaultColumnFlex,
                child: Text(Strings.columnStatus,
                    style: TextStyles.tableHeader,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
          rows:
              prices.map((price) => _buildRow(price, availableWidth)).toList(),
        );
      },
    );
  }

  DataRow _buildRow(Price price, double availableWidth) {
    return DataRow(
      cells: [
        DataCell(
          Container(
            constraints: BoxConstraints(
                maxWidth: availableWidth * Sizes.nameColumnWidthFactor),
            child: Text(
              price.name,
              overflow: TextOverflow.ellipsis,
              maxLines: Sizes.tableMaxLines,
              style: TextStyles.tableCell,
            ),
          ),
        ),
        DataCell(
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              Strings.priceFormat.replaceAll('%d', price.price.toString()),
              style: TextStyles.tableCell,
            ),
          ),
        ),
        DataCell(
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              Strings.priceFormat.replaceAll('%d', price.startPrice.toString()),
              style: TextStyles.tableCell,
            ),
          ),
        ),
        DataCell(
          Container(
            alignment: Alignment.center,
            child: Text(
              price.status.name,
              style: TextStyles.tableCell,
            ),
          ),
        ),
      ],
    );
  }
}
