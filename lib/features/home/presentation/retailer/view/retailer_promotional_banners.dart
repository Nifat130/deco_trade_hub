import 'package:app_ui/app_ui.dart';
import 'package:deco_trade_hub/core/shimmers/dummy_db/dummy_product.dart';
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:deco_trade_hub/features/store/model/store_banner_model.dart';
import 'package:deco_trade_hub/features/store/presentation/controllers/store_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/constants/app_colors.dart';

final List<String> bannerUrls = [
  dummyImageUrl,
  dummyImageUrl,
  dummyImageUrl,
  dummyImageUrl,
  'dummyImageUrl',
];

class PromotionalBanners extends StatelessWidget {
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
    _carouselController = CarouselController(initialItem: 0);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<StoreController>().fetchTrendingStores();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreController>(builder: (storeController) {
      if (storeController.isLoadingTrendingStores || storeController.trendingStoreBanners == null) {
        return BannerShimmer();
      }
      if (storeController.trendingStoreBanners!.isEmpty) {
        return const SizedBox.shrink();
      }
      return ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 400 / 2),
        child: CarouselView.weighted(
          controller: _carouselController,
          itemSnapping: true,
          flexWeights: const <int>[7, 1],
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

class BannerShimmer extends StatelessWidget {
  const BannerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Skeletonizer(
      child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 400 / 1.75),
          child: Container(
            width: width.w,
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ImageAttachmentThumbnail(
                      height: 120.h,
                      width: width.w,
                      fit: BoxFit.cover,
                      borderRadius: BorderRadius.circular(8),
                      imageUrl: dummyImageUrl,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  'product name',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'description of the product goes here',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12.sp),
                ),
                SizedBox(height: 5.h),
                // SizedBox(height: 6.h),
              ],
            ),
          )),
    );
  }
}
