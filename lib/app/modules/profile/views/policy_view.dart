import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/modules/profile/controllers/policy_controller.dart';

class PolicyView extends GetView<PolicyController> {
  const PolicyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "سياسة الخصوصية"),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (controller.data.isEmpty) {
            return Center(child: "لا يوجد سياسات".bodyMedium());
          } else {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "${controller.data[index].title}".titleSmall(),
                  const SizedBox(height: 2),
                  HtmlWidget(
                    controller.data[index].content!,
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
                ],
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemCount: controller.data.length,
            );
          }
        }
      }),
    );
  }
}
