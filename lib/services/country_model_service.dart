import 'dart:convert';
import 'package:stage_3/model/country_model.dart';
import 'package:stage_3/services/call_api.dart';

class CountryModelService {
  Future<CountryDataModel> getCountryData() async {
    var response = await CallApi().getData('/all');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return CountryDataModel.fromJson(data);
    }

    throw Exception(response.statusCode);
  }
}
