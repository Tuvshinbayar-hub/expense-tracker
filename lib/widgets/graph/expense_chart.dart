import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:expense_tracker/models/expense_bucket.dart';
// import 'package:fl_chart_app/presentation';

class ExpenseChart extends StatefulWidget {
  const ExpenseChart({super.key, required this.expenses});
  final List<Expense> expenses;

  @override
  State<ExpenseChart> createState() {
    return _ExpenseChart();
  }
}

class _ExpenseChart extends State<ExpenseChart> {
  int touchedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: AspectRatio(
          aspectRatio: 1.3,
          child: AspectRatio(
            aspectRatio: 1,
            child: PieChart(
              PieChartData(
                borderData: FlBorderData(
                    // show: false
                    ),
                // sectionsSpace: 0,
                sections: showingSections(),
              ),
            ),
          )),
    );
  }

  // this should be generated dynamically
  // also should be badger if possible

  List<PieChartSectionData> showingSections() {
    var expenses = widget.expenses;
    var expenseBucket = ExpenseBucket(expenses: widget.expenses);

    return List.generate(expenseBucket.totalCategoryCount, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      final widgetSize = isTouched ? 55.0 : 40.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      return PieChartSectionData(
        color: expenses[i].color,
        value: expenseBucket.getPercentByCategory(expenses[i].category),
        // title: expenses[i].category.name,
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: const Color(0xffffffff),
          shadows: shadows,
        ),
        // badgeWidget: _Badge(
        //   'assets/icons/librarian-svgrepo-com.svg',
        //   size: widgetSize,
        //   borderColor: AppColors.contentColorBlack,
        // ),
        badgeWidget: Text(expenses[i].category.name),
        badgePositionPercentageOffset: 1.2,
      );

      switch (i) {
        case 0:
          return PieChartSectionData(
            // color: AppColors.contentColorBlue,
            color: Colors.purple,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            // badgeWidget: _Badge(
            //   'assets/icons/ophthalmology-svgrepo-com.svg',
            //   size: widgetSize,
            //   borderColor: AppColors.contentColorBlack,
            // ),
            badgePositionPercentageOffset: .98,
          );
        case 1:
          return PieChartSectionData(
            // color: AppColors.contentColorYellow,
            color: Colors.redAccent,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            // badgeWidget: _Badge(
            //   'assets/icons/librarian-svgrepo-com.svg',
            //   size: widgetSize,
            //   borderColor: AppColors.contentColorBlack,
            // ),
            badgePositionPercentageOffset: .98,
          );
        case 2:
          return PieChartSectionData(
            // color: AppColors.contentColorPurple,
            color: Colors.amber,
            value: 16,
            title: '16%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            // badgeWidget: _Badge(
            //   'assets/icons/fitness-svgrepo-com.svg',
            //   size: widgetSize,
            //   borderColor: AppColors.contentColorBlack,
            // ),
            badgePositionPercentageOffset: .98,
          );
        case 3:
          return PieChartSectionData(
            // color: AppColors.contentColorGreen,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            // badgeWidget: _Badge(
            //   'assets/icons/worker-svgrepo-com.svg',
            //   size: widgetSize,
            //   borderColor: AppColors.contentColorBlack,
            // ),
            badgePositionPercentageOffset: .98,
          );
        default:
          throw Exception('Oh no');
      }
    });
  }
}
