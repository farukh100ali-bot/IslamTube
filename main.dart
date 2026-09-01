import 'package:flutter/material.dart';

void main() {
  runApp(const IslamTubeApp());
}

class IslamTubeApp extends StatelessWidget {
  const IslamTubeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IslamTube',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F0F0F),
        primaryColor: const Color(0xFF00C853),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0F0F0F),
          elevation: 0,
        ),
      ),
      home: const CreateOptionsScreen(),
    );
  }
}

// 1. Create Options Modal Screen
class CreateOptionsScreen extends StatelessWidget {
  const CreateOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {},
        ),
        title: const Text('Create', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        children: [
          _buildOptionTile(
            context,
            icon: Icons.upload_file_rounded,
            title: 'Upload a video',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const UploadVideoScreen())),
          ),
          _buildOptionTile(
            context,
            icon: Icons.electric_bolt_rounded,
            title: 'Create a Short',
            onTap: () {},
          ),
          _buildOptionTile(
            context,
            icon: Icons.sensors_rounded,
            title: 'Go Live',
            onTap: () {},
          ),
          _buildOptionTile(
            context,
            icon: Icons.playlist_add_rounded,
            title: 'Create a Playlist',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildOptionTile(BuildContext context, {required IconData icon, required String title, required VoidCallback onTap}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF1F1F1F),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
        onTap: onTap,
      ),
    );
  }
}

// 2. Upload Video Select Screen
class UploadVideoScreen extends StatelessWidget {
  const UploadVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Upload video'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white24, width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Color(0xFF1F1F1F),
                      child: Icon(Icons.upload_rounded, color: Color(0xFF00C853), size: 40),
                    ),
                    SizedBox(height: 20),
                    Text('Select a video', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text('Drag and drop a video file', style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 5),
                    Text('File types: MP4, MOV, AVI, MKV\nMax size: 5GB', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00C853),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AddDetailsScreen())),
              child: const Text('Choose from device', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}

// 3. Add Video Details Screen
class AddDetailsScreen extends StatelessWidget {
  const AddDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
        title: const Text('Add details'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Next', style: TextStyle(color: Color(0xFF00C853), fontWeight: FontWeight.bold, fontSize: 16)),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.image, color: Colors.white54),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    hintText: 'Heart Touching Naat Sharif 2026',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const TextField(
            maxLines: 3,
            decoration: InputDecoration(
              labelText: 'Description',
              hintText: 'Very beautiful Naat Sharif...',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          const ListTile(
            leading: Icon(Icons.public),
            title: Text('Visibility'),
            subtitle: Text('Public'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          const ListTile(
            leading: Icon(Icons.location_on_outlined),
            title: Text('Location'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
        ],
      ),
    );
  }
}
