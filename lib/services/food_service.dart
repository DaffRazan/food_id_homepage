import 'dart:developer';

import 'package:food_id_homepage/models/food_response.dart';
import 'package:food_id_homepage/utils/urls.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FoodService {
  Future<dynamic> getFoodData() async {
    FoodResponse foodResponse;

    String url = apiLink;

    var response = await http
        .get(Uri.parse(url), headers: {"Content-Type": "application/json"});

    int statusCode = response.statusCode;

    final bodyResponse = json.decode(response.body);

    if (statusCode == 200) {
      foodResponse = FoodResponse.fromJson(bodyResponse);
      return foodResponse;
    } else {
      log("unable to get data.");
    }
  }
}
