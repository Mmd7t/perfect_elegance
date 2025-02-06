import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/enums/enums.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/data/models/all_orders_model/datum.dart';
import 'package:perfect_elegance/app/modules/requests/controllers/requests_controller.dart';

class RequestsFilterButton extends GetWidget<RequestsController> {
  const RequestsFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 0,
          child: ListTile(
            title: "الحالة".bodyMedium(color: Constants.grey2),
          ),
          onTap: () {
            showMenu(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 6,
              position: const RelativeRect.fromLTRB(20, 140, 150, 0),
              items: [
                PopupMenuItem(
                  value: 'all',
                  child: ListTile(
                      title: "الكل".bodyMedium(color: Constants.grey2)),
                  onTap: () {
                    controller.orderStatusSearch.value = OrderStatusSearch.init;
                    controller.orders.value = <OrderDatum>[];
                    controller.ordersCurrentPage.value = 1;
                    controller.ordersLastPage.value = 1;
                    controller.getOrders();
                  },
                ),
                PopupMenuItem(
                  value: 'new',
                  child: ListTile(
                      title: "جديد".bodyMedium(color: Constants.grey2)),
                  onTap: () {
                    controller.orderStatusSearch.value = OrderStatusSearch.new1;
                    controller.orders.value = <OrderDatum>[];
                    controller.ordersCurrentPage.value = 1;
                    controller.ordersLastPage.value = 1;
                    controller.getOrders();
                  },
                ),
                PopupMenuItem(
                  value: 'ongoing',
                  child: ListTile(
                      title: "قائمة".bodyMedium(color: Constants.grey2)),
                  onTap: () {
                    controller.orderStatusSearch.value =
                        OrderStatusSearch.onGoing;
                    controller.orders.value = <OrderDatum>[];
                    controller.ordersCurrentPage.value = 1;
                    controller.ordersLastPage.value = 1;
                    controller.getOrders();
                  },
                ),
                PopupMenuItem(
                  value: 'canceled',
                  child: ListTile(
                      title: "ملغية".bodyMedium(color: Constants.grey2)),
                  onTap: () {
                    controller.orderStatusSearch.value =
                        OrderStatusSearch.canceled;
                    controller.orders.value = <OrderDatum>[];
                    controller.ordersCurrentPage.value = 1;
                    controller.ordersLastPage.value = 1;
                    controller.getOrders();
                  },
                ),
                PopupMenuItem(
                  value: 'completed',
                  child: ListTile(
                      title: "مكتملة".bodyMedium(color: Constants.grey2)),
                  onTap: () {
                    controller.orderStatusSearch.value =
                        OrderStatusSearch.complete;
                    controller.orders.value = <OrderDatum>[];
                    controller.ordersCurrentPage.value = 1;
                    controller.ordersLastPage.value = 1;
                    controller.getOrders();
                  },
                ),
                PopupMenuItem(
                  value: 'pendingDelivery',
                  child: ListTile(
                      title: "قيد التوصيل".bodyMedium(color: Constants.grey2)),
                  onTap: () {
                    controller.orderStatusSearch.value =
                        OrderStatusSearch.pendingDelivery;
                    controller.orders.value = <OrderDatum>[];
                    controller.ordersCurrentPage.value = 1;
                    controller.ordersLastPage.value = 1;
                    controller.getOrders();
                  },
                ),
              ],
            );
          },
        ),
        PopupMenuItem(
          value: 1,
          child: ListTile(
            title: "التاريخ".bodyMedium(color: Constants.grey2),
          ),
          onTap: () {
            showDatePicker(
              context: context,
              locale: const Locale("ar", "LY"),
              initialDate: DateTime.now(),
              firstDate: DateTime(2005),
              lastDate: DateTime.now(),
            ).then((value) {
              if (value != null) {
                controller.orderFromDateSearch.value = value.toString();
                showDatePicker(
                  context: context,
                  locale: const Locale("ar", "LY"),
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2005),
                  lastDate: DateTime.now(),
                ).then((value) {
                  if (value != null) {
                    controller.orderToDateSearch.value = value.toString();
                    controller.orders.value = <OrderDatum>[];
                    controller.ordersCurrentPage.value = 1;
                    controller.ordersLastPage.value = 1;
                    controller.getOrders();
                  }
                });
              }
            });
          },
        ),
      ],
      splashRadius: 18,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 6,
      shadowColor: Constants.grey4.withValues(alpha: 0.5),
      position: PopupMenuPosition.under,
      constraints: const BoxConstraints(
        minWidth: 180,
      ),
      child: Container(
        height: 45,
        width: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Get.theme.primaryColor,
          shape: BoxShape.circle,
        ),
        child: "candle".iconColored(size: 20),
      ),
    );
  }
}
