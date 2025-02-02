import 'package:catbreeds/core/utils/tokens/tokens.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final List<String> _suggestions = [];
  final SearchController _searchController = SearchController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(DimensionsDouble.ten),
        child: SearchBar(
          controller: _searchController,
          hintText: 'Buscar...',
          backgroundColor:
              WidgetStatePropertyAll(Theme.of(context).canvasColor),
          padding:
              WidgetStateProperty.all(EdgeInsets.all(DimensionsDouble.ten)),
          onTap: () {},
          onSubmitted: (event) {
            setState(() {
              _searchController.closeView;
              _onSearch(_searchController.text);
            });
          },
          trailing: <Widget>[
            Tooltip(
              message: 'Search',
              child: IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: const Icon(Icons.search),
              ),
            )
          ],
        ));
  }

  void _onSearch(String search) {
    if (search.trim() != '') {
      _suggestions.add(search);
      if (_suggestions.length > 5) {
        _suggestions.removeAt(0);
      }
    }
    // Provider.of<BooksProvider>(context, listen: false).getBooks(search: search);
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }
}
