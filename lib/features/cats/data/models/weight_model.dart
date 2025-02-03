import 'package:catbreeds/features/cats/domain/entities/weight.dart';

/// \[WeightModel\] Modelo de datos que representa el peso de un gato.
///
/// Este modelo extiende la entidad \[Weight\] y proporciona métodos para
/// la serialización y deserialización de datos JSON.
class WeightModel extends Weight {
  /// Constructor de \[WeightModel\].
  ///
  /// \[imperial\]: Peso en unidades imperiales.
  /// \[metric\]: Peso en unidades métricas.
  WeightModel({super.imperial, super.metric});

  /// Convierte la instancia de \[WeightModel\] a un mapa JSON.
  ///
  /// Retorna un mapa JSON que representa los datos del peso.
  Map<String, Object?> toJson() {
    return {'imperial': imperial, 'metric': metric};
  }

  /// Crea una instancia de \[WeightModel\] a partir de un mapa JSON.
  ///
  /// \[json\]: Mapa JSON que contiene los datos del peso.
  factory WeightModel.fromJson(Map<String, Object?> json) {
    return WeightModel(
        imperial: json['imperial'] == null ? null : json['imperial'] as String,
        metric: json['metric'] == null ? null : json['metric'] as String);
  }
}