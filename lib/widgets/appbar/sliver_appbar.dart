import 'package:flutter/material.dart';

import '../../constants/color_config.dart';

class SliverAppBarWidget extends NestedScrollView {
  final Widget appbarTitle;
  final Widget child;
  SliverAppBarWidget({
    required this.appbarTitle,
    required this.child,
    super.key,
  }) : super(
          headerSliverBuilder: headerSliverBuilder(appbarTitle: appbarTitle),
          body: sliverAppBarBody(child: child),
        );
}

/// * ----- headerSliverBuilder
NestedScrollViewHeaderSliversBuilder headerSliverBuilder(
    {required Widget appbarTitle}) {
  return (BuildContext context, bool innerBoxIsScrolled) {
    return [sliverAppBarTitle(appbarTitle: appbarTitle)];
  };
}

/// * ----- sliver app bar title
SliverAppBar sliverAppBarTitle({required Widget appbarTitle}) {
  return SliverAppBar(
    expandedHeight: 150,
    centerTitle: false,
    pinned: false,
    floating: false,
    flexibleSpace: FlexibleSpaceBar(
      centerTitle: false,
      titlePadding: const EdgeInsets.symmetric(horizontal: 16),
      title: appbarTitle,
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
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    child: child,
  );
}
