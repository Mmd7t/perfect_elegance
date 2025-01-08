import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';

class PolicyView extends GetView {
  const PolicyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "سياسة الخصوصية"),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Personal information we collect".titleSmall(),
            const SizedBox(height: 2),
            "When you visit the Site, we automatically collect certain information about your device, including information about your web browser, IP address, time zone, and some of the cookies that are installed on your device. Additionally, as you browse the Site, we collect information about the individual web pages or products that you view, what websites or search terms referred you to the Site, and information about how you interact with the Site. We refer to this automatically-collected information as “Device Information”."
                .bodyMedium(),
            const SizedBox(height: 8),
            "Personal information we collect".titleSmall(),
            const SizedBox(height: 2),
            "When you visit the Site, we automatically collect certain information about your device, including information about your web browser, IP address, time zone, and some of the cookies that are installed on your device. Additionally, as you browse the Site, we collect information about the individual web pages or products that you view, what websites or search terms referred you to the Site, and information about how you interact with the Site. We refer to this automatically-collected information as “Device Information”."
                .bodyMedium(),
            const SizedBox(height: 8),
            "Personal information we collect".titleSmall(),
            const SizedBox(height: 2),
            "When you visit the Site, we automatically collect certain information about your device, including information about your web browser, IP address, time zone, and some of the cookies that are installed on your device. Additionally, as you browse the Site, we collect information about the individual web pages or products that you view, what websites or search terms referred you to the Site, and information about how you interact with the Site. We refer to this automatically-collected information as “Device Information”."
                .bodyMedium(),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
