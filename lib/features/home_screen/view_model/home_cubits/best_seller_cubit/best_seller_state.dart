part of 'best_seller_cubit.dart';

@immutable
sealed class BestSellerState {}

final class BestSellerInitial extends BestSellerState {}
final class LoadingGetBestSellerStatus extends BestSellerState {}
final class SuccessGetBestSellerStatus extends BestSellerState {}
final class ErrorGetBestSellerStatus extends BestSellerState {}
