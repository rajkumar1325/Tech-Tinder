import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article.dart';

class NewsService {
  static const String _apiKey = '9fab90bf2c7642aa9afa78f36d3d30b1'; //newsApi.org
  static const String _baseUrl = 'https://newsapi.org/v2';

  int _page = 1;
  final Set<String> dislikedSources = {};
  final List<String> likedKeywords = [];
  final Set<String> _seenKeys = {};


  Future<List<Article>> fetchTechNews({bool more = false}) async {
    if (more) _page++;

    final uri = Uri.parse(
      '$_baseUrl/top-headlines?category=technology&language=en&pageSize=20&page=$_page&apiKey=$_apiKey',
    );

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception(
          'Failed to load news (${response.statusCode}): ${response.body}');
    }

    return _parseAndFilter(response.body);
  }

  /// Fetch news closer to what the user has liked, using accumulated keywords
  Future<List<Article>> fetchSimilarNews() async {
    _page++;
    final query =
        likedKeywords.isNotEmpty ? likedKeywords.take(3).join(' OR ') : 'technology';

    final uri = Uri.parse(
      '$_baseUrl/everything?q=${Uri.encodeQueryComponent(query)}&language=en&sortBy=publishedAt&pageSize=20&page=$_page&apiKey=$_apiKey',
    );

    final response = await http.get(uri);
    if (response.statusCode != 200) {
      // Fall back to plain headlines if the query endpoint fails / rate limits
      return fetchTechNews(more: true);
    }

    return _parseAndFilter(response.body);
  }

  List<Article> _parseAndFilter(String body) {
    final data = jsonDecode(body);
    final List articlesJson = data['articles'] ?? [];

    final articles = articlesJson
        .map((a) => Article.fromJson(a))
        .where((a) => a.title != '[Removed]' && a.url.isNotEmpty)
        .where((a) => !dislikedSources.contains(a.sourceName))
        .where((a) => !_seenKeys.contains(a.uniqueKey))
        .toList();

    for (final a in articles) {
      _seenKeys.add(a.uniqueKey);
    }
    return articles;
  }

  void registerLike(Article article) {
    final words = article.title
        .split(RegExp(r'\s+'))
        .where((w) => w.length > 4)
        .take(2);
    likedKeywords.addAll(words);
  }

  void registerDislike(Article article) {
    dislikedSources.add(article.sourceName);
  }
}
