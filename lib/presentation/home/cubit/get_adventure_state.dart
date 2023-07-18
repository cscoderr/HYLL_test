part of 'get_adventure_cubit.dart';

final class GetAdventureState extends Equatable {
  const GetAdventureState({
    this.status = AppStatus.initial,
    this.data,
    this.errorMessage = '',
    this.hasReachedMax = false,
  });

  GetAdventureState copyWith(
    AppStatus? status,
    AdventureResponse? data,
    String? errorMessage,
    bool? hasReachedMax,
  ) {
    return GetAdventureState(
      status: status ?? this.status,
      data: data,
      errorMessage: errorMessage ?? this.errorMessage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  final AppStatus status;
  final AdventureResponse? data;
  final String errorMessage;
  final bool hasReachedMax;

  @override
  List<Object?> get props => [status, data, errorMessage, hasReachedMax];
}
