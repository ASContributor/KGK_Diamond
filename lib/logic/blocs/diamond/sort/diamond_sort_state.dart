part of 'diamond_sort_bloc.dart';

class DiamondSortState extends Equatable {
  final SortCriteria criteria;
  final SortDirection direction;
  final List<Diamond> sortedDiamonds;

  const DiamondSortState({
    this.criteria = SortCriteria.finalPrice,
    this.direction = SortDirection.ascending,
    this.sortedDiamonds = const [],
  });

  @override
  List<Object?> get props => [criteria, direction, sortedDiamonds];

  DiamondSortState copyWith({
    SortCriteria? criteria,
    SortDirection? direction,
    List<Diamond>? sortedDiamonds,
  }) {
    return DiamondSortState(
      criteria: criteria ?? this.criteria,
      direction: direction ?? this.direction,
      sortedDiamonds: sortedDiamonds ?? this.sortedDiamonds,
    );
  }
}
