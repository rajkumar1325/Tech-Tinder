//Article inside the card,
class Article {
  final String title;
  final String description;
  final String content;
  final String? imageUrl;
  final String sourceName;
  final String url;
  final DateTime publishedAt;

  Article({
    required this.title,
    required this.description,
    required this.content,
    required this.sourceName,
    required this.url,
    required this.publishedAt,
    this.imageUrl,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? 'Untitled',
      description: json['description'] ?? '',
      content: json['content'] ?? json['description'] ?? '',
      imageUrl: json['urlToImage'],
      sourceName: json['source']?['name'] ?? 'Unknown',
      url: json['url'] ?? '',
      publishedAt:
          DateTime.tryParse(json['publishedAt'] ?? '') ?? DateTime.now(),
    );
  }

  // Used to de-duplicate articles across paginated fetches
  String get uniqueKey => url.isNotEmpty ? url : title;
}
