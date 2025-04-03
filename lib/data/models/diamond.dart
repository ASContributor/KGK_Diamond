import 'package:equatable/equatable.dart';

class Diamond extends Equatable {
  final String lotId;
  final String size;
  final double carat;
  final String lab;
  final String shape;
  final String color;
  final String clarity;
  final String cut;
  final String polish;
  final String symmetry;
  final String fluorescence;
  final double discount;
  final double perCaratRate;
  final double finalAmount;
  final String keyToSymbol;
  final String labComment;

  const Diamond({
    required this.lotId,
    required this.size,
    required this.carat,
    required this.lab,
    required this.shape,
    required this.color,
    required this.clarity,
    required this.cut,
    required this.polish,
    required this.symmetry,
    required this.fluorescence,
    required this.discount,
    required this.perCaratRate,
    required this.finalAmount,
    required this.keyToSymbol,
    required this.labComment,
  });

  @override
  List<Object?> get props => [
        lotId,
        size,
        carat,
        lab,
        shape,
        color,
        clarity,
        cut,
        polish,
        symmetry,
        fluorescence,
        discount,
        perCaratRate,
        finalAmount,
        keyToSymbol,
        labComment,
      ];

  // For JSON serialization/deserialization
  Map<String, dynamic> toJson() {
    return {
      'lotId': lotId,
      'size': size,
      'carat': carat,
      'lab': lab,
      'shape': shape,
      'color': color,
      'clarity': clarity,
      'cut': cut,
      'polish': polish,
      'symmetry': symmetry,
      'fluorescence': fluorescence,
      'discount': discount,
      'perCaratRate': perCaratRate,
      'finalAmount': finalAmount,
      'keyToSymbol': keyToSymbol,
      'labComment': labComment,
    };
  }

  factory Diamond.fromJson(Map<String, dynamic> json) {
    return Diamond(
      lotId: json['lotId'] as String,
      size: json['size'] as String,
      carat: json['carat'] as double,
      lab: json['lab'] as String,
      shape: json['shape'] as String,
      color: json['color'] as String,
      clarity: json['clarity'] as String,
      cut: json['cut'] as String,
      polish: json['polish'] as String,
      symmetry: json['symmetry'] as String,
      fluorescence: json['fluorescence'] as String,
      discount: json['discount'] as double,
      perCaratRate: json['perCaratRate'] as double,
      finalAmount: json['finalAmount'] as double,
      keyToSymbol: json['keyToSymbol'] as String,
      labComment: json['labComment'] as String,
    );
  }

  // For copy with changes
  Diamond copyWith({
    String? lotId,
    String? size,
    double? carat,
    String? lab,
    String? shape,
    String? color,
    String? clarity,
    String? cut,
    String? polish,
    String? symmetry,
    String? fluorescence,
    double? discount,
    double? perCaratRate,
    double? finalAmount,
    String? keyToSymbol,
    String? labComment,
  }) {
    return Diamond(
      lotId: lotId ?? this.lotId,
      size: size ?? this.size,
      carat: carat ?? this.carat,
      lab: lab ?? this.lab,
      shape: shape ?? this.shape,
      color: color ?? this.color,
      clarity: clarity ?? this.clarity,
      cut: cut ?? this.cut,
      polish: polish ?? this.polish,
      symmetry: symmetry ?? this.symmetry,
      fluorescence: fluorescence ?? this.fluorescence,
      discount: discount ?? this.discount,
      perCaratRate: perCaratRate ?? this.perCaratRate,
      finalAmount: finalAmount ?? this.finalAmount,
      keyToSymbol: keyToSymbol ?? this.keyToSymbol,
      labComment: labComment ?? this.labComment,
    );
  }
}
