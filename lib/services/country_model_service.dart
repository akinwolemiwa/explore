import 'dart:convert';
import 'package:stage_3/model/country_model.dart';
import 'package:stage_3/services/call_api.dart';

class CountryModelService {
  Future<CountryModel> getCountyData() async {
    var response = await CallApi().getData('/all');

    if (response.statusCode == 200) {
      final datas = json.decode(response.body);
      return CountryModel.fromJson(datas);
    }

    throw '';
  }
}
