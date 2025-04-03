part of 'diamond_filter_bloc.dart';

class DiamondFilterState extends Equatable {
  final double? minCarat;
  final double? maxCarat;
  final String? lab;
  final String? shape;
  final String? color;
  final String? clarity;
  final List<Diamond> filteredDiamonds;
  final bool filtersApplied;

  const DiamondFilterState({
    this.minCarat,
    this.maxCarat,
    this.lab,
    this.shape,
    this.color,
    this.clarity,
    this.filteredDiamonds = const [],
    this.filtersApplied = false,
  });

  @override
  List<Object?> get props => [
        minCarat,
        maxCarat,
        lab,
        shape,
        color,
        clarity,
        filteredDiamonds,
        filtersApplied,
      ];

  DiamondFilterState copyWith({
    double? minCarat,
    double? maxCarat,
    String? lab,
    String? shape,
    String? color,
    String? clarity,
    List<Diamond>? filteredDiamonds,
    bool? filtersApplied,
  }) {
    return DiamondFilterState(
      minCarat: minCarat ?? this.minCarat,
      maxCarat: maxCarat ?? this.maxCarat,
      lab: lab ?? this.lab,
      shape: shape ?? this.shape,
      color: color ?? this.color,
      clarity: clarity ?? this.clarity,
      filteredDiamonds: filteredDiamonds ?? this.filteredDiamonds,
      filtersApplied: filtersApplied ?? this.filtersApplied,
    );
  }

  DiamondFilterState clearFilters() {
    return const DiamondFilterState(
      filtersApplied: false,
    );
  }
}
