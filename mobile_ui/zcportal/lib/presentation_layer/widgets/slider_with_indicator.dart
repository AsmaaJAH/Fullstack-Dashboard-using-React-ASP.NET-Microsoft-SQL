import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:zcportal/constants/app_colors.dart';
import 'package:zcportal/constants/app_images_paths/app_images_assets.dart';
import 'package:zcportal/constants/app_screen_dimensions.dart';
import 'package:zcportal/data_layer/providers/widgets_providers/slider_with_indicator_provider.dart';

const mediaList = [
  AppImagesAssets.zewail,
  AppImagesAssets.cyanLogo,
  AppImagesAssets.it,
  AppImagesAssets.whiteLogo,
];

class SliderWithIndicator extends StatefulWidget {
  const SliderWithIndicator(
      {super.key,
      this.mediaItems = mediaList,
      this.items,
      this.isSmallCard = false});
  final List mediaItems;
  final List<Widget>? items;
  final bool isSmallCard;

  @override
  State<SliderWithIndicator> createState() => _SliderWithIndicatorState();
}

class _SliderWithIndicatorState extends State<SliderWithIndicator> {
  late SliderWithIndicatorProviderState readProvider;

  @override
  void initState() {
    super.initState();
    readProvider = context.read<SliderWithIndicatorProviderState>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 11.5 / 9,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlayInterval: const Duration(milliseconds: 1800),
            autoPlayAnimationDuration: const Duration(milliseconds: 500),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
            autoPlay: true,
            height: widget.items == null
                ? kScreenHeight * 0.4
                : widget.isSmallCard
                    ? kScreenHeight * 0.2
                    : kScreenHeight * 0.27,
            onPageChanged: (index, reason) {
              readProvider.updateCurrentActiveIndex(index);
              //just to make sure
              if (index == widget.mediaItems.length ||
                  (widget.items != null && index == widget.items!.length)) {
                readProvider.updateCurrentActiveIndex(0);
              }
            },
          ),
          items: widget.items ??
              widget.mediaItems.map((imageURL) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: kScreenWidth,
                      height: kScreenHeight * 0.4,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: const BoxDecoration(color: AppColors.white),
                      child: FadeInImage(
                        placeholder: MemoryImage(kTransparentImage),
                        image: AssetImage(imageURL),
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                );
              }).toList(),
        ),
        const SizedBox(
          height: 15,
        ),
        Selector<SliderWithIndicatorProviderState, int>(
            selector: (_, provider) => provider.currentActiveIndex,
            builder: (context, currentActiveIndex, child) {
              // if (currentActiveIndex >= widget.mediaItems.length) {
              //   //array=[1,2,3,4,5]
              //   //length=5
              //   //index 0------> 4
              //   readProvider.updateCurrentActiveIndex(0);
              // }
              return AnimatedSmoothIndicator(
                activeIndex: currentActiveIndex,
                count: widget.items == null
                    ? widget.mediaItems.length
                    : widget.items!.length,
                effect: CustomizableEffect(
                  activeDotDecoration: DotDecoration(
                    width: 12,
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  dotDecoration: DotDecoration(
                    width: 6,
                    color: AppColors.gray,
                    borderRadius: BorderRadius.circular(20),
                    verticalOffset: 0,
                  ),
                  spacing: 10.0,
                ),
              );
            })
      ],
    );
  }
}
