import 'package:dio/dio.dart';
import 'package:scoped_model/scoped_model.dart';

import '../constant.dart';

class DioProvide extends Model {
  String _categories = "加载中...";

  String get categories => _categories;

  void loadData() async {
    var dio = Dio();
    var response = await dio.get(url);
    var categories = response.data['category'];
    _categories = "";
    categories.forEach((it) => _categories += '$it\n');
    notifyListeners();
  }

}
