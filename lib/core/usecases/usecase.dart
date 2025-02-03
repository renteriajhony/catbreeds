import 'package:dartz/dartz.dart';
import '../errors/failures.dart';
/// Clase abstracta `UseCase` que define la estructura para los casos de uso.
///
/// Esta clase utiliza el patrón de diseño de caso de uso para encapsular
/// la lógica de negocio de una aplicación. Los casos de uso son responsables
/// de ejecutar una tarea específica y devolver un resultado.
abstract class UseCase<Type, Params> {
  /// Método abstracto `call` que debe ser implementado por las subclases.
  ///
  /// Este método toma un parámetro de tipo `Params` y devuelve un `Future`
  /// que contiene un `Either` con un `Failure` o un resultado de tipo `Type`.
  ///
  /// - [params]: Parámetros necesarios para ejecutar el caso de uso.
  ///
  /// Retorna un `Future` que contiene un `Either` con un `Failure` o un resultado de tipo `Type`.
  Future<Either<Failure, Type>> call(Params params);
}