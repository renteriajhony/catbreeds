/// \[Weight\] Representa el peso de un gato.
///
/// Esta clase contiene información sobre el peso de un gato en diferentes
/// unidades de medida.
///
/// \[imperial\]: Peso en unidades imperiales (libras).
/// \[metric\]: Peso en unidades métricas (kilogramos).
class Weight {
  const Weight({
    this.imperial,
    this.metric,
  });

  final String? imperial;
  final String? metric;
}
