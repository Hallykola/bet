import "dart:async";

import 'package:bettingtips/api/api_response.dart';
import 'package:bettingtips/models/mycategorie.dart';
import 'package:bettingtips/models/category.dart';
import 'package:bettingtips/models/tip.dart';
import 'package:bettingtips/repositories/betcat_repo.dart';
import 'package:bettingtips/repositories/bettip_repo.dart';
import 'package:bettingtips/responses/cat_response.dart';
import 'package:bettingtips/responses/tip_response.dart';

class TipsBloc {
  StreamController _tipsController;
  StreamController _catsController;
  BettipRepository _bettiprepo;
  BetCatRepository _betcatrepo;

  TipsBloc() {
    _tipsController = StreamController<ApiResponse<List<Tip>>>();
    _catsController = StreamController<ApiResponse<List<Categorie>>>();
    _bettiprepo = new BettipRepository();
    _betcatrepo = new BetCatRepository();
    fetchTips();
    fetchCats();
  }
  StreamSink<ApiResponse<List<Tip>>> get tipssink => _tipsController.sink;
  Stream<ApiResponse<List<Tip>>> get tipsstream => _tipsController.stream;

  StreamSink<ApiResponse<List<Categorie>>> get catssink => _catsController.sink;
  Stream<ApiResponse<List<Categorie>>> get catsstream => _catsController.stream;

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

  fetchTagTips(String tag) async {
    tipssink.add(ApiResponse.loading('Fetching Betting Tips'));
    try {
      List<Tip> tips = await _bettiprepo.fetchSpecificTipCategory(tag);

      tipssink.add(ApiResponse.completed(tips));
    } catch (e) {
      String a = e.toString();
      tipssink.add(ApiResponse.error(a));
      print(e.toString());
    }
  }

  fetchCats() async {
    catssink.add(ApiResponse.loading('Fetching Tips Categories'));
    try {
      List<Categorie> cats = await _betcatrepo.fetchCatsList();

      catssink.add(ApiResponse.completed(cats));
    } catch (e) {
      String a = e.toString();
      catssink.add(ApiResponse.error(a));
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

  deleteCat(int id) async {
    catssink.add(ApiResponse.loading('deleting Category'));
    try {
      bool deleted = await _betcatrepo.deleteCat(id);
      if (deleted) {
        tipssink.add(ApiResponse.loading('Category Deleted'));
        fetchTips();
      } else {
        tipssink.add(ApiResponse.loading('Could not delete Category'));
      }
    } catch (e) {
      String a = e.toString();
      tipssink.add(ApiResponse.error(a));
      print(e.toString());
    }
  }

  addcat(Categorie cat) async {
    print('I am adding');
    catssink.add(ApiResponse.loading('Adding Category'));
    try {
      CatResponse add = await _betcatrepo.createCat(cat);
    } catch (e) {
      String a = e.toString();
      tipssink.add(ApiResponse.error(a));
      print(e.toString());
    }
  }

  editcat(int id, Categorie cat) async {
    print('I am editing');
    catssink.add(ApiResponse.loading('Editing Category'));
    try {
      bool edit = await _betcatrepo.editCat(id, cat);
      List<Categorie> cats = await _betcatrepo.fetchCatsList();
      catssink.add(ApiResponse.completed(cats));
    } catch (e) {
      String a = e.toString();
      tipssink.add(ApiResponse.error(a));
      print(e.toString());
    }
  }

  addtip(Tip tip) async {
    print('I am adding');
    tipssink.add(ApiResponse.loading('Adding Tip'));
    try {
      Tip add = await _bettiprepo.createTip(tip);
    } catch (e) {
      String a = e.toString();
      tipssink.add(ApiResponse.error(a));
      print(e.toString());
    }
  }

  edittip(int id, Tip tip) async {
    print('I am editing');
    tipssink.add(ApiResponse.loading('Editing Category'));
    try {
      bool edit = await _bettiprepo.editTip(id, tip);
      // List<Tip> tips = await _bettiprepo.fetchTipsList();
      // tipssink.add(ApiResponse.completed(tips));
    } catch (e) {
      String a = e.toString();
      tipssink.add(ApiResponse.error(a));
      print(e.toString());
    }
  }

  dispose() {
    _tipsController?.close();
    _catsController?.close();
  }
}
