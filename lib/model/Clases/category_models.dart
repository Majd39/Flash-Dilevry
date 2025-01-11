import 'package:flutter/material.dart';
import 'package:prl_app/model/routes/image_routs.dart';

class CategoryModels {
  final Color color;

  final String imageUrl;

  final String text;

  CategoryModels(
      {required this.color, required this.imageUrl, required this.text});

  static List<CategoryModels> categoryList = [
    CategoryModels(
        color: const Color(0xFFF5BA3C),
        imageUrl: ImageRouts.beverages,
        text: 'Beverages'),
    CategoryModels(
        color: const Color(0xFFF8644A),
        imageUrl: ImageRouts.fruits,
        text: 'Fruits'),
    CategoryModels(
        color: const Color(0xFF28B446),
        imageUrl: ImageRouts.vegetables,
        text: 'Vegetables'),
    CategoryModels(
        color: const Color(0xFFAE80FF),
        imageUrl: ImageRouts.grocery,
        text: 'Grocery'),
    CategoryModels(
        color: const Color(0xFF0CD4DC),
        imageUrl: ImageRouts.furniture,
        text: 'Furniture'),
    CategoryModels(
        color: const Color(0xFFFF99B6),
        imageUrl: ImageRouts.clothes,
        text: 'Clothes'),
  ];

}
