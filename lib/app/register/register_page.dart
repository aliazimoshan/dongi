import 'package:dongi/constants/size_config.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import './register_widget.dart';

class RegisterPage extends ConsumerWidget with RegisterWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView.builder(
        itemBuilder: (context, index) => Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                  // color: Colors.amber,
                  ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    Text('data'),
                    Text('data'),
                    Container(
                      padding: EdgeInsets.all(15),
                      width: SizeConfig.width(context),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      child: Text('data'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
