import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:hyll_test/data/data.dart';

class HomeException implements Exception {
  HomeException(this.message);
  final String message;

  @override
  String toString() {
    return message;
  }
}

final class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  HomeRemoteDataSourceImpl({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;
  @override
  Future<AdventureResponse> getAdventures({int? limit, int? offset}) async {
    final response = await _httpClient.get(
      Uri.parse('https://api.hyll.com/api/adventures/').replace(
        queryParameters: {
          'limit': (limit ?? 20).toString(),
          'offset': (offset ?? 0).toString(),
        },
      ),
    );
    print(response.body);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      return AdventureResponse.fromJson(body);
    } else {
      throw HomeException('Failed to load adventures');
    }
  }
}
