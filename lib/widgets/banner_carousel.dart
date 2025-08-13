import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:show_online_app/models/product_model.dart';
import 'package:extended_image/extended_image.dart';

class BannerCarousel extends StatelessWidget {
  final List<Product> products;

  const BannerCarousel({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
      items: products
          .map(
            (product) => Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                child: ExtendedImage.network(
                  product.image ?? '',
                  fit: BoxFit.contain,
                  width: 1000.0,
                  cache: true,
                  loadStateChanged: (ExtendedImageState state) {
                    if (state.extendedImageLoadState == LoadState.loading) {
                      return Center(
                        child: Lottie.asset(
                          'assets/lottie/loading.json',
                          width: 120,
                        ),
                      );
                    }
                    return null;
                  },
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
