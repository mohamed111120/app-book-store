part of 'slider_cubit.dart';

@immutable
sealed class SliderState {}

final class SliderInitial extends SliderState {}
final class LoadingGetSliderState extends SliderState {}
final class SuccessGetSliderState extends SliderState {}
final class ErrorGetSliderState extends SliderState {}
