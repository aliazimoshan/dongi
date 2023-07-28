import 'dart:ui';
import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../constants/color_config.dart';

class SliverAppBarWidget extends HookWidget {
  final Widget appbarTitle;
  final Widget child;
  final double? height;
  //final double? collapsedHeight;
  final String? image;
  const SliverAppBarWidget({
    super.key,
    required this.appbarTitle,
    required this.child,
    this.height = 150,
    //this.collapsedHeight,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    // useEffect to dispose the ScrollController when the widget is unmounted
    //useEffect(() {
    //  return () {
    //    scrollController.dispose();
    //  };
    //}, [scrollController]);

    /// * ----- headerSliverBuilder
    SliverAppBar headerSliver() {
      return SliverAppBar(
        expandedHeight: height,
        centerTitle: false,
        pinned: true,
        floating: true,
        snap: true,
        elevation: 0,
        toolbarHeight: 80,
        flexibleSpace: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          // Calculate the padding based on the current height of the FlexibleSpaceBar
          const double expandedPadding = 30;
          const double collapsedPadding = 70;
          final double currentPadding = math.max(
            0,
            lerpDouble(
              collapsedPadding,
              expandedPadding,
              (constraints.maxHeight - kToolbarHeight) / (200 - kToolbarHeight),
            )!,
          );

          // Calculate opacity based on the scroll offset
          final opacity = (scrollController.offset / (height! - kToolbarHeight))
              .clamp(0.2, 0.6);

          return Stack(
            children: [
              image != null
                  ? Positioned.fill(
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors.black54.withOpacity(opacity),
                          BlendMode.colorBurn,
                        ),
                        child: CachedNetworkImage(
                          imageUrl: image!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : const SizedBox(),
              FlexibleSpaceBar(
                centerTitle: false,
                titlePadding: EdgeInsets.fromLTRB(currentPadding, 0, 0, 10),
                title: appbarTitle,
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 16,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: ColorConfig.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      );
    }

    return NestedScrollView(
      controller: scrollController,
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        headerSliver(),
      ],
      body: child,
    );
  }
}
