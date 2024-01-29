part of 'search_bloc.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

class Loading extends SearchState {}

class Products extends SearchState {
  List<ProductModel> all_products_result;
  Products({
    required this.all_products_result,
  });
}

class OneProduct extends SearchState {
  ProductDetailsModel One_product_result;
  OneProduct({
    required this.One_product_result,
  });
}

class SuccessSearch extends SearchState {
  List<ProductModel> search_result;
  SuccessSearch({
    required this.search_result,
  });
}

class NotFound extends SearchState {}

class Error extends SearchState {}

class No_Connection extends SearchState {}
