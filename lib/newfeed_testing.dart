import 'package:flutter/material.dart';
import 'package:mini_app/call4u.dart';
import 'notification_screen.dart';

class NewfeedTesting extends StatefulWidget {
  const NewfeedTesting({super.key});

  @override
  State<NewfeedTesting> createState() => _NewfeedTestingState();
}

class _NewfeedTestingState extends State<NewfeedTesting> {
  final List<Map<String, dynamic>> posts = [
    {
      'name': 'Phyo Wai Kyaw',
      'time': '1hr ago',
      'avatar': 'assets/andrew.jpg',
      'image': 'assets/sunset.jpg',
      'caption': 'Enjoying the beautiful sunset 🌅',
      'likes': 124,
      'comments': 23,
    },
    {
      'name': 'Andrew',
      'time': '2hr ago',
      'avatar': 'assets/andrew.jpg',
      'image': 'assets/coffee.jpg',
      'caption': 'Waiting Coffee ☕️',
      'likes': 89,
      'comments': 12,
    },
    {
      'name': 'Computer Data Center',
      'time': '45min ago',
      'avatar': 'assets/image-4.jpg',
      'image': 'assets/image-6.jpg',
      'caption': 'New tech arrival! 💻',
      'likes': 234,
      'comments': 45,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'SocialHub',
          style: TextStyle(
            color: Color(0xFF667eea),
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationScreen(),
                ),
              );
            },
            icon: Stack(
              children: [
                Icon(
                  Icons.notifications_outlined,
                  color: Colors.grey[800],
                  size: 28,
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.grey[800],
              size: 28,
            ),
          ),
          SizedBox(width: 8),
        ],
      ),
      backgroundColor: Colors.grey[100],
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 8),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return _buildPostCard(posts[index]);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xFF667eea),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Call4u()),
          );
        },
        icon: Icon(Icons.call, color: Colors.white),
        label: Text(
          'Contacts',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildPostCard(Map<String, dynamic> post) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(post['avatar']),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Text(
                            post['time'],
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(width: 6),
                          Icon(
                            Icons.public,
                            size: 14,
                            color: Colors.grey[600],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.more_horiz),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          if (post['caption'] != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(
                post['caption'],
                style: TextStyle(fontSize: 15),
              ),
            ),

          if (post['image'] != null)
            ClipRRect(
              child: Image.asset(
                post['image'],
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Color(0xFF667eea),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.thumb_up,
                        size: 14,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 6),
                    Text(
                      '${post['likes']} likes',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Text(
                  '${post['comments']} comments',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          Divider(height: 1),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildActionButton(
                  icon: Icons.thumb_up_outlined,
                  label: 'Like',
                  onTap: () {},
                ),
                _buildActionButton(
                  icon: Icons.comment_outlined,
                  label: 'Comment',
                  onTap: () {},
                ),
                _buildActionButton(
                  icon: Icons.share_outlined,
                  label: 'Share',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: Colors.grey[700],
            ),
            SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}