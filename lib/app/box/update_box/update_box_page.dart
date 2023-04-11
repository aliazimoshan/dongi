import 'dart:io';

import 'package:dongi/models/box_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../constants/color_config.dart';
import '../../../widgets/appbar/appbar.dart';
import 'update_box_widget.dart';

class UpdateBoxPage extends HookConsumerWidget with UpdateBoxWidget {
  final BoxModel boxModel;
  UpdateBoxPage({super.key, required this.boxModel});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final boxTitle = useTextEditingController(text: boxModel.title);
    final boxDescription = useTextEditingController(text: boxModel.description);
    final oldBoxImage = useState<String?>(boxModel.image);
    final newBoxImage = useState<File?>(null);

    return Scaffold(
      backgroundColor: ColorConfig.white,
      appBar: AppBarWidget(title: "Update Box"),
      body: Column(
        children: [
          boxInfoCard(
            context: context,
            oldGroupImage: oldBoxImage,
            newGroupImage: newBoxImage,
            boxTitle: boxTitle,
            boxDescription: boxDescription,
            formKey: _formKey,
            ref: ref,
          ),
          selectFriendsCard(context),
          const Spacer(),
          createButton(
            ref: ref,
            context: context,
            formKey: _formKey,
            newBoxImage: newBoxImage,
            boxTitle: boxTitle,
            boxDescription: boxDescription,
            boxModel: boxModel,
          ),
        ],
      ),
    );
  }
}
