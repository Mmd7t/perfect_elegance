import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CircularChartWidget extends StatelessWidget {
  final double balance;
  const CircularChartWidget({
    super.key,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.58,
      height: Get.width * 0.58,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.rotate(
            angle: pi * 1.15,
            child: SfCircularChart(
              series: <CircularSeries>[
                DoughnutSeries<_ChartData, String>(
                  dataSource: [
                    _ChartData('Progress', 85),
                    _ChartData('Remaining', 15),
                  ],
                  xValueMapper: (_ChartData data, _) => data.label,
                  yValueMapper: (_ChartData data, _) => data.value,
                  pointColorMapper: (_ChartData data, _) =>
                      data.label == 'Progress'
                          ? balance.isNegative
                              ? Constants.cancel
                              : Constants.success
                          : Constants.grey5,
                  cornerStyle: CornerStyle.bothCurve,
                  innerRadius: '85%',
                  radius: '100%',
                  dataLabelSettings: const DataLabelSettings(isVisible: false),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Directionality(
                textDirection: TextDirection.ltr,
                child: '$balance د.ل'.headline(
                    color: balance.isNegative
                        ? Constants.cancel
                        : Constants.success),
              ),
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
