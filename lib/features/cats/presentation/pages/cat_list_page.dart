
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../lib.dart';

/// \[CatListPage\] Página de lista de gatos.
///
/// Esta página muestra una lista de gatos, permitiendo buscar gatos
/// específicos mediante un campo de búsqueda.
///
/// \[searchQuery\]: Cadena de búsqueda para filtrar los gatos.
/// \[_focusNode\]: Nodo de enfoque para el campo de búsqueda.
class CatListPage extends ConsumerStatefulWidget {
  const CatListPage({super.key});

  @override
  CatListPageState createState() => CatListPageState();
}

/// \[CatListPageState\] Estado de la página de lista de gatos.
///
/// Esta clase maneja el estado de la página, incluyendo la lógica
/// para buscar gatos y actualizar la lista mostrada.
class CatListPageState extends ConsumerState<CatListPage> {
  String searchQuery = '';
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final catList = searchQuery.isEmpty
        ? ref.watch(catProvider)
        : ref.watch(catFilterProvider(searchQuery));

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations?.appName ?? ''),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: DimensionsDouble.ten),
              child: CustomSearchBar(
                onSearch: _onSearch,
                focusNode: _focusNode,
              ),
            ),
            Expanded(
              child: catList.when(
                data: (cats) {
                  return cats.isEmpty
                      ? NotResource(
                    label: localizations?.appNotResult ?? '',
                    textStyle: Theme.of(context).textTheme.displaySmall,
                  )
                      : ListView.builder(
                    itemCount: cats.length,
                    itemBuilder: (context, index) =>
                        CatCard(cat: cats[index]),
                  );
                },
                loading: () => Center(
                  child: Image.asset(
                    'assets/images/cat-louder.gif',
                    width: double.infinity,
                    height: DimensionsDouble.eighty,
                  ),
                ),
                error: (error, _) => Center(
                  child: Text(
                    localizations?.catListPageErrorLoadDataLabel ?? '',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSearch(String filter) {
    FocusScope.of(context).unfocus();
    _focusNode.unfocus();
    setState(() {
      searchQuery = filter;
    });
  }
}
