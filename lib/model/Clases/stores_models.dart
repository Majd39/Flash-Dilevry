import 'package:prl_app/model/Clases/products_models.dart';

class StoresModels {
  final String imageUrl;

  final String name;

  final String location;

  final List<ProductsModels> products;

  StoresModels(
      {required this.imageUrl,
      required this.name,
      required this.location,
      required this.products});

  // static List<StoresModels> stores = [
  //   StoresModels(
  //       imageUrl: ImageRouts.big5,
  //       name: 'Big5',
  //       location: 'Dams-Med',
  //       products: [
  //         ProductsModels(
  //             name: 'Shawarma',
  //             pris: 45,
  //             imageUrl: ImageRouts.imag,
  //             description:
  //                 'omar abo hawa mnja slvbsjvv sdlvkbfdvmmc kjjvbdnvm skv von c skgvvbsv sdvhhvb '),
  //         ProductsModels(
  //             name: 'fode',
  //             pris: 45,
  //             imageUrl: ImageRouts.imag,
  //             description:
  //                 'omar abo hawa mnja slvbsjvv sdlvkbfdvmmc kjjvbdnvm skv von c skgvvbsv sdvhhvb '),
  //         ProductsModels(
  //             name: 'mode',
  //             pris: 45,
  //             imageUrl: ImageRouts.imag,
  //             description:
  //                 'omar abo hawa mnja slvbsjvv sdlvkbfdvmmc kjjvbdnvm skv von c skgvvbsv sdvhhvb '),
  //         ProductsModels(
  //             name: 'Ahmade',
  //             pris: 45,
  //             imageUrl: ImageRouts.imag,
  //             description:
  //                 'omar abo hawa mnja slvbsjvv sdlvkbfdvmmc kjjvbdnvm skv von c skgvvbsv sdvhhvb '),
  //         ProductsModels(
  //             name: 'omar ',
  //             pris: 23,
  //             imageUrl: ImageRouts.imag,
  //             description:
  //                 'omar abo hawa mnja slvbsjvv sdlvkbfdvmmc kjjvbdnvm skv von c skgvvbsv sdvhhvb '),
  //         ProductsModels(
  //             name: 'Hala ',
  //             pris: 68,
  //             imageUrl: ImageRouts.imag,
  //             description:
  //                 'omar abo hawa mnja slvbsjvv sdlvkbfdvmmc kjjvbdnvm skv von c skgvvbsv sdvhhvb '),
  //         ProductsModels(
  //             name: 'mohamad',
  //             pris: 30,
  //             imageUrl: ImageRouts.imag,
  //             description:
  //                 'omar abo hawa mnja slvbsjvv sdlvkbfdvmmc kjjvbdnvm skv von c skgvvbsv sdvhhvb '),
  //       ]),StoresModels(
  //       imageUrl: ImageRouts.big5,
  //       name: 'omad',
  //       location: 'Dara-Jbabe',
  //       products: [
  //         ProductsModels(
  //             name: 'Shawarma',
  //             pris: 45,
  //             imageUrl: ImageRouts.imag,
  //             description:
  //                 'omar abo hawa mnja slvbsjvv sdlvkbfdvmmc kjjvbdnvm skv von c skgvvbsv sdvhhvb '),
  //         ProductsModels(
  //             name: 'fode',
  //             pris: 45,
  //             imageUrl: ImageRouts.imag,
  //             description:
  //                 'omar abo hawa mnja slvbsjvv sdlvkbfdvmmc kjjvbdnvm skv von c skgvvbsv sdvhhvb '),
  //         ProductsModels(
  //             name: 'mode',
  //             pris: 45,
  //             imageUrl: ImageRouts.imag,
  //             description:
  //                 'omar abo hawa mnja slvbsjvv sdlvkbfdvmmc kjjvbdnvm skv von c skgvvbsv sdvhhvb '),
  //         ProductsModels(
  //             name: 'Ahmade',
  //             pris: 45,
  //             imageUrl: ImageRouts.imag,
  //             description:
  //                 'omar abo hawa mnja slvbsjvv sdlvkbfdvmmc kjjvbdnvm skv von c skgvvbsv sdvhhvb '),
  //         ProductsModels(
  //             name: 'omar ',
  //             pris: 23,
  //             imageUrl: ImageRouts.imag,
  //             description:
  //                 'omar abo hawa mnja slvbsjvv sdlvkbfdvmmc kjjvbdnvm skv von c skgvvbsv sdvhhvb '),
  //         ProductsModels(
  //             name: 'Hala ',
  //             pris: 68,
  //             imageUrl: ImageRouts.imag,
  //             description:
  //                 'omar abo hawa mnja slvbsjvv sdlvkbfdvmmc kjjvbdnvm skv von c skgvvbsv sdvhhvb '),
  //         ProductsModels(
  //             name: 'mohamad',
  //             pris: 30,
  //             imageUrl: ImageRouts.imag,
  //             description:
  //                 'omar abo hawa mnja slvbsjvv sdlvkbfdvmmc kjjvbdnvm skv von c skgvvbsv sdvhhvb '),
  //       ]),StoresModels(
  //       imageUrl: ImageRouts.big5,
  //       name: 'mohamed',
  //       location: 'Homs-Hadara',
  //       products: [
  //         ProductsModels(
  //             name: 'Shawarma',
  //             pris: 45,
  //             imageUrl: ImageRouts.imag,
  //             description:
  //                 'omar abo hawa mnja slvbsjvv sdlvkbfdvmmc kjjvbdnvm skv von c skgvvbsv sdvhhvb '),
  //         ProductsModels(
  //             name: 'fode',
  //             pris: 45,
  //             imageUrl: ImageRouts.imag,
  //             description:
  //                 'omar abo hawa mnja slvbsjvv sdlvkbfdvmmc kjjvbdnvm skv von c skgvvbsv sdvhhvb '),
  //         ProductsModels(
  //             name: 'mode',
  //             pris: 45,
  //             imageUrl: ImageRouts.imag,
  //             description:
  //                 'omar abo hawa mnja slvbsjvv sdlvkbfdvmmc kjjvbdnvm skv von c skgvvbsv sdvhhvb '),
  //         ProductsModels(
  //             name: 'Ahmade',
  //             pris: 45,
  //             imageUrl: ImageRouts.imag,
  //             description:
  //                 'omar abo hawa mnja slvbsjvv sdlvkbfdvmmc kjjvbdnvm skv von c skgvvbsv sdvhhvb '),
  //         ProductsModels(
  //             name: 'omar ',
  //             pris: 23,
  //             imageUrl: ImageRouts.imag,
  //             description:
  //                 'omar abo hawa mnja slvbsjvv sdlvkbfdvmmc kjjvbdnvm skv von c skgvvbsv sdvhhvb '),
  //         ProductsModels(
  //             name: 'Hala ',
  //             pris: 68,
  //             imageUrl: ImageRouts.imag,
  //             description:
  //                 'omar abo hawa mnja slvbsjvv sdlvkbfdvmmc kjjvbdnvm skv von c skgvvbsv sdvhhvb '),
  //         ProductsModels(
  //             name: 'mohamad',
  //             pris: 30,
  //             imageUrl: ImageRouts.imag,
  //             description:
  //                 'omar abo hawa mnja slvbsjvv sdlvkbfdvmmc kjjvbdnvm skv von c skgvvbsv sdvhhvb '),
  //       ]),
  // ];
}
