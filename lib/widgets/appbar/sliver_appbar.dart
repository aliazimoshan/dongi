import 'package:flutter/material.dart';

import '../../constants/color_config.dart';

class SliverAppBarWidget extends NestedScrollView {
  final Widget appbarTitle;
  final Widget child;
  final double? height;
  final double? collapsedHeight;
  final String? image;
  SliverAppBarWidget({
    required this.appbarTitle,
    required this.child,
    this.height,
    this.collapsedHeight,
    this.image,
    super.key,
  }) : super(
          headerSliverBuilder: headerSliverBuilder(
            appbarTitle: appbarTitle,
            height: height,
            collapsedHeight: collapsedHeight,
            image: image,
          ),
          body: sliverAppBarBody(child: child),
        );
}

/// * ----- headerSliverBuilder
NestedScrollViewHeaderSliversBuilder headerSliverBuilder({
  required Widget appbarTitle,
  double? height,
  double? collapsedHeight,
  String? image,
}) {
  return (BuildContext context, bool innerBoxIsScrolled) {
    return [
      sliverAppBarTitle(
        context: context,
        appbarTitle: appbarTitle,
        height: height,
        collapsedHeight: collapsedHeight,
        image: image,
      ),
    ];
  };
}

/// * ----- sliver app bar title
SliverAppBar sliverAppBarTitle({
  required BuildContext context,
  required Widget appbarTitle,
  double? height,
  double? collapsedHeight,
  String? image,
}) {
  return SliverAppBar(
    expandedHeight: height ?? 150,
    centerTitle: false,
    pinned: false,
    floating: true,
    collapsedHeight: collapsedHeight,
    elevation: 0,
    flexibleSpace: Stack(
      children: [
        image != null
            ? Positioned.fill(
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Colors.black54,
                    BlendMode.darken,
                  ),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : const SizedBox(),
        FlexibleSpaceBar(
          centerTitle: false,
          titlePadding: const EdgeInsets.symmetric(horizontal: 16),
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
        )
      ],
    ),
  );
}

/// * ----- body
Widget sliverAppBarBody({
  required Widget child,
}) {
  return Container(
    decoration: BoxDecoration(
      color: ColorConfig.white,
      //borderRadius: const BorderRadius.only(
      //  topLeft: Radius.circular(16),
      //  topRight: Radius.circular(16),
      //),
    ),
    child: child,
  );
}
