import 'package:bettingtips/models/tip.dart';

class TipResponse {
  int totalResults;
  List<Tip> results;

  TipResponse.fromJson(Map<String, dynamic> json) {
    if (json['records'] != null) {
      results = new List<Tip>();
      json['records'].forEach((v) {
        results.add(new Tip.fromJson(v));
      });
      totalResults = results.length;
      print(totalResults.toString());
    } else {
      print('result is empty');
    }
  }
}
