import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iittp_integrated/pages/news/custom_widget.dart'; // Import the custom widget file

class ScrollableWidgets extends StatefulWidget {
  const ScrollableWidgets({Key? key}) : super(key: key);

  @override
  _ScrollableWidgetsState createState() => _ScrollableWidgetsState();
}

class _ScrollableWidgetsState extends State<ScrollableWidgets> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  List<Map<String, String>> _newsItems = [];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final newPage = _pageController.page?.round() ?? 0;
      if (newPage != _currentPage) {
        setState(() {
          _currentPage = newPage;
        });
      }
    });

    // Fetch data from Firestore
    _fetchNewsItems();
  }

  Future<void> _fetchNewsItems() async {
    final snapshot = await FirebaseFirestore.instance.collection('news').get();
    final newsItems = snapshot.docs.map((doc) {
      return {
        'title': doc['h1']?.toString() ?? '',
        'description': doc['b1']?.toString() ?? '',
      };
    }).toList();

    setState(() {
      _newsItems = newsItems;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          itemCount: _newsItems.length, // This will be the number of documents
          itemBuilder: (context, index) {
            final newsItem = _newsItems[index];

            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CustomWidget(
                  title: newsItem['title']!,
                  description: newsItem['description']!,
                ),
              ),
            );
          },
        ),
        Positioned(
          left: -10,
          top: 0,
          bottom: 0,
          child: AnimatedOpacity(
            opacity: _currentPage > 0 ? 1 : 0,
            duration: const Duration(milliseconds: 300),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black54),
              onPressed: () {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
        ),
        Positioned(
          right: -10,
          top: 0,
          bottom: 0,
          child: AnimatedOpacity(
            opacity: _currentPage < _newsItems.length - 1 ? 1 : 0,
            duration: const Duration(milliseconds: 300),
            child: IconButton(
              icon: const Icon(Icons.arrow_forward_ios, color: Colors.black54),
              onPressed: () {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
        ),
        Positioned(
          bottom: -15,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _newsItems.length,
                      (index) => AnimatedContainer(
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: _currentPage == index ? 12 : 8,
                    height: _currentPage == index ? 12 : 8,
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(_currentPage == index ? 0.8 : 0.3),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}
