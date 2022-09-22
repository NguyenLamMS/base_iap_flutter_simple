// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'iap_google_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IapGoogleState {
  bool get isAvailable => throw _privateConstructorUsedError;
  bool get isSubscription => throw _privateConstructorUsedError;
  int get consumableValue => throw _privateConstructorUsedError;
  AsyncValue<List<ProductDetails>> get consumableProducts =>
      throw _privateConstructorUsedError;
  AsyncValue<List<ProductDetails>> get subscriptionProducts =>
      throw _privateConstructorUsedError;
  BuyStatus get buyStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IapGoogleStateCopyWith<IapGoogleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IapGoogleStateCopyWith<$Res> {
  factory $IapGoogleStateCopyWith(
          IapGoogleState value, $Res Function(IapGoogleState) then) =
      _$IapGoogleStateCopyWithImpl<$Res>;
  $Res call(
      {bool isAvailable,
      bool isSubscription,
      int consumableValue,
      AsyncValue<List<ProductDetails>> consumableProducts,
      AsyncValue<List<ProductDetails>> subscriptionProducts,
      BuyStatus buyStatus});
}

/// @nodoc
class _$IapGoogleStateCopyWithImpl<$Res>
    implements $IapGoogleStateCopyWith<$Res> {
  _$IapGoogleStateCopyWithImpl(this._value, this._then);

  final IapGoogleState _value;
  // ignore: unused_field
  final $Res Function(IapGoogleState) _then;

  @override
  $Res call({
    Object? isAvailable = freezed,
    Object? isSubscription = freezed,
    Object? consumableValue = freezed,
    Object? consumableProducts = freezed,
    Object? subscriptionProducts = freezed,
    Object? buyStatus = freezed,
  }) {
    return _then(_value.copyWith(
      isAvailable: isAvailable == freezed
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubscription: isSubscription == freezed
          ? _value.isSubscription
          : isSubscription // ignore: cast_nullable_to_non_nullable
              as bool,
      consumableValue: consumableValue == freezed
          ? _value.consumableValue
          : consumableValue // ignore: cast_nullable_to_non_nullable
              as int,
      consumableProducts: consumableProducts == freezed
          ? _value.consumableProducts
          : consumableProducts // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ProductDetails>>,
      subscriptionProducts: subscriptionProducts == freezed
          ? _value.subscriptionProducts
          : subscriptionProducts // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ProductDetails>>,
      buyStatus: buyStatus == freezed
          ? _value.buyStatus
          : buyStatus // ignore: cast_nullable_to_non_nullable
              as BuyStatus,
    ));
  }
}

/// @nodoc
abstract class _$$_IapGoogleStateCopyWith<$Res>
    implements $IapGoogleStateCopyWith<$Res> {
  factory _$$_IapGoogleStateCopyWith(
          _$_IapGoogleState value, $Res Function(_$_IapGoogleState) then) =
      __$$_IapGoogleStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isAvailable,
      bool isSubscription,
      int consumableValue,
      AsyncValue<List<ProductDetails>> consumableProducts,
      AsyncValue<List<ProductDetails>> subscriptionProducts,
      BuyStatus buyStatus});
}

/// @nodoc
class __$$_IapGoogleStateCopyWithImpl<$Res>
    extends _$IapGoogleStateCopyWithImpl<$Res>
    implements _$$_IapGoogleStateCopyWith<$Res> {
  __$$_IapGoogleStateCopyWithImpl(
      _$_IapGoogleState _value, $Res Function(_$_IapGoogleState) _then)
      : super(_value, (v) => _then(v as _$_IapGoogleState));

  @override
  _$_IapGoogleState get _value => super._value as _$_IapGoogleState;

  @override
  $Res call({
    Object? isAvailable = freezed,
    Object? isSubscription = freezed,
    Object? consumableValue = freezed,
    Object? consumableProducts = freezed,
    Object? subscriptionProducts = freezed,
    Object? buyStatus = freezed,
  }) {
    return _then(_$_IapGoogleState(
      isAvailable: isAvailable == freezed
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubscription: isSubscription == freezed
          ? _value.isSubscription
          : isSubscription // ignore: cast_nullable_to_non_nullable
              as bool,
      consumableValue: consumableValue == freezed
          ? _value.consumableValue
          : consumableValue // ignore: cast_nullable_to_non_nullable
              as int,
      consumableProducts: consumableProducts == freezed
          ? _value.consumableProducts
          : consumableProducts // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ProductDetails>>,
      subscriptionProducts: subscriptionProducts == freezed
          ? _value.subscriptionProducts
          : subscriptionProducts // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ProductDetails>>,
      buyStatus: buyStatus == freezed
          ? _value.buyStatus
          : buyStatus // ignore: cast_nullable_to_non_nullable
              as BuyStatus,
    ));
  }
}

/// @nodoc

class _$_IapGoogleState
    with DiagnosticableTreeMixin
    implements _IapGoogleState {
  const _$_IapGoogleState(
      {required this.isAvailable,
      required this.isSubscription,
      required this.consumableValue,
      required this.consumableProducts,
      required this.subscriptionProducts,
      required this.buyStatus});

  @override
  final bool isAvailable;
  @override
  final bool isSubscription;
  @override
  final int consumableValue;
  @override
  final AsyncValue<List<ProductDetails>> consumableProducts;
  @override
  final AsyncValue<List<ProductDetails>> subscriptionProducts;
  @override
  final BuyStatus buyStatus;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IapGoogleState(isAvailable: $isAvailable, isSubscription: $isSubscription, consumableValue: $consumableValue, consumableProducts: $consumableProducts, subscriptionProducts: $subscriptionProducts, buyStatus: $buyStatus)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IapGoogleState'))
      ..add(DiagnosticsProperty('isAvailable', isAvailable))
      ..add(DiagnosticsProperty('isSubscription', isSubscription))
      ..add(DiagnosticsProperty('consumableValue', consumableValue))
      ..add(DiagnosticsProperty('consumableProducts', consumableProducts))
      ..add(DiagnosticsProperty('subscriptionProducts', subscriptionProducts))
      ..add(DiagnosticsProperty('buyStatus', buyStatus));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IapGoogleState &&
            const DeepCollectionEquality()
                .equals(other.isAvailable, isAvailable) &&
            const DeepCollectionEquality()
                .equals(other.isSubscription, isSubscription) &&
            const DeepCollectionEquality()
                .equals(other.consumableValue, consumableValue) &&
            const DeepCollectionEquality()
                .equals(other.consumableProducts, consumableProducts) &&
            const DeepCollectionEquality()
                .equals(other.subscriptionProducts, subscriptionProducts) &&
            const DeepCollectionEquality().equals(other.buyStatus, buyStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isAvailable),
      const DeepCollectionEquality().hash(isSubscription),
      const DeepCollectionEquality().hash(consumableValue),
      const DeepCollectionEquality().hash(consumableProducts),
      const DeepCollectionEquality().hash(subscriptionProducts),
      const DeepCollectionEquality().hash(buyStatus));

  @JsonKey(ignore: true)
  @override
  _$$_IapGoogleStateCopyWith<_$_IapGoogleState> get copyWith =>
      __$$_IapGoogleStateCopyWithImpl<_$_IapGoogleState>(this, _$identity);
}

abstract class _IapGoogleState implements IapGoogleState {
  const factory _IapGoogleState(
      {required final bool isAvailable,
      required final bool isSubscription,
      required final int consumableValue,
      required final AsyncValue<List<ProductDetails>> consumableProducts,
      required final AsyncValue<List<ProductDetails>> subscriptionProducts,
      required final BuyStatus buyStatus}) = _$_IapGoogleState;

  @override
  bool get isAvailable;
  @override
  bool get isSubscription;
  @override
  int get consumableValue;
  @override
  AsyncValue<List<ProductDetails>> get consumableProducts;
  @override
  AsyncValue<List<ProductDetails>> get subscriptionProducts;
  @override
  BuyStatus get buyStatus;
  @override
  @JsonKey(ignore: true)
  _$$_IapGoogleStateCopyWith<_$_IapGoogleState> get copyWith =>
      throw _privateConstructorUsedError;
}
