import 'package:flutter/material.dart';
import 'package:flutter_fusioncharts/flutter_fusioncharts.dart';

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
      home: const ColumnChart(),
    );
  }
  }

class ColumnChart extends StatefulWidget {
  const ColumnChart({super.key});

  @override
  State<ColumnChart> createState() => _ColumnChartState();
}

class _ColumnChartState extends State<ColumnChart> {
  late FusionCharts _fusionChart2D;
 // FusionChartsController fusionChartsController = FusionChartsController();

  @override
  void initState() {
    super.initState();
    
    Map<String, dynamic> chart = {
      "caption": "Countries",
      //"subCaption": "In MMbbl = One Million barrels",
     // "logoURL": "https://static.fusioncharts.com/sampledata/images/Logo-HM-72x72.png",
      //"logoAlpha": "100",
      //"logoScale": "110",
      //"logoPosition": "TL",
      "xAxisName": "Country",
      "yAxisName": "Reserves (MMbbl)",
      "numberSuffix": "K",
      "theme": "carbon"
    };
   
    List<dynamic> chartData = [
      {"label": "Venezuela", "value": "290"},
      {"label": "Saudi", "value": "260"},
      {"label": "Canada", "value": "180"},
      {"label": "Iran", "value": "140"},
      {"label": "Russia", "value": "115"},
      {"label": "UAE", "value": "100"},
      {"label": "US", "value": "30"},
      {"label": "China", "value": "30"}
    ];

  
    Map<String, dynamic> dataSource = {"chart": chart, "data": chartData};

    _fusionChart2D = FusionCharts(
        dataSource: dataSource, 
        type: "column2d", 
        width: "100%", 
        height: "400", 
        events: const ['chartClick']        
        );
      }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop()),
			title: const Text('Flutter Fusion Charts - Column'),
      ),
      body: SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          child: _fusionChart2D),
    );
  }


}
