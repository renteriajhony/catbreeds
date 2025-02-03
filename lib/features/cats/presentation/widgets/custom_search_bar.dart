import 'package:catbreeds/core/utils/tokens/tokens.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

/// \[CustomSearchBar\] Widget que muestra una barra de búsqueda personalizada.
///
/// Este widget presenta una barra de búsqueda que permite al usuario
/// ingresar texto para realizar búsquedas. Incluye un botón de búsqueda
/// que ejecuta la función de búsqueda proporcionada.
///
/// \[onSearch\]: Función que se ejecuta cuando se realiza una búsqueda.
/// \[focusNode\]: Nodo de enfoque para el campo de búsqueda.
class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    super.key,
    required this.onSearch,
    required this.focusNode,
  });

  final Function(String) onSearch;
  final FocusNode focusNode;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

/// \[_CustomSearchBarState\] Estado del widget \[CustomSearchBar\].
///
/// Esta clase maneja el estado del widget, incluyendo la lógica
/// para controlar el campo de búsqueda y ejecutar la función de búsqueda.
class _CustomSearchBarState extends State<CustomSearchBar> {
  final SearchController _searchController = SearchController();

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Padding(
        padding: const EdgeInsets.all(DimensionsDouble.ten),
        child: SearchBar(
          focusNode: widget.focusNode,
          controller: _searchController,
          hintText: localizations?.searchLabel,
          backgroundColor:
          WidgetStatePropertyAll(Theme.of(context).canvasColor),
          padding:
          WidgetStateProperty.all(EdgeInsets.all(DimensionsDouble.ten)),
          onTap: () {},
          onSubmitted: (event) {
            widget.onSearch(event);
            setState(() {
              _searchController.closeView;
            });
          },
          trailing: <Widget>[
            Tooltip(
              message: localizations?.searchLabel,
              child: IconButton(
                onPressed: () {
                  widget.onSearch(_searchController.text);
                  setState(() {
                    FocusScope.of(context).unfocus();
                    _searchController.closeView;
                  });
                },
                icon: const Icon(Icons.search),
              ),
            )
          ],
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }
}