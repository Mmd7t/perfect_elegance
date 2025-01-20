import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/modules/main/controllers/main_controller.dart';
import 'package:perfect_elegance/app/modules/main/widgets/analysis_card.dart';
import 'package:perfect_elegance/app/modules/main/widgets/circular_chart_widget.dart';
import 'package:perfect_elegance/app/modules/main/widgets/home_appbar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeView extends GetView<MainController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      appBar: HomeAppbar(),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (controller.homeModel.value.newOrders == null) {
            return const Center(child: Text('لا يوجد بيانات'));
          } else {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "الرئيسية".body(),
                        const SizedBox(width: 12),
                        IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: Get.theme.primaryColor,
                          ),
                          onPressed: () {},
                          icon: "candle".iconColored(size: 20),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: Get.width,
                          child: "التحليلات".titleSmall(),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: AnalysisCard(
                                color: Constants.primary,
                                icon: "new-orders",
                                title: "الطلبات الجديدة",
                                number: controller.homeModel.value.newOrders
                                    .toString(),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: AnalysisCard(
                                color: Constants.success,
                                icon: "hourglass",
                                title: "الطلبات القائمة",
                                number: controller.homeModel.value.ongoingOrders
                                    .toString(),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              child: AnalysisCard(
                                color: Constants.pending,
                                icon: "pending-orders",
                                title: "الطلبات المعلقة",
                                number: controller
                                    .homeModel.value.pendingOrdersCount
                                    .toString(),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: AnalysisCard(
                                color: Constants.cancel,
                                icon: "cart",
                                title: "الطلبات قيد التسوية",
                                number: controller.homeModel.value
                                    .underSattelmentProductOrders
                                    .toString(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: Get.width,
                          child: "ارصده المتجر".titleSmall(),
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: CircularChartWidget(
                            balance: controller.homeModel.value.storeBalance!,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: Get.width,
                          child: "التقارير".titleSmall(),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          width: Get.width,
                          child: Row(
                            children: [
                              "مقابل الاسبوع الماضي".bodyMedium(),
                              const SizedBox(width: 5),
                              "2.1%  ".bodyMedium(
                                color: Constants.cancel,
                                weight: FontWeight.bold,
                              ),
                              "Arrow Down".iconColored(size: 15),
                              const SizedBox(width: 5),
                              "3k".title(),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Center(child: LineChartWidget()),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        }
      }),
    );
  }
}

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_SalesData> chartData = [
      _SalesData('01', 2),
      _SalesData('02', 0),
      _SalesData('03', 0),
      _SalesData('04', 0),
      _SalesData('05', 0),
      _SalesData('06', 0),
      _SalesData('07', 0),
      _SalesData('08', 0),
      _SalesData('09', 0),
      _SalesData('10', 0),
      _SalesData('11', 0),
      _SalesData('12', 0),
    ];

    return SfCartesianChart(
      primaryXAxis: const CategoryAxis(
        borderColor: Constants.grey5,
        axisLine: AxisLine(color: Constants.grey5),
      ),
      primaryYAxis: const NumericAxis(
        labelFormat: '{value}k',
        axisLine: AxisLine(color: Constants.grey5),
        interval: 1,
        minimum: 0,
        maximum: 4,
        borderColor: Constants.grey5,
      ),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <CartesianSeries>[
        SplineSeries<_SalesData, String>(
          dataSource: chartData,
          xValueMapper: (_SalesData data, _) => data.month,
          yValueMapper: (_SalesData data, _) => data.sales,
          markerSettings: const MarkerSettings(isVisible: true),
          enableTooltip: true,
          color: Constants.primary,
          width: 4,
        ),
      ],
    );
  }
}

class _SalesData {
  final String month;
  final double sales;

  _SalesData(this.month, this.sales);
}
