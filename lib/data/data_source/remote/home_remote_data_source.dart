import 'package:hyll_test/data/data.dart';

abstract class HomeRemoteDataSource {
  Future<AdventureResponse> getAdventures({int? limit, int? offset});
}
