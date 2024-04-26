part of 'books_cubit.dart';

@immutable
sealed class BooksState {}

final class BooksInitial extends BooksState {}
final class GetBooksSuccessState extends BooksState {}
final class GetBooksLoadingState extends BooksState {}
final class GetBooksErrorState extends BooksState {}
final class SearchFnLoadingState extends BooksState {}
final class SearchFnSuccessState extends BooksState {}
