class CharitySearchResultModel {
  final String title;
  final String target;
  final String percent;
  final String assetName;
  final List<String> categories;
  final int days;
  final String organizer;
  final String remaining;
  final String desc;
  final int people;

  CharitySearchResultModel({
    required this.title,
    required this.target,
    required this.percent,
    required this.assetName,
    required this.categories,
    required this.days,
    required this.organizer,
    required this.remaining,
    required this.desc,
    required this.people,
  });
}
