import 'package:flutter/material.dart';
import 'package:pharus/constant/colors.dart';
import 'package:pharus/ui/screens/recommend_Career.dart';
import 'package:pharus/ui/widgets/buttons.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Result extends StatefulWidget {
  static const id = 'Result';

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  List<ExpenseData> _chartData;
  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   flexibleSpace: Center(
      //     child: Image.asset(
      //       'images/logo.png',
      //       height: 120,
      //       width: 120,
      //     ),
      //   ),
      //   backgroundColor: Colors.white12,
      //   elevation: 0,
      // ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Center(
              //   child: Image.asset(
              //     'images/logo.png',
              //     height: MediaQuery.of(context).size.height * .13,
              //     width: MediaQuery.of(context).size.height * .15,
              //   ),
              // ),
              const Text(
                "here you'll find your interests profiler result:",
                style: TextStyle(fontSize: 19),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .35,
                child: SfCartesianChart(
                    borderColor: border,
                    borderWidth: 2,
                    plotAreaBorderColor: border,
                    primaryXAxis: CategoryAxis(),
                    series: <ChartSeries<ExpenseData, String>>[
                      ColumnSeries<ExpenseData, String>(
                          color: bottom,
                          dataSource: _chartData,
                          xValueMapper: (ExpenseData sales, _) =>
                              sales.expenseCategory,
                          yValueMapper: (ExpenseData sales, _) => sales.result)
                    ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: text('Realistic', '17'),
                color: circle,
                height: 50,
              ),
              Container(
                child: text('Investigative', '16'),
                color: circle,
                height: 50,
              ),
              Container(
                child: text('Artistic', '13'),
                height: 50,
              ),
              Container(
                child: text('Social', '11'),
                height: 50,
              ),
              Container(
                child: text('Enterprising', '13'),
                height: 50,
              ),
              Container(
                child: text('Conventional', '19'),
                color: circle,
                height: 50,
              ),
              const SizedBox(
                height: 20,
              ),
              buttons(Colors.white, bottom, 'NEXT !', () {
                setState(() {
                  Navigator.pushNamed(context, RecommendCareer.id);
                });
              }),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      )),
    );
  }

  Row text(String word, String num) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Text(
            word,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(num,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
        )
      ],
    );
  }

  List<ExpenseData> getChartData() {
    final List<ExpenseData> chartData = [
      ExpenseData('R', 17),
      ExpenseData('I', 16),
      ExpenseData('A', 13),
      ExpenseData('S', 11),
      ExpenseData('E', 13),
      ExpenseData('C', 19),
    ];
    return chartData;
  }
}

class ExpenseData {
  ExpenseData(this.expenseCategory, this.result);
  final String expenseCategory;
  final num result;
}
