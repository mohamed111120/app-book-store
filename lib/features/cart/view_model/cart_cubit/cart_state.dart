part of 'cart_cubit.dart';

@immutable
sealed class CartState {}
// Show Cart
final class CartInitial extends CartState {}
final class ShowCartLoadingState extends CartState {}
final class ShowCartSuccessState extends CartState {}
final class ShowCartFailedState extends CartState {}
// Add To Cart
final class AddToCartLoadingState extends CartState {}
final class AddToCartSuccessState extends CartState {}
final class AddToCartFailedState extends CartState {}
// UpdateCart
final class UpdateCartLoadingState extends CartState {}
final class UpdateCartSuccessState extends CartState {}
final class UpdateCartFailedState extends CartState {}
