class SearchBaseItemModel {
  final String title;
  final String description;
  final String? imageUrl;

  const SearchBaseItemModel({
    required this.title,
    required this.description,
    this.imageUrl,
  });
}

abstract class SearcAbstractBaseItem {
  List<SearchBaseItemModel> get getResults;
}
