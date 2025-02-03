import 'package:catbreeds/core/utils/tokens/tokens.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

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
