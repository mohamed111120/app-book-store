part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}
final class LoadingGetCategoriesState extends CategoriesState {}
final class SuccessGetCategoriesState extends CategoriesState {}
final class ErrorGetCategoriesState extends CategoriesState {}

