import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/cat_provider.dart';
import '../widgets/cat_card.dart';
import '../widgets/custom_search_bar.dart';

class CatListPage extends ConsumerStatefulWidget {
  const CatListPage({super.key});

  @override
  _CatListPageState createState() => _CatListPageState();
}

class _CatListPageState extends ConsumerState<CatListPage> {
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
    final catList = searchQuery.isEmpty
        ? ref.watch(catProvider)
        : ref.watch(catFilterProvider(searchQuery));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catbreeds'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CustomSearchBar(
                onSearch: _onSearch,
                focusNode: _focusNode,
              ),
            ),
            Expanded(
              child: catList.when(
                data: (cats) => ListView.builder(
                  itemCount: cats.length,
                  itemBuilder: (context, index) => CatCard(cat: cats[index]),
                ),
                loading: () => Center(
                  child: Image.asset(
                    'assets/images/cat-louder.gif',
                    width: double.infinity,
                    height: 80,
                  ),
                ),
                error: (error, _) =>
                    Center(child: Text('Error al cargar los gatos')),
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
