import 'package:flutter/material.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/core/widgets/global_button.dart';
import 'package:perfect_elegance/app/core/widgets/global_textfield.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';

class AddCustomerView extends StatelessWidget {
  const AddCustomerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "اضافة زبون"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const GlobalTextField(
              hintText: "ادخل",
              title: "اسم الزبون",
              filled: true,
            ),
            const SizedBox(height: 8),
            const GlobalTextField(
              hintText: "ادخل",
              title: "رقم الهاتف",
              filled: true,
            ),
            const SizedBox(height: 8),
            const GlobalTextField(
              hintText: "ادخل",
              title: "رقم الهاتف الاحتياطي",
              filled: true,
            ),
            const SizedBox(height: 8),
            const GlobalTextField(
              hintText: "ادخل",
              title: "المدينة",
              filled: true,
            ),
            const SizedBox(height: 8),
            const GlobalTextField(
              hintText: "ادخل",
              title: "العنوان",
              filled: true,
            ),
            const SizedBox(height: 8),
            const GlobalTextField(
              hintText: "ادخل",
              title: "العنوان التفصيلي",
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
