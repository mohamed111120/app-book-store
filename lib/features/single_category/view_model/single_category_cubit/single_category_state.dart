part of 'single_category_cubit.dart';

@immutable
sealed class SingleCategoryState {}

final class SingleCategoryInitial extends SingleCategoryState {}
final class LoadingGetSingleCategory extends SingleCategoryState {}
final class SuccessGetSingleCategory extends SingleCategoryState {}
final class FailedGetSingleCategory extends SingleCategoryState {}
