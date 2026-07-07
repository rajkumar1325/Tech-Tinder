import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/article.dart';
import '../services/news_service.dart';
import '../widgets/news_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NewsService _newsService = NewsService();
  final CardSwiperController _controller = CardSwiperController();

  List<Article> _articles = [];
  bool _loading = true;
  bool _fetchingMore = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadInitial();
  }

  Future<void> _loadInitial() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final articles = await _newsService.fetchTechNews();
      setState(() {
        _articles = articles;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  Future<void> _loadMore({required bool liked}) async {
    if (_fetchingMore) return;
    _fetchingMore = true;
    try {
      final more = liked
          ? await _newsService.fetchSimilarNews()
          : await _newsService.fetchTechNews(more: true);
      if (mounted) {
        setState(() => _articles.addAll(more));
      }
    } catch (_) {
      // Silent fail — user can keep swiping through remaining cards
    } finally {
      _fetchingMore = false;
    }
  }

  bool _onSwipe(
      int previousIndex, int? currentIndex, CardSwiperDirection direction) {
    final article = _articles[previousIndex];

    if (direction == CardSwiperDirection.right) {
      _newsService.registerLike(article);
      _loadMore(liked: true);
    } else if (direction == CardSwiperDirection.left) {
      _newsService.registerDislike(article);
    }

    if (_articles.length - previousIndex <= 3) {
      _loadMore(liked: true);
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      appBar: AppBar(
        title: const Text('Tech Tinder', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.black,
        elevation: 10,
      ),
      body: SafeArea(
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : _error != null
                ? _buildError()
                : _articles.isEmpty
                    ? const Center(child: Text('No articles found'))
                    : Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: CardSwiper(
                                controller: _controller,
                                cardsCount: _articles.length,
                                numberOfCardsDisplayed:
                                    _articles.length < 2 ? 1 : 2,
                                onSwipe: _onSwipe,
                                allowedSwipeDirection:
                                    const AllowedSwipeDirection.only(
                                  left: true,
                                  right: true,
                                ),
                                cardBuilder:
                                    (context, index, percentX, percentY) {
                                  return GestureDetector(
                                    onDoubleTap: () async {
                                      final uri = Uri.parse(_articles[index].url);
                                      if (await canLaunchUrl(uri)) {
                                        launchUrl(uri,
                                            mode: LaunchMode.externalApplication);
                                      }
                                    },
                                    child: NewsCard(
                                        key: ValueKey(_articles[index].uniqueKey),
                                        article: _articles[index]),
                                  );
                                },
                              ),
                            ),
                          ),
                          _buildActionRow(),
                        ],
                      ),
      ),
    );
  }

  Widget _buildActionRow() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: 'dislike',
            backgroundColor: Colors.white,
            onPressed: () => _controller.swipe(CardSwiperDirection.left),
            child: const Icon(Icons.close, color: Colors.redAccent, size: 30),
          ),
          const SizedBox(width: 40),
          FloatingActionButton(
            heroTag: 'like',
            backgroundColor: Colors.white,
            onPressed: () => _controller.swipe(CardSwiperDirection.right),
            child: const Icon(Icons.favorite, color: Colors.green, size: 30),
          ),
        ],
      ),
    );
  }

  Widget _buildError() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 12),
            Text(_error!, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _loadInitial, child: const Text('Retry')),
          ],
        ),
      ),
    );
  }
}
