part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class ShowProfileSuccessState extends ProfileState {}
final class ShowProfileLoadingState extends ProfileState {}
final class ShowProfileErrorState extends ProfileState {}

final class UpdateProfileSuccessState extends ProfileState {}
final class UpdateProfileLoadingState extends ProfileState {}
final class UpdateProfileErrorState extends ProfileState {}

final class LogoutProfileSuccessState extends ProfileState {}
final class LogoutProfileLoadingState extends ProfileState {}
final class LogoutProfileErrorState extends ProfileState {}

final class ChangeEnableEditingState extends ProfileState {}
