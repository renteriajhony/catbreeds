import 'package:catbreeds/features/cats/data/models/weight_model.dart';
import '../../domain/entities/cat.dart';

/// \[CatModel\] Modelo de datos que representa un gato.
///
/// Este modelo extiende la entidad \[Cat\] y proporciona métodos para
/// la serialización y deserialización de datos JSON.
class CatModel extends Cat {
  /// Constructor de \[CatModel\].
  ///
  /// \[id\]: Identificador único del gato.
  /// \[name\]: Nombre del gato.
  /// \[weight\]: Peso del gato.
  /// \[cfaUrl\]: URL de la CFA.
  /// \[vetstreetUrl\]: URL de Vetstreet.
  /// \[vcahospitalsUrl\]: URL de VCA Hospitals.
  /// \[temperament\]: Temperamento del gato.
  /// \[origin\]: Origen del gato.
  /// \[countryCodes\]: Códigos de país del gato.
  /// \[countryCode\]: Código de país del gato.
  /// \[description\]: Descripción del gato.
  /// \[lifeSpan\]: Esperanza de vida del gato.
  /// \[indoor\]: Indicador de si el gato es de interior.
  /// \[lap\]: Indicador de si el gato es de regazo.
  /// \[altNames\]: Nombres alternativos del gato.
  /// \[adaptability\]: Nivel de adaptabilidad del gato.
  /// \[affectionLevel\]: Nivel de afecto del gato.
  /// \[childFriendly\]: Nivel de amistad con niños.
  /// \[dogFriendly\]: Nivel de amistad con perros.
  /// \[energyLevel\]: Nivel de energía del gato.
  /// \[grooming\]: Nivel de necesidad de aseo.
  /// \[healthIssues\]: Problemas de salud del gato.
  /// \[intelligence\]: Nivel de inteligencia del gato.
  /// \[sheddingLevel\]: Nivel de muda del gato.
  /// \[socialNeeds\]: Necesidades sociales del gato.
  /// \[strangerFriendly\]: Nivel de amistad con extraños.
  /// \[vocalisation\]: Nivel de vocalización del gato.
  /// \[experimental\]: Indicador de si el gato es experimental.
  /// \[hairless\]: Indicador de si el gato es sin pelo.
  /// \[natural\]: Indicador de si el gato es natural.
  /// \[rare\]: Indicador de si el gato es raro.
  /// \[rex\]: Indicador de si el gato es rex.
  /// \[suppressedTail\]: Indicador de si el gato tiene cola suprimida.
  /// \[shortLegs\]: Indicador de si el gato tiene patas cortas.
  /// \[wikipediaUrl\]: URL de Wikipedia del gato.
  /// \[hypoallergenic\]: Indicador de si el gato es hipoalergénico.
  /// \[referenceImageId\]: Identificador de imagen de referencia.
  CatModel({
    required super.id,
    required super.name,
    super.weight,
    super.cfaUrl,
    super.vetstreetUrl,
    super.vcahospitalsUrl,
    super.temperament,
    super.origin,
    super.countryCodes,
    super.countryCode,
    super.description,
    super.lifeSpan,
    super.indoor,
    super.lap,
    super.altNames,
    super.adaptability,
    super.affectionLevel,
    super.childFriendly,
    super.dogFriendly,
    super.energyLevel,
    super.grooming,
    super.healthIssues,
    super.intelligence,
    super.sheddingLevel,
    super.socialNeeds,
    super.strangerFriendly,
    super.vocalisation,
    super.experimental,
    super.hairless,
    super.natural,
    super.rare,
    super.rex,
    super.suppressedTail,
    super.shortLegs,
    super.wikipediaUrl,
    super.hypoallergenic,
    super.referenceImageId,
  });

  factory CatModel.fromJson(Map<String, Object?> json) {
    return CatModel(
      id: json['id'] as String,
      name: json['name'] as String,
      weight: json['weight'] == null
          ? null
          : WeightModel.fromJson(json['weight'] as Map<String, Object?>),
      cfaUrl: json['cfa_url'] == null ? null : json['cfa_url'] as String,
      vetstreetUrl: json['vetstreet_url'] == null
          ? null
          : json['vetstreet_url'] as String,
      vcahospitalsUrl: json['vcahospitals_url'] == null
          ? null
          : json['vcahospitals_url'] as String,
      temperament:
          json['temperament'] == null ? null : json['temperament'] as String,
      origin: json['origin'] == null ? null : json['origin'] as String,
      countryCodes: json['country_codes'] == null
          ? null
          : json['country_codes'] as String,
      countryCode:
          json['country_code'] == null ? null : json['country_code'] as String,
      description:
          json['description'] == null ? null : json['description'] as String,
      lifeSpan: json['life_span'] == null ? null : json['life_span'] as String,
      indoor: json['indoor'] == null ? null : json['indoor'] as int,
      lap: json['lap'] == null ? null : json['lap'] as int,
      altNames: json['alt_names'] == null ? null : json['alt_names'] as String,
      adaptability:
          json['adaptability'] == null ? null : json['adaptability'] as int,
      affectionLevel: json['affection_level'] == null
          ? null
          : json['affection_level'] as int,
      childFriendly:
          json['child_friendly'] == null ? null : json['child_friendly'] as int,
      dogFriendly:
          json['dog_friendly'] == null ? null : json['dog_friendly'] as int,
      energyLevel:
          json['energy_level'] == null ? null : json['energy_level'] as int,
      grooming: json['grooming'] == null ? null : json['grooming'] as int,
      healthIssues:
          json['health_issues'] == null ? null : json['health_issues'] as int,
      intelligence:
          json['intelligence'] == null ? null : json['intelligence'] as int,
      sheddingLevel:
          json['shedding_level'] == null ? null : json['shedding_level'] as int,
      socialNeeds:
          json['social_needs'] == null ? null : json['social_needs'] as int,
      strangerFriendly: json['stranger_friendly'] == null
          ? null
          : json['stranger_friendly'] as int,
      vocalisation:
          json['vocalisation'] == null ? null : json['vocalisation'] as int,
      experimental:
          json['experimental'] == null ? null : json['experimental'] as int,
      hairless: json['hairless'] == null ? null : json['hairless'] as int,
      natural: json['natural'] == null ? null : json['natural'] as int,
      rare: json['rare'] == null ? null : json['rare'] as int,
      rex: json['rex'] == null ? null : json['rex'] as int,
      suppressedTail: json['suppressed_tail'] == null
          ? null
          : json['suppressed_tail'] as int,
      shortLegs: json['short_legs'] == null ? null : json['short_legs'] as int,
      wikipediaUrl: json['wikipedia_url'] == null
          ? null
          : json['wikipedia_url'] as String,
      hypoallergenic:
          json['hypoallergenic'] == null ? null : json['hypoallergenic'] as int,
      referenceImageId: json['reference_image_id'] == null
          ? null
          : json['reference_image_id'] as String,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'weight': WeightModel().toJson(),
      'id': id,
      'name': name,
      'cfa_url': cfaUrl,
      'vetstreet_url': vetstreetUrl,
      'vcahospitals_url': vcahospitalsUrl,
      'temperament': temperament,
      'origin': origin,
      'country_codes': countryCodes,
      'country_code': countryCode,
      'description': description,
      'life_span': lifeSpan,
      'indoor': indoor,
      'lap': lap,
      'alt_names': altNames,
      'adaptability': adaptability,
      'affection_level': affectionLevel,
      'child_friendly': childFriendly,
      'dog_friendly': dogFriendly,
      'energy_level': energyLevel,
      'grooming': grooming,
      'health_issues': healthIssues,
      'intelligence': intelligence,
      'shedding_level': sheddingLevel,
      'social_needs': socialNeeds,
      'stranger_friendly': strangerFriendly,
      'vocalisation': vocalisation,
      'experimental': experimental,
      'hairless': hairless,
      'natural': natural,
      'rare': rare,
      'rex': rex,
      'suppressed_tail': suppressedTail,
      'short_legs': shortLegs,
      'wikipedia_url': wikipediaUrl,
      'hypoallergenic': hypoallergenic,
      'reference_image_id': referenceImageId,
    };
  }
}
