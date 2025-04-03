part of 'diamond_sort_bloc.dart';

// Sort Criteria
enum SortCriteria { finalPrice, caratWeight }

// Sort Direction
enum SortDirection { ascending, descending }

// Sort Events
abstract class DiamondSortEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SortCriteriaChanged extends DiamondSortEvent {
  final SortCriteria criteria;

  SortCriteriaChanged(this.criteria);

  @override
  List<Object?> get props => [criteria];
}

class SortDirectionChanged extends DiamondSortEvent {
  final SortDirection direction;

  SortDirectionChanged(this.direction);

  @override
  List<Object?> get props => [direction];
}

class SortApplied extends DiamondSortEvent {
  final List<Diamond> diamonds;

  SortApplied(this.diamonds);

  @override
  List<Object?> get props => [diamonds];
}
