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
      home: const Bar(),
    );
  }

}



class Bar extends StatefulWidget {
  const Bar({super.key});

  @override
  State<Bar> createState() => _BarState();
}

class _BarState extends State<Bar> {
  late FusionCharts _fusionChart2D;
  late FusionCharts _fusionChart3D;
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();



    Map<String, dynamic> chart = {
      "caption": "Countries With Most Oil Reserves [2017-18]",
      "subCaption": "In MMbbl = One Million barrels",
      "xAxisName": "Country",
      "yAxisName": "Reserves (MMbbl)",
      "numberSuffix": "K",
      "theme": "carbon",
    };
    FusionChartsController fusionChartsController = FusionChartsController();
    Map<String, dynamic> dataSource = {"chart": chart, "data": ChartData.chartData};
    fusionChartsController.addEvents([]);

    _fusionChart2D = FusionCharts(
        dataSource: dataSource,
        type: "bar2d",
        width: "100%",
        height: "100%",
        fusionChartEvent: (a, b) => {},
        fusionChartsController: fusionChartsController,
        );
    _fusionChart3D = FusionCharts(
        dataSource: dataSource,
        type: "bar3d",
        width: "100%",
        height: "100%",
        fusionChartEvent: (a, b) => {},
        fusionChartsController: fusionChartsController,
        );
  }

  void callBackFromPlugin(arg1, arg2) {
    print('Back to consumer: $arg1 , $arg2');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop()),
            title: const Text('Fusion Charts - Bar'),
          ),
          body: Column(
            children: [
              Expanded(child: _fusionChart2D),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Bar 2D'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(child: _fusionChart3D),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Bar 3D'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
      ),
    );
  }
}