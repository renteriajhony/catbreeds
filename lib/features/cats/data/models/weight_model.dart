import 'package:catbreeds/features/cats/domain/entities/weight.dart';

class WeightModel extends Weight {
  WeightModel({super.imperial, super.metric});

  Map<String, Object?> toJson() {
    return {'imperial': imperial, 'metric': metric};
  }

  factory WeightModel.fromJson(Map<String, Object?> json) {
    return WeightModel(
        imperial: json['imperial'] == null ? null : json['imperial'] as String,
        metric: json['metric'] == null ? null : json['metric'] as String);
  }
}
