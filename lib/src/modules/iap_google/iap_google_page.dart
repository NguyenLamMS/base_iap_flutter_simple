import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import '../../../generated/assets.dart';
import '../../config/theme.dart';
import 'iap_google_notifier.dart';
import 'widgets/consumable_view.dart';
import 'widgets/subscription_view.dart';

class IapGooglePage extends ConsumerStatefulWidget {
  const IapGooglePage({
    Key? key,
  }) : super(key: key);

  static const String routeName = "/iap_google";

  @override
  ConsumerState createState() => _IapGooglePageState();
}

class _IapGooglePageState extends ConsumerState<IapGooglePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(iapGoogleProvider.notifier).loadProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buy More Diamond"),
        leading: CloseButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          height: size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage(Assets.imagesBackground),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ref.watch(iapGoogleProvider.select((value) => value.consumableProducts)).when(
                    data: (List<ProductDetails> data) {
                  if (data.isEmpty) {
                    return const SizedBox();
                  }
                  return ConsumableView(data);
                }, loading: () {
                  return Container(
                    height: 128,
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  );
                }, error: (Object error, StackTrace? stackTrace) {
                  return Container(
                    height: 128,
                    alignment: Alignment.center,
                    child: Text(
                      error.toString(),
                      style: PrimaryFont.medium(fontSize: 16),
                    ),
                  );
                }),
                ref.watch(iapGoogleProvider.select((value) => value.subscriptionProducts)).when(
                    data: (List<ProductDetails> data) {
                  if (data.isEmpty) {
                    return const SizedBox();
                  }
                  return Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: SubscriptionView(data),
                  );
                }, loading: () {
                  return Container(
                    height: 128,
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  );
                }, error: (Object error, StackTrace? stackTrace) {
                  return Container(
                    height: 128,
                    alignment: Alignment.center,
                    child: Text(
                      error.toString(),
                      style: PrimaryFont.medium(fontSize: 16),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
