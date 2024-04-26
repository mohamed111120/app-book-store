part of 'new_arrivals_cubit.dart';

@immutable
sealed class NewArrivalsState {}

final class NewArrivalsInitial extends NewArrivalsState {}
final class SuccessGetNewArrivalsState extends NewArrivalsState {}
final class LoadingGetNewArrivalsState extends NewArrivalsState {}
final class ErrorGetNewArrivalsState extends NewArrivalsState {}
