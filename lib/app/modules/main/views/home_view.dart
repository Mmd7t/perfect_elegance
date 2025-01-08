import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/modules/main/widgets/analysis_card.dart';
import 'package:perfect_elegance/app/modules/main/widgets/circular_chart_widget.dart';
import 'package:perfect_elegance/app/modules/main/widgets/home_appbar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      appBar: HomeAppbar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                  const Row(
                    children: [
                      Expanded(
                        child: AnalysisCard(
                          color: Constants.primary,
                          icon: "new-orders",
                          title: "الطلبات الجديدة",
                          number: "10",
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: AnalysisCard(
                          color: Constants.success,
                          icon: "hourglass",
                          title: "الطلبات القائمة",
                          number: "10",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Row(
                    children: [
                      Expanded(
                        child: AnalysisCard(
                          color: Constants.pending,
                          icon: "pending-orders",
                          title: "الطلبات المعلقة",
                          number: "10",
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: AnalysisCard(
                          color: Constants.cancel,
                          icon: "cart",
                          title: "الطلبات قيد التسوية",
                          number: "10",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                  const Center(child: CircularChartWidget()),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
      ),
    );
  }
}

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_SalesData> chartData = [
      _SalesData('01', 1.5),
      _SalesData('02', 2.8),
      _SalesData('03', 2),
      _SalesData('04', 1.5),
      _SalesData('05', 3),
      _SalesData('06', 2.7),
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
