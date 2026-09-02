import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.play_circle_fill, color: Colors.green, size: 28),
            SizedBox(width: 8),
            Text(
              'IslamTube',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Category Chips Bar
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              children: [
                _buildCategoryChip('All', isSelected: true),
                _buildCategoryChip('Bayanat'),
                _buildCategoryChip('Quran Tilawat'),
                _buildCategoryChip('Naat Sharif'),
                _buildCategoryChip('Shorts'),
              ],
            ),
          ),
          
          // Video List Section
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                return _buildVideoCard(context, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        selectedColor: Colors.green,
        backgroundColor: Colors.grey[800],
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : Colors.grey[300],
        ),
        onSelected: (bool selected) {},
      ),
    );
  }

  Widget _buildVideoCard(BuildContext context, int index) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      color: const Color(0xFF1F1F1F),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAlignment.start,
        children: [
          // Video Thumbnail Placeholder
          Container(
            height: 200,
            color: Colors.grey[900],
            child: const Center(
              child: Icon(Icons.play_circle_outline, size: 60, color: Colors.green),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAlignment.start,
                    children: const [
                      Text(
                        'Beautiful Islamic Lecture Title',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Islamic Channel • 10K views • 2 days ago',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
