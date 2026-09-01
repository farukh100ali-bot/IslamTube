import 'package:flutter/material.dart';

void main() {
  runApp(const IslamTubeApp());
}

class IslamTubeApp extends StatelessWidget {
  const IslamTubeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IslamTube',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F0F0F),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0F0F0F),
          elevation: 0,
        ),
      ),
      home: const MainHomeScreen(),
    );
  }
}

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TOP APP BAR
      appBar: AppBar(
        titleSpacing: 12,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
              decoration: BoxDecoration(
                color: const Color(0xFF00E676),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(Icons.play_arrow, color: Colors.black, size: 16),
            ),
            const SizedBox(width: 8),
            RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(text: 'Islam', style: TextStyle(color: Colors.white)),
                  TextSpan(text: 'tube', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),

      // BODY WITH INFINITE SCROLL FEED
      body: Column(
        children: [
          // CATEGORIES SCROLL BAR
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1F1F1F),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.explore_outlined, color: Color(0xFF00E676), size: 18),
                ),
                const SizedBox(width: 8),
                _buildCategoryChip('All', isSelected: true),
                _buildCategoryChip('Quran'),
                _buildCategoryChip('Hadees'),
                _buildCategoryChip('Bayaan'),
                _buildCategoryChip('Nasheed'),
              ],
            ),
          ),

          // HOME FEED LIST
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(bottom: 20),
              children: [
                // 1. LIVE VIDEO CARD
                _buildLiveVideoCard(),

                const SizedBox(height: 12),

                // 2. SHORTS SHELF
                _buildShortsShelf(),

                const SizedBox(height: 12),

                // 3. REGULAR LONG VIDEO CARD
                _buildVideoCard(
                  title: 'Dil Ko Sakoon Dene Wali Tilawat | Surah Ar-Rahman',
                  channel: 'Rahman Media',
                  views: '540K views • 2 days ago',
                  duration: '18:24',
                ),
              ],
            ),
          ),
        ],
      ),

      // BOTTOM NAVIGATION BAR
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF0F0F0F),
        selectedItemColor: const Color(0xFF00E676),
        unselectedItemColor: Colors.grey,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bolt), label: 'Shorts'),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline, size: 32, color: Color(0xFF00E676)),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.subscriptions_outlined), label: 'Subscriptions'),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 11,
              backgroundColor: Color(0xFF00E676),
              child: Text('الله', style: TextStyle(fontSize: 8, color: Colors.black, fontWeight: FontWeight.bold)),
            ),
            label: 'You',
          ),
        ],
      ),
    );
  }

  // CATEGORY CHIP WIDGET
  Widget _buildCategoryChip(String text, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      child: Chip(
        label: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.white,
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        backgroundColor: isSelected ? const Color(0xFF00E676) : const Color(0xFF1F1F1F),
        padding: const EdgeInsets.symmetric(horizontal: 4),
        side: BorderSide.none,
      ),
    );
  }

  // LIVE VIDEO CARD
  Widget _buildLiveVideoCard() {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          color: Colors.grey[900],
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Icon(Icons.play_circle_fill, color: Color(0xFF00E676), size: 50),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text('LIVE', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 18,
                backgroundColor: Color(0xFF00E676),
                child: Text('الله', style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Quran Aur Hadees Ki Roshni Mein Zindagi | By Dr Israr Ahmed',
                      style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Islamic Teacher • 2.1K watching',
                      style: TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.more_vert, color: Colors.grey, size: 18),
            ],
          ),
        ),
      ],
    );
  }

  // SHORTS SHELF WIDGET
  Widget _buildShortsShelf() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: Row(
              children: const [
                Icon(Icons.bolt, color: Color(0xFF00E676)),
                SizedBox(width: 6),
                Text('Shorts', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: _buildShortCard('Jummah Mubarak 🖤🕋💚', 'Jummah')),
              const SizedBox(width: 8),
              Expanded(child: _buildShortCard('SubhanAllah ✨', 'New')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildShortCard(String title, String tag) {
    return Container(
      height: 220,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        padding: const EdgeInsets.all(8),
        children: [
          Positioned(
            top: 4,
            left: 4,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFF00E676),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(tag, style: const TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold)),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }

  // REGULAR VIDEO CARD
  Widget _buildVideoCard({required String title, required String channel, required String views, required String duration}) {
    return Column(
      children: [
        Container(
          height: 190,
          width: double.infinity,
          color: Colors.grey[900],
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Icon(Icons.play_circle_fill, color: Color(0xFF00E676), size: 48),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  color: Colors.black87,
                  child: Text(duration, style: const TextStyle(color: Colors.white, fontSize: 10)),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 16,
                backgroundColor: Color(0xFF1F1F1F),
                child: Icon(Icons.person, color: Color(0xFF00E676), size: 18),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 2),
                    Text('$channel • $views', style: const TextStyle(color: Colors.grey, fontSize: 11)),
                  ],
                ),
              ),
              const Icon(Icons.more_vert, color: Colors.grey, size: 18),
            ],
          ),
        ),
      ],
    );
  }
}
