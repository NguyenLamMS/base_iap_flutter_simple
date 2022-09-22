import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../../../../generated/assets.dart';
import '../../../config/theme.dart';
import '../iap_google_notifier.dart';
import 'product_list_view.dart';

class ConsumableView extends ConsumerWidget {
  const ConsumableView(
    this.consumableProducts, {
    Key? key,
  }) : super(key: key);

  final List<ProductDetails> consumableProducts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _ConsumableValue(),
        const SizedBox(
          height: 12,
        ),
        Text(
          "Get more Diamond to Add more ...",
          style: PrimaryFont.semiBold(
            fontSize: 16,
            color: kTertiaryColor,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "Choose package:",
          style: PrimaryFont.medium(
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        ProductListView(consumableProducts),
      ],
    );
  }
}

class _ConsumableValue extends ConsumerWidget {
  const _ConsumableValue({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int value = ref.watch(iapGoogleProvider.select((value) => value.consumableValue));
    return Card(
      elevation: 8,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            Image.asset(
              Assets.imagesDiamond,
              width: 24,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              "My Diamond",
              style: PrimaryFont.medium(fontSize: 16),
            ),
            const Spacer(),
            Text(
              value.toString(),
              style: PrimaryFont.semiBold(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
