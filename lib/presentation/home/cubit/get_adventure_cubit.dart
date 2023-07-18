import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hyll_test/core/core.dart';
import 'package:hyll_test/data/data.dart';
import 'package:hyll_test/domain/domain.dart';

part 'get_adventure_state.dart';

class GetAdventureCubit extends Cubit<GetAdventureState> {
  GetAdventureCubit({required GetAdventureUsecase getAdventureUsecase})
      : _getAdventureUsecase = getAdventureUsecase,
        super(const GetAdventureState());

  final GetAdventureUsecase _getAdventureUsecase;

  Future<void> getAdventures({int offset = 0, bool isRefresh = false}) async {
    try {
      final response = await _getAdventureUsecase(
          GetAdventureParams(limit: AppConstants.appFeedLimit, offset: offset));
      final resData = response.adventures ?? [];
      final hasReachedMax = resData.length < AppConstants.appFeedLimit;
      final currentData = state.data?.adventures ?? [];
      final adventures = <AdventureModel>[...currentData, ...resData];
      final data =
          isRefresh ? response : response.copyWith(adventures: adventures);
      emit(
        GetAdventureState(
          status: AppStatus.success,
          data: data,
          hasReachedMax: hasReachedMax,
        ),
      );
    } on GetAdventureFailure catch (e) {
      emit(
        GetAdventureState(
          status: AppStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
