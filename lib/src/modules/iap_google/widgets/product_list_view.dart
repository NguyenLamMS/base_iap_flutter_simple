import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';

import '../../../config/theme.dart';
import '../iap_google_notifier.dart';

class ProductListView extends ConsumerWidget {
  const ProductListView(
    this.products, {
    Key? key,
  }) : super(key: key);
  final List<ProductDetails> products;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return _ProductListItem(products[index]);
      },
      itemCount: products.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 16,
        );
      },
    );
  }
}

class _ProductListItem extends ConsumerWidget {
  const _ProductListItem(
    this.product, {
    Key? key,
  }) : super(key: key);

  final ProductDetails product;

  String formatTitle(String title) {
    int index = title.indexOf("(");
    if (index < 0) {
      return title;
    }
    return title.substring(0, index).trim();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SkuDetailsWrapper skuDetails = (product as GooglePlayProductDetails).skuDetails;
    String freeTrialPeriod = "";
    if (skuDetails.freeTrialPeriod.isNotEmpty) {
      freeTrialPeriod =
          "${ISO8601Parser.toDuration(skuDetails.freeTrialPeriod).inDays} days free trial";
    }
    return InkWell(
      borderRadius: BorderRadius.circular(4),
      onTap: () {
        ref.read(iapGoogleProvider.notifier).buyProduct(product);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: kTertiaryColor,
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    formatTitle(skuDetails.title),
                    style: PrimaryFont.medium(fontSize: 15, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    skuDetails.description,
                    style: PrimaryFont.regular(color: Colors.white),
                  ),
                  if (freeTrialPeriod.isNotEmpty) ...{
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        freeTrialPeriod,
                        style: PrimaryFont.regular(),
                      ),
                    ),
                  },
                ],
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              skuDetails.price,
              style: PrimaryFont.semiBold(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ISO8601Parser {
  static Duration toDuration(String isoString) {
    if (!RegExp(
            r"^(-|\+)?P(?:([-+]?[0-9,.]*)Y)?(?:([-+]?[0-9,.]*)M)?(?:([-+]?[0-9,.]*)W)?(?:([-+]?[0-9,.]*)D)?(?:T(?:([-+]?[0-9,.]*)H)?(?:([-+]?[0-9,.]*)M)?(?:([-+]?[0-9,.]*)S)?)?$")
        .hasMatch(isoString)) {
      throw ArgumentError("String does not follow correct format");
    }

    final weeks = _parseTime(isoString, "W");
    final days = _parseTime(isoString, "D");
    final hours = _parseTime(isoString, "H");
    final minutes = _parseTime(isoString, "M");
    final seconds = _parseTime(isoString, "S");

    return Duration(
      days: days + (weeks * 7),
      hours: hours,
      minutes: minutes,
      seconds: seconds,
    );
  }

  /// Private helper method for extracting a time value from the ISO8601 string.
  static int _parseTime(String duration, String timeUnit) {
    final timeMatch = RegExp(r"\d+" + timeUnit).firstMatch(duration);

    if (timeMatch == null) {
      return 0;
    }
    final timeString = timeMatch.group(0);
    return int.parse(timeString?.substring(0, timeString.length - 1) ?? "0");
  }
}
