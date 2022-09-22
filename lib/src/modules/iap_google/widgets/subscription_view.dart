import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../config/theme.dart';
import '../iap_google_notifier.dart';
import 'product_list_view.dart';

const String packageName = "com.ushafarhad.create_qr";
const String urlManageSubscription =
    "https://play.google.com/store/account/subscriptions?package=$packageName";

class SubscriptionView extends ConsumerWidget {
  const SubscriptionView(
    this.subscriptionProducts, {
    Key? key,
  }) : super(key: key);

  final List<ProductDetails> subscriptionProducts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Subscription to Add Unlimited ...",
          style: PrimaryFont.semiBold(fontSize: 16, color: kTertiaryColor),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "Choose plan:",
          style: PrimaryFont.medium(
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        ProductListView(subscriptionProducts),
        const SizedBox(
          height: 12,
        ),
        const _SubscriptionNote(),
        const SizedBox(
          height: 12,
        ),
        ElevatedButton(
          onPressed: () async {
            ref.read(iapGoogleProvider.notifier).restorePurchases();
          },
          child: const Text("Restore Purchase"),
        ),
      ],
    );
  }
}

class _SubscriptionNote extends ConsumerWidget {
  const _SubscriptionNote({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RichText(
          text: TextSpan(
            text: 'Note: ',
            style: PrimaryFont.medium(color: Colors.red),
            children: <TextSpan>[
              TextSpan(
                text:
                    'Your subscription will auto-renew until you cancel your subscription before the end of the then-current subscription period.',
                style: PrimaryFont.regular().copyWith(
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        RichText(
          text: TextSpan(
            text: 'You can manage or cancel purchased subscriptions here:  ',
            style: PrimaryFont.regular().copyWith(
              height: 1.5,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'Cancel Subscription',
                style: PrimaryFont.medium(color: kTertiaryColor),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    final Uri url = Uri.parse(urlManageSubscription);
                    if (!await launchUrl(url)) {
                      throw 'Could not launch $url';
                    }
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
