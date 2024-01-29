import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saerch_task2/bloc/search_bloc.dart';
import 'package:saerch_task2/config/get_it.dart';
import 'package:saerch_task2/pages/ProductDetails.dart';
import 'package:saerch_task2/pages/searchHistory.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController search_text = TextEditingController();
    return BlocProvider(
      create: (context) => SearchBloc()..add(ShowAllProducts()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 45),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: Color(0xFFF5F6FA),
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset('assets/images/menu.png',
                                height: 25, width: 25),
                          ),
                        ),
                        SizedBox(
                          width: 245,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: Color(0xFFF5F6FA),
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset('assets/images/Bag.png',
                                height: 25, width: 25),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello",
                            style: TextStyle(
                              fontSize: 28,
                              //fontFamily: 'assets/Fonts/Inter-Regular.ttf',
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1D1E20),
                            ),
                          ),
                          Text(
                            "Welcome to Laza.",
                            style: TextStyle(
                              fontSize: 15,
                              //fontFamily: 'assets/Fonts/Inter-Regular.ttf',
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF8F959E),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //search
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 275,
                          decoration: BoxDecoration(
                              color: Color(0xFFF5F6FA),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) {
                                        return SearchHistory();
                                      },
                                    ));
                                  },
                                  child: Image.asset(
                                    'assets/images/Search.png',
                                  ),
                                ),
                                SizedBox(width: 10),
                                //كيف  بدي ظبط قصة إذا دخل كلمات كتير يعني أكتر من سطر
                                Container(
                                  width: 215,
                                  child: TextField(
                                    controller: search_text,
                                    maxLines: 1,
                                    onChanged: (val) {
                                      context.read<SearchBloc>().add(Search(
                                          search_text: search_text.text));
                                      config.get<SharedPreferences>().setString(
                                          'search_history', search_text.text);
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Search...",
                                      hintStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            Color.fromARGB(255, 94, 101, 112),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xFF9775FA),
                          ),
                          child: InkWell(
                              onTap: () {},
                              child: Image.asset('assets/images/Voice.png')),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Choose Brand",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1D1E20),
                          ),
                        ),
                        SizedBox(width: 171),
                        InkWell(
                          child: Text("View All",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF8F959E),
                              )),
                          onTap: () {},
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    SizedBox(
                        height: 50,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 50,
                              width: 115,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color(0xFFF5F6FA),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Color(0xFFFEFEFE),
                                      ),
                                      child: Image.asset(
                                          'assets/images/Adidas.png'),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Adidas",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF1D1E20),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 10),
                          itemCount: 4,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "New Arraival",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1D1E20),
                          ),
                        ),
                        SizedBox(width: 182),
                        InkWell(
                          child: Text("View All",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF8F959E),
                              )),
                          onTap: () {},
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    BlocBuilder<SearchBloc, SearchState>(
                      builder: (context, state) {
                        if (state is No_Connection) {
                          return const Center(
                            child: Text('There is No Internet'),
                          );
                        } else if (state is NotFound) {
                          return const Center(
                            child: Text('There is No Products right now'),
                          );
                        } else if (state is Products) {
                          return Container(
                            width: 375,
                            height: 1000,
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      mainAxisExtent: 180),
                              // state.all_products_result.length,
                              itemCount: state.all_products_result.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) {
                                        return ProductDetails(
                                            id: state
                                                .all_products_result[index].id);
                                      },
                                    ));
                                  },
                                  child: Container(
                                    width: 160,
                                    height: 200,
                                    color: Color(0xFFFEFEFE),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              width: 160,
                                              height: 100,
                                              child: Image.network(
                                                state.all_products_result[index]
                                                    .thumbnail,
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return FlutterLogo();
                                                },
                                              ),
                                            ),
                                            Positioned(
                                              left: 128,
                                              right: 12,
                                              top: 15,
                                              bottom: 168,
                                              child: InkWell(
                                                onTap: () {},
                                                child: Icon(
                                                  Icons
                                                      .favorite_outline_rounded,
                                                  size: 20,
                                                  color: Color.fromRGBO(
                                                      143, 149, 158, 1),
                                                ),
                                              ),
                                            ), //favourite_rounded
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          width: 117,
                                          height: 30,
                                          child: Text(
                                              state.all_products_result[index]
                                                  .title,
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF1D1E20),
                                              )),
                                        ),
                                        Container(
                                          width: 35,
                                          height: 15,
                                          child: Text(
                                              "\$${state.all_products_result[index].price.toString()}",
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xFF1D1E20),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        } else if (state is SuccessSearch) {
                          return Container(
                            width: 375,
                            height: 1000,
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      mainAxisExtent: 200),
                              // state.all_products_result.length,
                              itemCount: state.search_result.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) {
                                        return ProductDetails(
                                            id: state.search_result[index].id);
                                      },
                                    ));
                                  },
                                  child: Container(
                                    width: 160,
                                    height: 250,
                                    color: Color(0xFFFEFEFE),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              width: 160,
                                              height: 100,
                                              child: Image.network(
                                                state.search_result[index]
                                                    .thumbnail,
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return FlutterLogo();
                                                },
                                              ),
                                            ),
                                            Positioned(
                                              left: 128,
                                              right: 12,
                                              top: 15,
                                              bottom: 168,
                                              child: InkWell(
                                                onTap: () {},
                                                child: Icon(
                                                  Icons
                                                      .favorite_outline_rounded,
                                                  size: 20,
                                                  color: Color.fromRGBO(
                                                      143, 149, 158, 1),
                                                ),
                                              ),
                                            ), //favourite_rounded
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          height: 30,
                                          child: Text(
                                              state.search_result[index].title,
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF1D1E20),
                                              )),
                                        ),
                                        Container(
                                          height: 15,
                                          child: Text(
                                              "\$${state.search_result[index].price.toString()}",
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xFF1D1E20),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        } else if (state is Error) {
                          return Center(child: Text('Error'),);
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


/*Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 45),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F6FA),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset('assets/images/menu.png',
                        height: 25, width: 25),
                  ),
                ),
                SizedBox(
                  width: 245,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F6FA),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset('assets/images/Bag.png',
                        height: 25, width: 25),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(
                      fontSize: 28,
                      //fontFamily: 'assets/Fonts/Inter-Regular.ttf',
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1D1E20),
                    ),
                  ),
                  Text(
                    "Welcome to Laza.",
                    style: TextStyle(
                      fontSize: 15,
                      //fontFamily: 'assets/Fonts/Inter-Regular.ttf',
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF8F959E),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //search
            Row(
              children: [
                Container(
                  height: 50,
                  width: 275,
                  decoration: BoxDecoration(
                      color: Color(0xFFF5F6FA),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Image.asset(
                            'assets/images/Search.png',
                          ),
                        ),
                        SizedBox(width: 10),
                        //كيف  بدي ظبط قصة إذا دخل كلمات كتير يعني أكتر من سطر
                        Container(
                          width: 215,
                          child: TextField(
                            maxLines: 1,
                            onChanged: (value) {
                              print(value);
                            },
                            controller: search_text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search...",
                              hintStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 94, 101, 112),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xFF9775FA),
                  ),
                  child: InkWell(
                      onTap: () {},
                      child: Image.asset('assets/images/Voice.png')),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Choose Brand",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1D1E20),
                  ),
                ),
                SizedBox(width: 171),
                InkWell(
                  child: Text("View All",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF8F959E),
                      )),
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(
              height: 17,
            ),
            SizedBox(
                height: 50,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 50,
                      width: 115,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xFFF5F6FA),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color(0xFFFEFEFE),
                              ),
                              child: Image.asset('assets/images/Adidas.png'),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Adidas",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF1D1E20),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemCount: 4,
                )),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "New Arraival",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1D1E20),
                  ),
                ),
                SizedBox(width: 182),
                InkWell(
                  child: Text("View All",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF8F959E),
                      )),
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
                width: 160,
                height: 257,
                color: Color(0xFFFEFEFE),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                            width: 160,
                            height: 203,
                            child:
                                Image.asset('assets/images/Rectangle 568.png')),
                        Positioned(
                          left: 128,
                          right: 12,
                          top: 15,
                          bottom: 168,
                          child: InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.favorite_outline_rounded,
                              size: 20,
                              color: Color.fromRGBO(143, 149, 158, 1),
                            ),
                          ),
                        ), //favourite_rounded
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 117,
                      height: 30,
                      child: Text("Nike Sportswear Club Fleece",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1D1E20),
                          )),
                    ),
                    Container(
                      width: 26,
                      height: 15,
                      child: Text("\$99",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1D1E20),
                          )),
                    ),
                  ],
                ),
                ),
          ],
        ),
      ),
    );
   */


/* Container(
                width: 160,
                height: 257,
                color: Color(0xFFFEFEFE),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                            width: 160,
                            height: 203,
                            child:
                                Image.asset('assets/images/Rectangle 568.png')),
                        Positioned(
                          left: 128,
                          right: 12,
                          top: 15,
                          bottom: 168,
                          child: InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.favorite_outline_rounded,
                              size: 20,
                              color: Color.fromRGBO(143, 149, 158, 1),
                            ),
                          ),
                        ), //favourite_rounded
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 117,
                      height: 30,
                      child: Text("Nike Sportswear Club Fleece",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1D1E20),
                          )),
                    ),
                    Container(
                      width: 26,
                      height: 15,
                      child: Text("\$99",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1D1E20),
                          )),
                    ),
                  ],
                ),
                ),
           */