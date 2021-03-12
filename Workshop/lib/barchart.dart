import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:convert';

class BarGraph extends StatefulWidget {
  final Widget child;

  BarGraph({Key key, this.child}) : super(key: key);

  _BarGraphState createState() => _BarGraphState();
}

class _BarGraphState extends State<BarGraph> {
  List<charts.Series<LKAS, String>> seriesBarData;

  _generateData() async {
    final load =
    await DefaultAssetBundle.of(context).loadString("assets/data.json");

    var decoded = json.decode(load);
    List<LKAS> chartdata = [];
    for (var item in decoded) {
      chartdata.add(LKAS.fromJson(item));
    }

    seriesBarData.add(charts.Series(
        data: chartdata,
        //domainFn: (LKAS chartdata, _) => int.parse(chartdata.time),
        domainFn: (LKAS chartdata, _) => chartdata.time,
        measureFn: (LKAS chartdata, _) => int.parse(chartdata.distance),
        // measureFn: (LKAS chartdata, _) => chartdata.distance,
        id: 'Performance',
        labelAccessorFn: (LKAS chartdata, _) => '${chartdata.distance
            .toString()}'

    ));
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    seriesBarData = List<charts.Series<LKAS, String>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Center(child: Text('flutter charts')),
      ),
      body: Column(
        children: [
          Text(
            'Distance to Lane',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.0,
          ),
          if (seriesBarData.length > 0)
            Expanded(
              child: charts.BarChart(
                seriesBarData,
                animate: true,
                animationDuration: Duration(seconds: 5),
                barRendererDecorator: new charts.BarLabelDecorator<String>(),
                // domainAxis: new charts.OrdinalAxisSpec(
                //viewport: new charts.OrdinalViewport('AePS', 9),
                // ),
                behaviors: [
                  new charts.ChartTitle('Time,seconds',
                      behaviorPosition: charts.BehaviorPosition.bottom,
                      // titleStyleSpec: chartsCommon.TextStyleSpec(fontSize: 11),
                      titleOutsideJustification:
                      charts.OutsideJustification.middleDrawArea),
                  new charts.ChartTitle('Distance,Meter',
                      behaviorPosition: charts.BehaviorPosition.start,
                      // titleStyleSpec: chartsCommon.TextStyleSpec(fontSize: 11),
                      titleOutsideJustification:
                      charts.OutsideJustification.middleDrawArea),
                  // new charts.DatumLegend(),
                  // new charts.BarLabelDecorator<List>()
                ],
              ),
            )
          else
            Container(),
        ],
      ),
    );
  }
}

class LKAS {
  String time;
  String distance;

  LKAS(this.time, this.distance);

  LKAS.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    distance = json['distance'];
  }
}