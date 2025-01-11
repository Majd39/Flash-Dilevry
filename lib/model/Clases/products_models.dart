import 'package:prl_app/model/routes/image_routs.dart';

class ProductsModels {
  final String name;

  final double pris;
  final String imageUrl;
  final String description;
  final String storeName;

  ProductsModels(
      {required this.name,
      required this.pris,
      required this.imageUrl,
      required this.description,
      required this.storeName});

  static List<ProductsModels> products = [
    ProductsModels(
        name: 'Shawarma',
        pris: 100,
        imageUrl: ImageRouts.big5,
        description:
            'omar abo hawa mnja slvbsjvv sdlvkbfdvmmc kjjvbdnvm skv von c skgvvbsvomar '
                'abo hawa mnja slvbsjvv sdlvkbfdvmmc kjjvbdnvm skv von c skgvvbsvomar abo '
                'hawa mnja slvbsjvv sdlvkbfdvmmc kjjvbdnvm skv von c skgvvbsvomar abo hawa mnja '
                'slvbsjvv sdlvkbfdvmmc kjjvbdnvm skv von c skgvvbsvomar abo'
                ' hawa mnja slvbsjvv sdlvkbfdvmmc kjjvbdnvm skv von c skgvvbsv sdvhhvb ',
        storeName: 'Abo Omar'),
    ProductsModels(
        storeName: 'AboSamer',
        name: 'fode',
        pris: 45,
        imageUrl: ImageRouts.store,
        description:
            'omar abo hawa mnja slvbsjvv sdlvkbfdvmmc kjjvbdnvm skv von c skgvvbsv sdvhhvb '),
    ProductsModels(storeName: 'Hala',

        name: 'mode',
        pris: 76,
        imageUrl: ImageRouts.furniture,
        description:
            'omar abo hawa mnja slvbsjvv sdlvkbfdvmmc kjjvbdnvm skv von c skgvvbsv sdvhhvb '),
    ProductsModels(
        storeName: 'mohamde',
        name: 'Ahmade',
        pris: 32,
        imageUrl: ImageRouts.fruits,
        description:
            'omar abo hawa mnja slvbsjvv sdlvkbfdvmmc kjjvbdnvm skv von c skgvvbsv sdvhhvb '),
    ProductsModels(
        storeName: 'osama',
        name: 'omar ',
        pris: 23,
        imageUrl: ImageRouts.imag,
        description:
            'omar abo hawa mnja slvbsjvv sdlvkbfdvmmc kjjvbdnvm skv von c skgvvbsv sdvhhvb '),
    ProductsModels(
        storeName: 'poma',
        name: 'Hala ',
        pris: 68,
        imageUrl: ImageRouts.big5,
        description:
            'omar abo hawa mnja slvbsjvv sdlvkbfdvmmc kjjvbdnvm skv von c skgvvbsv sdvhhvb '),
    ProductsModels(
        storeName: 'Adedas',
        name: 'mohamad',
        pris: 30,
        imageUrl: ImageRouts.imag,
        description:
            'omar abo hawa mnja slvbsjvv sdlvkbfdvmmc kjjvbdnvm skv von c skgvvbsv sdvhhvb '),
  ];
}
