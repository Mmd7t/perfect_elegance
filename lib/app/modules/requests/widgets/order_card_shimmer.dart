import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/modules/requests/controllers/requests_controller.dart';

class OrderCardShimmer extends GetWidget<RequestsController> {
  const OrderCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            "#12345".titleSmall().shimmer(),
            Container(
              height: 15,
              width: 85,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
            ).shimmer(),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            const CircleAvatar(radius: 11, backgroundColor: Colors.white)
                .shimmer(),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                height: 12,
                margin: const EdgeInsetsDirectional.only(end: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
              ).shimmer(),
            ),
          ],
        ),
        const SizedBox(height: 7),
        Row(
          children: [
            const CircleAvatar(radius: 11, backgroundColor: Colors.white)
                .shimmer(),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                height: 12,
                margin: const EdgeInsetsDirectional.only(end: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
              ).shimmer(),
            ),
          ],
        ),
        const SizedBox(height: 7),
        Row(
          children: [
            const CircleAvatar(radius: 11, backgroundColor: Colors.white)
                .shimmer(),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                height: 12,
                margin: const EdgeInsetsDirectional.only(end: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
              ).shimmer(),
            ),
          ],
        ),
        const SizedBox(height: 7),
        Row(
          children: [
            const CircleAvatar(radius: 11, backgroundColor: Colors.white)
                .shimmer(),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                height: 12,
                margin: const EdgeInsetsDirectional.only(end: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
              ).shimmer(),
            ),
          ],
        ),
      ],
    ).decorate(padding: 12);
  }
}
