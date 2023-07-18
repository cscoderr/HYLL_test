import 'package:hyll_test/data/data.dart';
import 'package:hyll_test/domain/domain.dart';

class HomeFailure implements Exception {
  const HomeFailure(this.message, this.stackTrace);

  final String message;
  final StackTrace stackTrace;
}

class GetAdventureFailure extends HomeFailure {
  GetAdventureFailure(super.message, super.stackTrace);
}

final class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({
    HomeRemoteDataSource? remoteDataSource,
  }) : _remoteDataSource = remoteDataSource ?? HomeRemoteDataSourceImpl();

  final HomeRemoteDataSource _remoteDataSource;

  @override
  Future<AdventureResponse> getAdventures({int? limit, int? offset}) async {
    try {
      final response =
          await _remoteDataSource.getAdventures(limit: limit, offset: offset);
      return response;
    } on HomeException {
      throw GetAdventureFailure(
          'Failed to load adventures', StackTrace.current);
    }
  }
}
