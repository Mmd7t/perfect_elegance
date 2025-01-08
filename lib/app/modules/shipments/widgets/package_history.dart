import 'package:flutter/material.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';

class PackageHistory extends StatelessWidget {
  const PackageHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "سجل الشحنة".titleSmall(),
        const SizedBox(height: 15),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Constants.grey4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "تم اضافة الشحنة من قبل المرسل".subtitle(
                weight: FontWeight.bold,
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "قيمة الشحنة المدخلة:".bodyMedium(),
                        "الكمية:".bodyMedium(),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "100".subtitle(),
                        "0".subtitle(),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              "2024-12-04T09:40:57.000000Z".bodyMedium(),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Constants.grey4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "تم استقبال الشحنة بالفرع - السراج".subtitle(
                weight: FontWeight.bold,
              ),
              const SizedBox(height: 5),
              "2024-12-04T09:40:57.000000Z".bodyMedium(),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Constants.grey4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "تم استقبال الشحنة بالفرع - السراج".subtitle(
                weight: FontWeight.bold,
              ),
              const SizedBox(height: 5),
              "2024-12-04T09:40:57.000000Z".bodyMedium(),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Constants.grey4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "تم استقبال الشحنة بالفرع - السراج".subtitle(
                weight: FontWeight.bold,
              ),
              const SizedBox(height: 5),
              "2024-12-04T09:40:57.000000Z".bodyMedium(),
            ],
          ),
        ),
      ],
    ).decorate(padding: 15);
  }
}
