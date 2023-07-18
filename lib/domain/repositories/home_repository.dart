import 'package:hyll_test/data/data.dart';

abstract class HomeRepository {
  Future<AdventureResponse> getAdventures({int? limit, int? offset});
}
