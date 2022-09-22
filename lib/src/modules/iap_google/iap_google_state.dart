import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

part 'iap_google_state.freezed.dart';

enum BuyStatus {
  idle,
  waiting,
}

@freezed
class IapGoogleState with _$IapGoogleState {
  const factory IapGoogleState({
    required bool isAvailable,
    required bool isSubscription,
    required int consumableValue,
    required AsyncValue<List<ProductDetails>> consumableProducts,
    required AsyncValue<List<ProductDetails>> subscriptionProducts,
    required BuyStatus buyStatus,
  }) = _IapGoogleState;
}
