part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

class ShowAllProducts extends SearchEvent {}

class ShowProductDetails extends SearchEvent {
   int id;
  ShowProductDetails({
    required this.id,
  });
}

class Search extends SearchEvent {
  String search_text;
  Search({
    required this.search_text,
  });
}
