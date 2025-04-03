import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:diamond_catalog/data/models/diamond.dart';
import 'package:diamond_catalog/data/data.dart';

part 'diamond_filter_event.dart';
part 'diamond_filter_state.dart';

class DiamondFilterBloc extends Bloc<DiamondFilterEvent, DiamondFilterState> {
  DiamondFilterBloc() : super(const DiamondFilterState()) {
    on<CaratRangeChanged>(_onCaratRangeChanged);
    on<LabChanged>(_onLabChanged);
    on<ShapeChanged>(_onShapeChanged);
    on<ColorChanged>(_onColorChanged);
    on<ClarityChanged>(_onClarityChanged);
    on<FilterApplied>(_onFilterApplied);
    on<FilterReset>(_onFilterReset);
  }

  void _onCaratRangeChanged(
      CaratRangeChanged event, Emitter<DiamondFilterState> emit) {
    emit(state.copyWith(
      minCarat: event.minCarat,
      maxCarat: event.maxCarat,
    ));
  }

  void _onLabChanged(LabChanged event, Emitter<DiamondFilterState> emit) {
    emit(state.copyWith(lab: event.lab));
  }

  void _onShapeChanged(ShapeChanged event, Emitter<DiamondFilterState> emit) {
    emit(state.copyWith(shape: event.shape));
  }

  void _onColorChanged(ColorChanged event, Emitter<DiamondFilterState> emit) {
    emit(state.copyWith(color: event.color));
  }

  void _onClarityChanged(
      ClarityChanged event, Emitter<DiamondFilterState> emit) {
    emit(state.copyWith(clarity: event.clarity));
  }

  void _onFilterApplied(FilterApplied event, Emitter<DiamondFilterState> emit) {
    List<Diamond> result = DiamondData.diamonds;

    // Apply carat range filter
    if (state.minCarat != null) {
      result = result.where((d) => d.carat >= state.minCarat!).toList();
    }
    if (state.maxCarat != null) {
      result = result.where((d) => d.carat <= state.maxCarat!).toList();
    }

    // Apply lab filter
    if (state.lab != null && state.lab!.isNotEmpty) {
      result = result.where((d) => d.lab == state.lab).toList();
    }

    // Apply shape filter
    if (state.shape != null && state.shape!.isNotEmpty) {
      result = result.where((d) => d.shape == state.shape).toList();
    }

    // Apply color filter
    if (state.color != null && state.color!.isNotEmpty) {
      result = result.where((d) => d.color == state.color).toList();
    }

    // Apply clarity filter
    if (state.clarity != null && state.clarity!.isNotEmpty) {
      result = result.where((d) => d.clarity == state.clarity).toList();
    }

    emit(state.copyWith(
      filteredDiamonds: result,
      filtersApplied: true,
    ));
  }

  void _onFilterReset(FilterReset event, Emitter<DiamondFilterState> emit) {
    emit(state.clearFilters());
  }
}
