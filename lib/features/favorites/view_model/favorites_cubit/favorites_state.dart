part of 'favorites_cubit.dart';

@immutable
sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}
final class AddToFavoritesSuccess extends FavoritesState {}
final class AddToFavoritesLoading extends FavoritesState {}
final class AddToFavoritesError extends FavoritesState {}
final class ShowFavoritesSuccess extends FavoritesState {}
final class ShowFavoritesLoading extends FavoritesState {}
final class ShowFavoritesError extends FavoritesState {}
