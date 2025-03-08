// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:perfect_elegance/app/core/widgets/custom_textfield.dart';
// import 'package:perfect_elegance/app/data/constants/constants.dart';
// import 'package:perfect_elegance/app/data/extensions/extensions.dart';
// import 'package:perfect_elegance/app/data/models/product_card_model.dart';
// import 'package:perfect_elegance/app/modules/requests/controllers/add_order_controller.dart';

// class ProductCard extends GetWidget<AddOrderController> {
//   final ProductCardModel product;
//   const ProductCard({super.key, required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       physics: const BouncingScrollPhysics(),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 flex: 1,
//                 child: "النتائج".subtitle(weight: FontWeight.w700),
//               ),
//               Expanded(
//                 flex: 2,
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         alignment: Alignment.center,
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 15, vertical: 12),
//                         decoration: BoxDecoration(
//                           color: Constants.primary.withValues(alpha: 0.08),
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         child: "SKU : ${product.sku}"
//                             .caption(color: Constants.primary),
//                       ),
//                     ),
//                     const SizedBox(width: 2),
//                     IconButton.filled(
//                       style: IconButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         highlightColor: Constants.cancel.withValues(alpha: 0.3),
//                         backgroundColor:
//                             Constants.cancel.withValues(alpha: 0.1),
//                       ),
//                       onPressed: () {
//                         controller.removeProduct(product);
//                       },
//                       icon: "delete".iconColored(color: Constants.cancel),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 10),
//           Row(
//             children: [
//               Expanded(
//                 flex: 1,
//                 child: "اسم المنتج:".bodyMedium(),
//               ),
//               Expanded(
//                 flex: 2,
//                 child: Container(
//                   width: double.infinity,
//                   alignment: Alignment.center,
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.black45, width: 1),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: product.name!.subtitle(color: Colors.black),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 5),
//           Row(
//             children: [
//               Expanded(
//                 flex: 1,
//                 child: "المقاس:".bodyMedium(),
//               ),
//               Expanded(
//                 flex: 2,
//                 child: CustomTextField(
//                   hintText: "xl",
//                   onChanged: (val) {
//                     controller.setProduct(product.copyWith(size: val));
//                   },
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 5),
//           Row(
//             children: [
//               Expanded(
//                 flex: 1,
//                 child: "اللون:".bodyMedium(),
//               ),
//               Expanded(
//                 flex: 2,
//                 child: CustomTextField(
//                   hintText: "أحمر",
//                   onChanged: (val) {
//                     controller.setProduct(product.copyWith(color: val));
//                   },
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 5),
//           Row(
//             children: [
//               Expanded(
//                 flex: 1,
//                 child: "سعر الشراء:".bodyMedium(),
//               ),
//               Expanded(
//                 flex: 2,
//                 child: CustomTextField(
//                   hintText: "السعر",
//                   onChanged: (val) {
//                     controller.setProduct(product.copyWith(
//                         dollarPurchasingPrice: double.parse(val ?? "0.0")));
//                   },
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 5),
//           Row(
//             children: [
//               Expanded(
//                 flex: 1,
//                 child: "سعر البيع:".bodyMedium(),
//               ),
//               Expanded(
//                 flex: 2,
//                 child: CustomTextField(
//                   hintText: "السعر",
//                   onChanged: (val) {
//                     controller.setProduct(product.copyWith(
//                         dinarSellingPrice: double.parse(val ?? "0.0")));
//                   },
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 5),
//           Row(
//             children: [
//               Expanded(
//                 flex: 1,
//                 child: "الكمية:".bodyMedium(),
//               ),
//               Expanded(
//                 flex: 2,
//                 child: CustomTextField(
//                   hintText: "الكمية",
//                   onChanged: (val) {
//                     controller.setProduct(
//                         product.copyWith(qty: int.parse(val ?? "1")));
//                   },
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 5),
//           // Row(
//           //   children: [
//           //     Expanded(
//           //       flex: 1,
//           //       child: "اجمالي الكمية:".bodyMedium(),
//           //     ),
//           //     Expanded(
//           //       flex: 2,
//           //       child: Container(
//           //         width: double.infinity,
//           //         alignment: Alignment.center,
//           //         padding: const EdgeInsets.all(4),
//           //         decoration: BoxDecoration(
//           //           border: Border.all(color: Colors.black45, width: 1),
//           //           borderRadius: BorderRadius.circular(8),
//           //         ),
//           //         child: "0 د.ل".subtitle(color: Colors.black),
//           //       ),
//           //     ),
//           //   ],
//           // ),
//         ],
//       ).decorate(padding: 10),
//     );
//   }
// }
