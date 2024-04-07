part of 'custon_navigation_bar_cubit.dart';

@immutable
sealed class CustomNavigationBarState {}

final class CustomNavigationBarInitial extends CustomNavigationBarState {}
final class ChangeScreenState extends CustomNavigationBarState {}
