import 'package:hyll_test/core/core.dart';
import 'package:hyll_test/data/data.dart';
import 'package:hyll_test/domain/repositories/home_repository.dart';

class GetAdventureUsecase
    extends Usecases<AdventureResponse, GetAdventureParams> {
  GetAdventureUsecase(this.repository);
  final HomeRepository repository;
  @override
  Future<AdventureResponse> call(GetAdventureParams params) {
    return repository.getAdventures(
      limit: params.limit,
      offset: params.offset,
    );
  }
}

class GetAdventureParams {
  GetAdventureParams({this.offset, this.limit});
  final int? offset;
  final int? limit;
}
