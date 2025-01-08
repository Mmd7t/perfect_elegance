import 'package:flutter/material.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/core/widgets/global_button.dart';
import 'package:perfect_elegance/app/core/widgets/global_textfield.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';

class AddNewProductView extends StatelessWidget {
  const AddNewProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "اضافة منتج جديد"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const GlobalTextField(
              hintText: "ادخل",
              title: "اسم المنتج",
              filled: true,
            ),
            const SizedBox(height: 8),
            const GlobalTextField(
              hintText: "ادخل",
              title: "رابط الشراء",
              filled: true,
            ),
            const SizedBox(height: 8),
            const GlobalTextField(
              hintText: "ادخل",
              title: "وحدة حفظ المخزن (SKU)",
              filled: true,
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                Expanded(
                  child: GlobalButton(
                    onTap: () {},
                    text: "حفظ",
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GlobalButton(
                    onTap: () {},
                    text: "اغلاق",
                    color: Constants.grey5,
                    textColor: Constants.cancel,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
