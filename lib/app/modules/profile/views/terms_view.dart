import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/modules/profile/controllers/terms_controller.dart';

class TermsView extends GetView<TermsController> {
  const TermsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "الشروط و الأحكام"),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: HtmlWidget(
                controller.content.value,
                customStylesBuilder: (element) {
                  if (element.classes.contains('foo')) {
                    return {'color': 'red'};
                  }

                  return null;
                },
                renderMode: RenderMode.column,
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Cairo',
                ),
              ),
            ),
          );
        }
      }),
    );
  }
}
