class ArticleModel {
  String title;
  String image;
  DateTime date;
  String source;
  ArticleModel(
      {required this.title,
      required this.image,
      required this.date,
      required this.source});
  static List<ArticleModel> articles = [
    ArticleModel(
        title: "Why are football's biggest clubs starting a newtournament?",
        image:
        "https://img.olympics.com/images/image/private/t_s_16_9_g_auto/t_s_w1460/f_auto/primary/ix5rdbcfnwifaf3oeozv",
        date: DateTime.now(),
        source: 'BBC News'),
    ArticleModel(
        title: "Why are football's biggest clubs starting a newtournament?",
        image:
            "https://img.olympics.com/images/image/private/t_s_16_9_g_auto/t_s_w1460/f_auto/primary/ix5rdbcfnwifaf3oeozv",
        date: DateTime.now().subtract(Duration(days: 1)),
        source: 'BBC News'),
    ArticleModel(
        title: '''Why are football's biggest clubs starting a new
        tournament?''',
        image:
        "https://img.olympics.com/images/image/private/t_s_16_9_g_auto/t_s_w1460/f_auto/primary/ix5rdbcfnwifaf3oeozv",
        date: DateTime.now().subtract(Duration(hours: 10)),
        source: 'BBC News'),
  ];
}
