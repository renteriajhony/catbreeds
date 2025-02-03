import 'weight.dart';
/// \[Cat\] Representa una entidad de gato con varias propiedades.
///
/// Esta clase contiene información detallada sobre un gato, incluyendo
/// su peso, URLs relacionadas, temperamento, origen, descripción, y
/// varias características específicas.
///
/// \[id\]: Identificador único del gato.
/// \[name\]: Nombre del gato.
/// \[weight\]: Peso del gato.
/// \[cfaUrl\]: URL de CFA.
/// \[vetstreetUrl\]: URL de Vetstreet.
/// \[vcahospitalsUrl\]: URL de VCA Hospitals.
/// \[temperament\]: Temperamento del gato.
/// \[origin\]: Origen del gato.
/// \[countryCodes\]: Códigos de país.
/// \[countryCode\]: Código de país.
/// \[description\]: Descripción del gato.
/// \[lifeSpan\]: Esperanza de vida del gato.
/// \[indoor\]: Indicador de si el gato es de interior.
/// \[lap\]: Indicador de si el gato es de regazo.
/// \[altNames\]: Nombres alternativos del gato.
/// \[adaptability\]: Nivel de adaptabilidad del gato.
/// \[affectionLevel\]: Nivel de afecto del gato.
/// \[childFriendly\]: Nivel de amabilidad con los niños.
/// \[dogFriendly\]: Nivel de amabilidad con los perros.
/// \[energyLevel\]: Nivel de energía del gato.
/// \[grooming\]: Nivel de necesidad de acicalamiento.
/// \[healthIssues\]: Nivel de problemas de salud.
/// \[intelligence\]: Nivel de inteligencia del gato.
/// \[sheddingLevel\]: Nivel de desprendimiento de pelo.
/// \[socialNeeds\]: Nivel de necesidades sociales.
/// \[strangerFriendly\]: Nivel de amabilidad con extraños.
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
/// \[referenceImageId\]: Identificador de la imagen de referencia del gato.
class Cat {
  const Cat({
    required this.id,
    required this.name,
    this.weight,
    this.cfaUrl,
    this.vetstreetUrl,
    this.vcahospitalsUrl,
    this.temperament,
    this.origin,
    this.countryCodes,
    this.countryCode,
    this.description,
    this.lifeSpan,
    this.indoor,
    this.lap,
    this.altNames,
    this.adaptability,
    this.affectionLevel,
    this.childFriendly,
    this.dogFriendly,
    this.energyLevel,
    this.grooming,
    this.healthIssues,
    this.intelligence,
    this.sheddingLevel,
    this.socialNeeds,
    this.strangerFriendly,
    this.vocalisation,
    this.experimental,
    this.hairless,
    this.natural,
    this.rare,
    this.rex,
    this.suppressedTail,
    this.shortLegs,
    this.wikipediaUrl,
    this.hypoallergenic,
    this.referenceImageId,
  });

  final String id;
  final String name;
  final Weight? weight;
  final String? cfaUrl;
  final String? vetstreetUrl;
  final String? vcahospitalsUrl;
  final String? temperament;
  final String? origin;
  final String? countryCodes;
  final String? countryCode;
  final String? description;
  final String? lifeSpan;
  final int? indoor;
  final int? lap;
  final String? altNames;
  final int? adaptability;
  final int? affectionLevel;
  final int? childFriendly;
  final int? dogFriendly;
  final int? energyLevel;
  final int? grooming;
  final int? healthIssues;
  final int? intelligence;
  final int? sheddingLevel;
  final int? socialNeeds;
  final int? strangerFriendly;
  final int? vocalisation;
  final int? experimental;
  final int? hairless;
  final int? natural;
  final int? rare;
  final int? rex;
  final int? suppressedTail;
  final int? shortLegs;
  final String? wikipediaUrl;
  final int? hypoallergenic;
  final String? referenceImageId;

}
