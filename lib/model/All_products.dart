// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ProductModel {
  int id;
  String title;
  String thumbnail;
  int price;
  List<dynamic> images;
  ProductModel({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.price,
    required this.images,
  });

  ProductModel copyWith({
    int? id,
    String? title,
    String? thumbnail,
    int? price,
    List<dynamic>? images,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      thumbnail: thumbnail ?? this.thumbnail,
      price: price ?? this.price,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'thumbnail': thumbnail,
      'price': price,
      'images': images,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
        id: map['id'] as int,
        title: map['title'] as String,
        thumbnail: map['thumbnail'] as String,
        price: map['price'] as int,
        images: List<dynamic>.from(
          (map['images'] as List<dynamic>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(id: $id, title: $title, thumbnail: $thumbnail, price: $price, images: $images)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.thumbnail == thumbnail &&
        other.price == price &&
        listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        thumbnail.hashCode ^
        price.hashCode ^
        images.hashCode;
  }
}

class ProductDetailsModel {
  int id;
  String title;
  String thumbnail;
  String description;
  String category;
  String brand;
  int price;
  List<dynamic> images;
  ProductDetailsModel({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.description,
    required this.category,
    required this.brand,
    required this.price,
    required this.images,
  });

  ProductDetailsModel copyWith({
    int? id,
    String? title,
    String? thumbnail,
    String? description,
    String? category,
    String? brand,
    int? price,
    List<dynamic>? images,
  }) {
    return ProductDetailsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      thumbnail: thumbnail ?? this.thumbnail,
      description: description ?? this.description,
      category: category ?? this.category,
      brand: brand ?? this.brand,
      price: price ?? this.price,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'thumbnail': thumbnail,
      'description': description,
      'category': category,
      'brand': brand,
      'price': price,
      'images': images,
    };
  }

  factory ProductDetailsModel.fromMap(Map<String, dynamic> map) {
    return ProductDetailsModel(
      id: map['id'] as int,
      title: map['title'] as String,
      thumbnail: map['thumbnail'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      brand: map['brand'] as String,
      price: map['price'] as int,
      images: List<dynamic>.from((map['images'] as List<dynamic>),
    ));
  }

  String toJson() => json.encode(toMap());

  factory ProductDetailsModel.fromJson(String source) => ProductDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductDetailsModel(id: $id, title: $title, thumbnail: $thumbnail, description: $description, category: $category, brand: $brand, price: $price, images: $images)';
  }

  @override
  bool operator ==(covariant ProductDetailsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.thumbnail == thumbnail &&
      other.description == description &&
      other.category == category &&
      other.brand == brand &&
      other.price == price &&
      listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      thumbnail.hashCode ^
      description.hashCode ^
      category.hashCode ^
      brand.hashCode ^
      price.hashCode ^
      images.hashCode;
  }
}
