import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CircularChartWidget extends StatelessWidget {
  const CircularChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.55,
      height: Get.width * 0.55,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SfCircularChart(
            series: <CircularSeries>[
              DoughnutSeries<_ChartData, String>(
                dataSource: [
                  _ChartData('Progress', 75),
                  _ChartData('Remaining', 25),
                ],
                xValueMapper: (_ChartData data, _) => data.label,
                yValueMapper: (_ChartData data, _) => data.value,
                pointColorMapper: (_ChartData data, _) =>
                    data.label == 'Progress'
                        ? Constants.success
                        : Constants.grey5,
                cornerStyle: CornerStyle.bothCurve,
                innerRadius: '80%',
                radius: '100%',
                dataLabelSettings: const DataLabelSettings(isVisible: false),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              '\$1000'.headline(color: Constants.success),
              const SizedBox(height: 5),
              'الرصيد'.body(),
            ],
          )
        ],
      ),
    );
  }
}

class _ChartData {
  final String label;
  final double value;

  _ChartData(this.label, this.value);
}
