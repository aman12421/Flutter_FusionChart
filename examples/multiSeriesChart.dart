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
      home: const ColumnMultiSeries(),
    );
  }

}



class ColumnMultiSeries extends StatefulWidget {
  const ColumnMultiSeries({super.key});

  @override
  State<ColumnMultiSeries> createState() => _ColumnMultiSeriesState();
}

class _ColumnMultiSeriesState extends State<ColumnMultiSeries> {
  late FusionCharts _fusionChart2d;
  late FusionCharts _fusionChart3d;
  FusionChartsController fusionChartsController = FusionChartsController();
  // late final FusionChartsController _fusionChartsController =
  // FusionChartsController();
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();

    List<dynamic> categories = [
      {
        "category": [
          {"label": "Q1"},
          {"label": "Q2"},
          {"label": "Q3"},
          {"label": "Q4"}
        ]
      }
    ];
    // Construct the dataset comprising multiple series
    List<dynamic> dataset = [
      {
        "seriesname": "Previous Year",
        "data": [
          {"value": "12000"},
          {"value": "10500"},
          {"value": "23500"},
          {"value": "16000"}
        ]
      },
      {
        "seriesname": "Current Year",
        "data": [
          {"value": "24400"},
          {"value": "29800"},
          {"value": "20800"},
          {"value": "26800"}
        ]
      }
    ];

    Map<String, dynamic> chart = {
      "theme": "candy",
      "caption": "Comparison of Quarterly Sales",
      "xAxisname": "Quarter",
      "yAxisName": "Sales",
      "baseFontSize": "50px",
      "captionFontSize": "50px",
      "yAxisValueFontSize": "30px",
      "xAxisValueFontSize": "30px",
      "XAxisNameFontSize": "30px",
      "YAxisNameFontSize": "30px",
      "valueFontSize": "30px",
      "showLegend": "1",
      "legendIconScale": "3",
      "legendItemFontSize": "30"
    };

    Map<String, dynamic> dataSource = {
      "chart": chart,
      "dataset": dataset,
      "categories": categories
    };

    _fusionChart2d = FusionCharts(
        dataSource: dataSource,
        type: "mscolumn2d",
        width: "100%",
        height: "100%",
        fusionChartsController: fusionChartsController,
        );
    _fusionChart3d = FusionCharts(
        dataSource: dataSource,
        type: "mscolumn3d",
        width: "100%",
        height: "100%",
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
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back)),
          title: const Text('Fusion Charts - Column MultiSeries'),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(child: _fusionChart2d),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Column2D'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(child: _fusionChart3d),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Column3D'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}