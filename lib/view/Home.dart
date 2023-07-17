import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/HomeController.dart';
import '../widgets/BuildAppBar.dart';
import '../widgets/Product.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final HomeController _homeController;

  @override
  void initState() {
    _homeController = Get.put(HomeController());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar("GetX Demo"),
        body: SingleChildScrollView(
          child: Column(
              //  _homeController.featuredProductResponse.value.data?.data?[0].name
              children: [
                Obx(
                      () {
                    final data = _homeController.featuredProductResponse.value.data?.data ?? [];
                    return Column(
                      children: data.map((e) => Product(
                        id: e.id ?? 0,
                        name: e.name ?? "",
                        shortDescription: e.shortDescription.toString() ?? "",
                        fullDescription: e.fullDescription ?? "",
                        productPrice: e.productPrice?.priceValue.toString() ?? "",
                        imageUrl: e.pictureModels?.first?.imageUrl ?? "",
                        fullSizeImageUrl: e.pictureModels?.first?.fullSizeImageUrl ?? "",
                      )).toList(),
                    );
                  },
                ),
              ],
          ),
        ));
  }
}
