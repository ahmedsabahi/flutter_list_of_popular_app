import 'dart:convert';

import 'package:list_of_popular/models/popular.dart';
import 'package:http/http.dart' as http;

class PopularService {
  Future<List<Result>> fetchPopular(int pageKey) async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/person/popular?api_key=6557d01ac95a807a036e5e9e325bb3f0&language=en-US&page=$pageKey');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return List<Result>.from((json.decode(response.body)["results"] as List)
          .map((e) => Result.fromJson(e))).toList();
    } else
      throw Exception(
          'Request (Popular List) failed with status: ${response.statusCode}.');
  }
}
