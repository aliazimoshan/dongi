import 'package:dongi/constants/color_config.dart';
import 'package:dongi/constants/font_config.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import './friend_review_widget.dart';

class FriendReviewPage extends HookConsumerWidget with FriendReviewWidget {
  const FriendReviewPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorConfig.primarySwatch,
      appBar: AppBar(
        title: Text(
          'Friend',
          style: FontConfig.h6().copyWith(color: ColorConfig.pureWhite),
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            // ignore: prefer_const_constructors
            SliverAppBar(
              expandedHeight: 150,
              floating: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                titlePadding: const EdgeInsets.symmetric(horizontal: 16),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'total expense',
                      style: FontConfig.caption()
                          .copyWith(color: ColorConfig.pureWhite),
                    ),
                    Text(
                      '\$7,540.00',
                      style: FontConfig.h5().copyWith(
                        color: ColorConfig.pureWhite,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Container(
            decoration: BoxDecoration(
              color: ColorConfig.background,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: ListView(
              children: [
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 15,
                    itemBuilder: (context, i) => Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          color: Colors.red,
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 6),
              ],
            )),
      ),
    );
  }
}
