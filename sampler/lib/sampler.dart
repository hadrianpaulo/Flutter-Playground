import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Sampler extends StatefulWidget {
  @override
  _SamplerState createState() => _SamplerState();
}

class _SamplerState extends State<Sampler> {
  String result = 'No Samples Yet!';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(result),
          RaisedButton(
            child: Text('Sample!'),
            onPressed: _generateSample,
          )
        ],
      ),
    );
  }

  Future<void> _generateSample() async {
    var _samples = await compute(sampleDistributionHelper, {
      'strings': ['a', 'b'],
      'probaDistribution': [0.4, 0.6],
      'numSamples': 100000
    });
    setState(() {
      result = json.encode(_samples);
    });
  }
}

Map<Symbol, dynamic> symbolizeKeys(Map<String, dynamic> map) {
  final result = new Map<Symbol, dynamic>();
  map.forEach((String k, v) {
    result[new Symbol(k)] = v;
  });
  return result;
}

Map<String, int> sampleDistributionHelper(Map<String, Object> params) {
  final paramsConverted = symbolizeKeys(params);

  return Function.apply(sampleDistribution, [], paramsConverted);
}

Map<String, int> sampleDistribution(  
    {List<String> strings, List<double> probaDistribution, int numSamples}) {
  assert(strings.length == probaDistribution.length);
  assert(probaDistribution.reduce((a, b) => a + b) == 1.0);

  List<double> cdf = [];
  List<double> probas = generateUniformProbas(numSamples: numSamples);
  Map<String, int> result =
      Map.fromIterable(strings, key: (s) => s, value: (s) => 0);

  double tmp = 0;
  for (double i in probaDistribution) {
    tmp += i;
    cdf.add(tmp);
  }

  for (double proba in probas) {
    var stringIndex = cdf.indexWhere((p) => p > proba);
    var selectedString = strings[stringIndex];

    result[selectedString] = result[selectedString] + 1;
  }

  return result;
}

List<double> generateUniformProbas({int numSamples = 1}) {
  var randomGenerator = new Random();
  List<double> result = [];
  for (int i = 0; i < numSamples; i++) {
    result.add(randomGenerator.nextDouble());
  }

  return result;
}
