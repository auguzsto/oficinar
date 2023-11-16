import 'package:flutter/material.dart';

class SearchEntityWidget extends StatelessWidget {
  final String titleBar;
  final String attrListTitle;
  final String atttrListSubtitle;
  final String hintText;
  final IconData iconData;
  final Future<List<Map<String, dynamic>>> Function()? searchDefault;
  final Future<List<Map<String, dynamic>>> Function(String inputValue)?
      searchInputSearch;
  const SearchEntityWidget({
    super.key,
    required this.attrListTitle,
    required this.atttrListSubtitle,
    required this.titleBar,
    required this.hintText,
    required this.iconData,
    required this.searchDefault,
    required this.searchInputSearch,
  });

  @override
  Widget build(BuildContext context) {
    final isSearch = ValueNotifier<bool>(false);
    final controllerInputText = TextEditingController();
    return Column(
      children: [
        AppBar(title: Text(titleBar)),
        AnimatedBuilder(
          animation: isSearch,
          builder: (context, child) => FutureBuilder(
            future: isSearch.value == false
                ? Future(() => searchDefault!())
                : Future(() => searchInputSearch!(controllerInputText.text)),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(snapshot.data?[index][attrListTitle][0]),
                      ),
                      title: Text(snapshot.data?[index][attrListTitle]),
                      subtitle: Text(snapshot.data?[index][atttrListSubtitle]),
                    );
                  },
                ),
              );
            },
          ),
        ),
        TextField(
          controller: controllerInputText,
          onSubmitted: (value) {
            value.isEmpty ? isSearch.value = false : isSearch.value = true;
          },
          decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.onPrimary,
              hintText: hintText,
              prefixIcon: Icon(iconData)),
        ),
      ],
    );
  }
}
