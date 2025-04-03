import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:diamond_catalog/data/models/diamond.dart';

part 'diamond_sort_event.dart';
part 'diamond_sort_state.dart';

class DiamondSortBloc extends Bloc<DiamondSortEvent, DiamondSortState> {
  DiamondSortBloc() : super(const DiamondSortState()) {
    on<SortCriteriaChanged>(_onSortCriteriaChanged);
    on<SortDirectionChanged>(_onSortDirectionChanged);
    on<SortApplied>(_onSortApplied);
  }

  void _onSortCriteriaChanged(
      SortCriteriaChanged event, Emitter<DiamondSortState> emit) {
    emit(state.copyWith(criteria: event.criteria));
  }

  void _onSortDirectionChanged(
      SortDirectionChanged event, Emitter<DiamondSortState> emit) {
    emit(state.copyWith(direction: event.direction));
  }

  void _onSortApplied(SortApplied event, Emitter<DiamondSortState> emit) {
    List<Diamond> sortedList = List.from(event.diamonds);

    switch (state.criteria) {
      case SortCriteria.finalPrice:
        if (state.direction == SortDirection.ascending) {
          sortedList.sort((a, b) => a.finalAmount.compareTo(b.finalAmount));
        } else {
          sortedList.sort((a, b) => b.finalAmount.compareTo(a.finalAmount));
        }
        break;
      case SortCriteria.caratWeight:
        if (state.direction == SortDirection.ascending) {
          sortedList.sort((a, b) => a.carat.compareTo(b.carat));
        } else {
          sortedList.sort((a, b) => b.carat.compareTo(a.carat));
        }
        break;
    }

    emit(state.copyWith(sortedDiamonds: sortedList));
  }
}
