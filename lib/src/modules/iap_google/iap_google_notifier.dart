import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../../data/local/shared_prefs.dart';
import 'iap_google_state.dart';

final iapGoogleProvider = StateNotifierProvider<IapGoogleNotifier, IapGoogleState>((ref) {
  return IapGoogleNotifier(ref);
});


class IapGoogleNotifier extends StateNotifier<IapGoogleState> {
  IapGoogleNotifier(this.ref)
      : super(
          const IapGoogleState(
            isAvailable: false,
            isSubscription: false,
            consumableValue: 0,
            consumableProducts: AsyncValue.loading(),
            subscriptionProducts: AsyncValue.loading(),
            buyStatus: BuyStatus.idle,
          ),
        ) {
    _listenPurchased();
  }
  final Ref ref;

  bool get isSubscription => state.isSubscription;

  int get consumableValue => state.consumableValue;

  void _listenPurchased() {
    final Stream<List<PurchaseDetails>> purchaseStream = InAppPurchase.instance.purchaseStream;
    purchaseStream.listen((purchaseDetailsList) async {
      for (int i = 0; i < purchaseDetailsList.length; i++) {
        final PurchaseDetails purchase = purchaseDetailsList[i];
        if (purchase.status == PurchaseStatus.purchased ||
            purchase.status == PurchaseStatus.restored) {
          deliverProduct(purchase.productID);
        }
        if (purchase.pendingCompletePurchase && purchase.status != PurchaseStatus.pending) {
          await InAppPurchase.instance.completePurchase(purchase);
        }
      }
    });
  }

  Future<void> init() async {
    restorePurchases();
    loadConsumableValue();
  }

  Future<void> deliverProduct(String productId) async {
    if (subscriptionProductIds.contains(productId)) {
      state = state.copyWith(isSubscription: true);
      return;
    }
    for (int i = 0; i < consumableProductIds.length; i++) {
      if (consumableProductIds[i] == productId) {
        int newConsumableValue = (i + 1) * 100;
        int oldConsumableValue = await SharedPrefs.getConsumableValue();
        state = state.copyWith(consumableValue: oldConsumableValue + newConsumableValue);
        await SharedPrefs.setConsumableValue(oldConsumableValue + newConsumableValue);
        ref.refresh(diamondProvider);
        break;
      }
    }
  }

  Future<void> loadProducts() async {
    bool isAvailable = await InAppPurchase.instance.isAvailable();
    state = state.copyWith(isAvailable: isAvailable);
    if (!isAvailable) {
      return;
    }
    try {
      final ProductDetailsResponse response = await InAppPurchase.instance
          .queryProductDetails(<String>{...consumableProductIds, ...subscriptionProductIds});
      List<ProductDetails> products = response.productDetails;
      state = state.copyWith(
        consumableProducts: AsyncValue.data(
          products.where((element) => consumableProductIds.contains(element.id)).toList(),
        ),
        subscriptionProducts: AsyncValue.data(
          products.where((element) => subscriptionProductIds.contains(element.id)).toList(),
        ),
      );
    } catch (e) {
      state = state.copyWith(
        consumableProducts: AsyncValue.error(e),
        subscriptionProducts: AsyncValue.error(e),
      );
    }
  }

  Future<void> loadConsumableValue() async {
    state = state.copyWith(consumableValue: await SharedPrefs.getConsumableValue());
  }

  Future<void> decrementConsumableValue(int value) async {
    state = state.copyWith(consumableValue: state.consumableValue - value);
    await SharedPrefs.setConsumableValue(state.consumableValue - value);
  }

  Future<void> restorePurchases() async {
    await InAppPurchase.instance.restorePurchases();
  }

  Future<void> buyProduct(ProductDetails product) async {
    if (state.buyStatus == BuyStatus.waiting) {
      return;
    }
    state = state.copyWith(buyStatus: BuyStatus.waiting);
    final PurchaseParam purchaseParam = PurchaseParam(productDetails: product);
    if (consumableProductIds.contains(product.id)) {
      await InAppPurchase.instance.buyConsumable(purchaseParam: purchaseParam);
    } else {
      await InAppPurchase.instance.buyNonConsumable(purchaseParam: purchaseParam);
    }
    state = state.copyWith(buyStatus: BuyStatus.idle);
  }
}

List<String> consumableProductIds = [
  "consum1",
  "consum2",
  "consum3",
  "consum4",
  "consum5",
  "consum6",
  "consum7",
  "consum8",
  "consum9",
  "consum10",
 // "android.test.purchased",
];

List<String> subscriptionProductIds = [
  "sub1",
  "sub2",
  "sub3",
  "sub4",
  "sub5",
  "sub6",
  "sub7",
  "sub8",
  "sub9",
  "sub10",
 // "android.test.purchased",
];
