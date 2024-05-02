part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
final class ShowCartLoadingState extends CartState {}
final class ShowCartSuccessState extends CartState {}
final class ShowCartFailedState extends CartState {}
