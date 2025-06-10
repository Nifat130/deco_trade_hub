import 'package:app_ui/app_ui.dart';
import 'package:deco_trade_hub/core/shimmers/dummy_db/dummy_product.dart';
import 'package:deco_trade_hub/features/store/model/store_banner_model.dart';
import 'package:deco_trade_hub/features/store/presentation/controllers/store_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PromotionalBanners extends StatelessWidget {
  final List<String> bannerUrls = [
    dummyImageUrl,
    dummyImageUrl,
    dummyImageUrl,
    dummyImageUrl,
    'dummyImageUrl',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: CarouselView(
        itemExtent: 330,
        itemSnapping: true,
        scrollDirection: Axis.horizontal,
        children: bannerUrls.map((url) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: ImageAttachmentThumbnail(
                imageUrl: url,
                fit: BoxFit.cover,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class TrendingStoresSection extends StatefulWidget {
  const TrendingStoresSection({super.key});

  @override
  State<TrendingStoresSection> createState() => _TrendingStoresSectionState();
}

class _TrendingStoresSectionState extends State<TrendingStoresSection> {
  late final CarouselController _carouselController;

  @override
  void initState() {
    _carouselController = CarouselController(initialItem: 1);
    Get.find<StoreController>().fetchTrendingStores();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreController>(builder: (storeController) {
      if (storeController.isLoadingTrendingStores || storeController.trendingStoreBanners == null) {
        return const Center(child: CircularProgressIndicator());
      }
      if (storeController.trendingStoreBanners!.isEmpty) {
        return const SizedBox.shrink();
      }
      return ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 400 / 2),
        child: CarouselView.weighted(
          controller: _carouselController,
          itemSnapping: true,
          flexWeights: const <int>[1, 7, 1],
          children: storeController.trendingStoreBanners!.map((image) {
            return HeroLayoutCard(storeBanners: image);
          }).toList(),
        ),
      );
    });
  }
}

class HeroLayoutCard extends StatelessWidget {
  const HeroLayoutCard({super.key, required this.storeBanners});

  final StoreBannerModel storeBanners;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: <Widget>[
        ClipRect(
          child: OverflowBox(
            maxWidth: width * 7 / 8,
            minWidth: width * 7 / 8,
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(
                storeBanners.storeBannerUrl ?? dummyImageUrl,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                storeBanners.storeName,
                overflow: TextOverflow.clip,
                softWrap: false,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 10),
              Text(
                'Trending right now',
                overflow: TextOverflow.clip,
                softWrap: false,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
