import 'package:flutter/material.dart';

import '../../../../../config/constants/fonts/all_text_styles.dart';
import '../../../../../config/constants/gen/locale_keys.g.dart';
import '../../../../../config/theme/components_theme/text_form_field.theme.dart';
import '../../extensions/size.extension.dart';
import '../widgets/app_icon.widget.dart';
import '../widgets/app_pop_scope.dart';
import '../widgets/app_text.widget.dart';
import '../widgets/app_text_field.widget.dart';
import '../widgets/default_app_bar.dart';

/// A generic and reusable page for displaying a list of items in a [ListView]
/// or [GridView], with a search bar to filter the data.
///
/// It uses [ValueNotifier] and [ValueListenableBuilder] for efficient state
/// management, rebuilding only the list of items when the data changes.
class ElaboratedSelectPage<T> extends StatefulWidget {
  const ElaboratedSelectPage({
    // The full list of data to display and search through.
    required this.data,
    // A function that builds the widget for each individual item.
    required this.itemBuilder,
    // A function that returns the string representation of an item for searching.
    required this.searchableText,
    super.key,
    // A boolean to toggle between ListView and GridView. Defaults to false (ListView).
    this.isGrid = false,
    // The delegate to use for the GridView, with a sensible default.
    this.gridDelegate = const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
    ),
  });

  /// The original list of data items.
  final List<T> data;

  /// A builder function to create a widget for each item in the list.
  final Widget Function(BuildContext context, T item) itemBuilder;

  /// A function that takes an item and returns the string to be used for searching.
  /// For example, for a `User` object, this might return `user.name`.
  final String Function(T item) searchableText;

  /// If true, displays the data in a [GridView]. Otherwise, displays it in a [ListView].
  final bool isGrid;

  /// The delegate that controls the layout of the [GridView].
  final SliverGridDelegate gridDelegate;

  @override
  State<ElaboratedSelectPage<T>> createState() =>
      _ElaboratedSelectPageState<T>();
}

class _ElaboratedSelectPageState<T> extends State<ElaboratedSelectPage<T>> {
  // Notifier to hold the current text from the search bar.
  late final ValueNotifier<String> _searchQueryNotifier;

  // Notifier to hold the filtered list of data based on the search query.
  // The UI will listen to this notifier to rebuild when the list changes.
  late final ValueNotifier<List<T>> _filteredDataNotifier;

  // Standard controller for the search TextField.
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    // Initialize the notifiers and controller.
    _searchQueryNotifier = ValueNotifier('');
    // Initially, the filtered list contains all the original data.
    _filteredDataNotifier = ValueNotifier(widget.data);
    _searchController = TextEditingController();

    // Add a listener to the search query to trigger the filtering logic whenever it changes.
    _searchQueryNotifier.addListener(_performSearch);
  }

  @override
  void dispose() {
    // It's crucial to remove listeners and dispose of controllers and notifiers
    // to prevent memory leaks.
    _searchQueryNotifier.removeListener(_performSearch);
    _searchQueryNotifier.dispose();
    _filteredDataNotifier.dispose();
    _searchController.dispose();
    super.dispose();
  }

  /// Filters the original data list based on the current search query
  /// and updates the `_filteredDataNotifier` with the result.
  void _performSearch() {
    final query = _searchQueryNotifier.value.trim().toLowerCase();

    if (query.isEmpty) {
      // If the search query is empty, display the entire original list.
      _filteredDataNotifier.value = widget.data;
    } else {
      // Otherwise, filter the list based on the searchableText provided.
      final filteredList = widget.data.where((item) {
        return widget.searchableText(item).toLowerCase().contains(query);
      }).toList();
      _filteredDataNotifier.value = filteredList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppPopScope(
      onPop: ([result]) async {
        return false;
      },
      child: Scaffold(
        appBar: DefaultAppBar(
          title: LocaleKeys
              .core_common_presentation_views_pages_elaboratedSelectPage_title,
          leadingAction: () {},
          leadingWidget: const SizedBox(),
        ),
        body: Column(
          children: [
            // The search bar section.
            Padding(
              padding: 16.allPadding,
              child: AppTextField.search(
                controller: _searchController,
                onChanged: (value) {
                  // Update the search query notifier as the user types.
                  _searchQueryNotifier.value = value!;
                },
                theme: FormFieldTheme(
                  suffixIcon: AppIcon(
                    Icons.close_rounded,
                    onTap: () {
                      _searchController.clear();
                      _searchQueryNotifier.value = '';
                    },
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: TextField(
            //     controller: _searchController,
            //     onChanged: (value) {
            //       // Update the search query notifier as the user types.
            //       _searchQueryNotifier.value = value;
            //     },
            //     decoration: InputDecoration(
            //       labelText: 'Search',
            //       hintText: 'Type to search...',
            //       prefixIcon: const Icon(Icons.search),
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(12.0),
            //       ),
            //       // Add a clear button to easily reset the search field.
            //       suffixIcon: IconButton(
            //         icon: const Icon(Icons.clear),
            //         onPressed: () {
            //           _searchController.clear();
            //           _searchQueryNotifier.value = '';
            //         },
            //       ),
            //     ),
            //   ),
            // ),

            // The list of items that automatically updates thanks to ValueListenableBuilder.
            Expanded(
              child: ValueListenableBuilder<List<T>>(
                valueListenable: _filteredDataNotifier,
                builder: (context, filteredData, _) {
                  // Display a message if no items match the search.
                  if (filteredData.isEmpty) {
                    return Center(
                      child: AppText(
                        LocaleKeys.common_words_noItemsFound,
                        style: AllTextStyle.f16W6,
                      ),
                    );
                  }

                  // Conditionally build a GridView or ListView based on the `isGrid` flag.
                  if (widget.isGrid) {
                    return GridView.builder(
                      padding: 16.allPadding,
                      gridDelegate: widget.gridDelegate,
                      itemCount: filteredData.length,
                      itemBuilder: (context, i) {
                        final item = filteredData[i];
                        // Wrap each item with InkWell to handle taps.
                        return InkWell(
                          onTap: () => Navigator.of(context).pop(item),
                          child: widget.itemBuilder(context, item),
                        );
                      },
                    );
                  } else {
                    return ListView.builder(
                      itemCount: filteredData.length,
                      itemBuilder: (context, i) {
                        final item = filteredData[i];
                        // Wrap each item with InkWell to handle taps.
                        return InkWell(
                          onTap: () => Navigator.of(context).pop(item),
                          child: widget.itemBuilder(context, item),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
