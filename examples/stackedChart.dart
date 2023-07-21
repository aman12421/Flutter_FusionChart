import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_fusioncharts/flutter_fusioncharts.dart';
import '../button.dart';
import '../chartdata.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StackedBar(),
    );
  }

}



class StackedBar extends StatefulWidget {
  const StackedBar({super.key});

  @override
  State<StackedBar> createState() => _StackedBarState();
}

class _StackedBarState extends State<StackedBar> {
  late FusionCharts _fusionChart2D;
  late FusionCharts _fusionChart3D;

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();

    Map<String, dynamic> chart = {
      "caption": "Product-wise quarterly revenue in current year",
      "subCaption": "Harry's SuperMart",
      "xAxisname": "Quarter",
      "yAxisName": "Revenue (In USD)",
      "numberPrefix": "\$",
      "theme": "umber",
      
    };

    FusionChartsController fusionChartsController = FusionChartsController();
    Map<String, dynamic> dataSource = {
      "chart": chart,
      "dataset": ChartData.chartData3,
      "categories": [
        {
          "category": [
            {"label": "Q1"},
            {"label": "Q2"},
            {"label": "Q3"},
            {"label": "Q4"}
          ]
        }
      ]
    };
    fusionChartsController.addEvents([]);

    _fusionChart2D = FusionCharts(
        dataSource: dataSource,
        type: "stackedbar2d",
        width: "100%",
        height: "100%",
        fusionChartEvent: (a, b) => {},
        fusionChartsController: fusionChartsController,
        );
    _fusionChart3D = FusionCharts(
        dataSource: dataSource,
        type: "stackedbar3d",
        width: "100%",
        height: "100%",
        fusionChartEvent: (a, b) => {},
        fusionChartsController: fusionChartsController,
        );
  }

  void callBackFromPlugin(arg1, arg2) {
    if (kDebugMode) {
      print('Back to consumer: $arg1 , $arg2');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop()),
        title: const Text('Fusion Charts - Stacked Bar'),
      ),
      body: Column(
        children: [
          Expanded(child: _fusionChart2D),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Stacked Bar2D'),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(child: _fusionChart3D),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Stacked Bar3D'),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}