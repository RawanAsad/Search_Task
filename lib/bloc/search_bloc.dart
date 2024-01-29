import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:saerch_task2/model/All_products.dart';
import 'package:saerch_task2/services/getProducts.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<ShowAllProducts>((event, emit) async {
      emit(Loading());
      try {
        dynamic temp;
        late List<ProductModel> product;
        temp = await GetProducts();

        product = List.generate(temp['products'].length,
            (index) => ProductModel.fromMap(temp['products'][index]));

        print(product);
        emit(Products(all_products_result: product));
      } catch (e) {
        emit(Error());
      }
    });

    on<Search>((event, emit) async {
      emit(Loading());
      dynamic temp;
      late List<ProductModel> products;
      try {
        temp = await GetProducts();

        products = List.generate(temp['products'].length,
            (index) => ProductModel.fromMap(temp['products'][index]));

        emit(Products(all_products_result: products));
      } catch (e) {
        emit(Error());
      }

      List<ProductModel> search_result = [];

      for (var element in products) {
        if (element.title.contains(event.search_text)) {
          search_result.add(element);
        }
      }

      if (search_result.isEmpty) {
        emit(NotFound());
      } else {
        emit(SuccessSearch(search_result: search_result));
      }
    });

    on<ShowProductDetails>((event, emit) async {
      emit(Loading());

      ProductDetailsModel temp = await GetOneProduct(event.id);

      emit(OneProduct(One_product_result: temp));
    });
  }
}
