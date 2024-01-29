// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:saerch_task2/bloc/search_bloc.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc()..add(ShowProductDetails(id: id)),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(),
            body: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is OneProduct) {
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 300,
                          height: 300,
                          child: Image.network(
                            state.One_product_result.thumbnail,
                            errorBuilder: (context, error, stackTrace) {
                              return FlutterLogo();
                            },
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 100,
                          child: Text(state.One_product_result.description,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 102, 102, 104),
                              )),
                        ),
                        Container(
                          height: 50,
                          child: Text(
                              'category : ${state.One_product_result.category}',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 102, 102, 104),
                              )),
                        ),
                        Container(
                          height: 30,
                          child:
                              Text('Brand : ${state.One_product_result.brand}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 102, 102, 104),
                                  )),
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: 50,
                          child: Text(
                              "\$${state.One_product_result.price.toString()}",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 126, 114, 161),
                              )),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          );
        },
      ),
    );
  }
}
