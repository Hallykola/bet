import "dart:async";

import 'package:bettingtips/api/api_response.dart';
import 'package:bettingtips/models/tip.dart';
import 'package:bettingtips/repositories/bettip_repo.dart';

class TipsBloc {
  StreamController _tipsController;
  BettipRepository _bettiprepo;

  TipsBloc() {
    _tipsController = StreamController<ApiResponse<List<Tip>>>();
    _bettiprepo = new BettipRepository();
    fetchTips();
  }
  StreamSink<ApiResponse<List<Tip>>> get tipssink => _tipsController.sink;
  Stream<ApiResponse<List<Tip>>> get tipsstream => _tipsController.stream;

  fetchTips() async {
    tipssink.add(ApiResponse.loading('Fetching Betting Tips'));
    try {
      List<Tip> tips = await _bettiprepo.fetchTipsList();

      tipssink.add(ApiResponse.completed(tips));
    } catch (e) {
      String a = e.toString();
      tipssink.add(ApiResponse.error(a));
      print(e.toString());
    }
  }

  deleteTip(int id) async {
    tipssink.add(ApiResponse.loading('deleting Betting Tip'));
    try {
      bool deleted = await _bettiprepo.deleteTip(id);
      if (deleted) {
        tipssink.add(ApiResponse.loading('Betting Tip Deleted'));
        fetchTips();
      } else {
        tipssink.add(ApiResponse.loading('Could not delete betting tip'));
      }
    } catch (e) {
      String a = e.toString();
      tipssink.add(ApiResponse.error(a));
      print(e.toString());
    }
  }

  dispose() {
    _tipsController?.close();
  }
}
