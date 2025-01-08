import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';

class TicketDetailsView extends GetView {
  const TicketDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GlobalAppbar(title: "تفاصيل التذكرة"),
      body: Center(
        child: Text(
          'TicketDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
