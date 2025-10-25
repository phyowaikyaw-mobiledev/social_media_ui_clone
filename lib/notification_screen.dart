import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> notifications = [
      {
        'avatar': 'assets/image-7.jpg',
        'name': 'Zyro',
        'action': 'liked your post',
        'time': '1hr ago',
        'isNew': true,
      },
      {
        'avatar': 'assets/image-5.jpg',
        'name': 'Ko Kan Hein',
        'action': 'commented on your photo',
        'time': '2hr ago',
        'isNew': true,
      },
      {
        'avatar': 'assets/image-6.jpg',
        'name': 'Andrew',
        'action': 'shared your post',
        'time': '3hr ago',
        'isNew': false,
      },
      {
        'avatar': 'assets/image-0.jpg',
        'name': 'Ying',
        'action': 'reacted to your comment',
        'time': '5hr ago',
        'isNew': false,
      },
      {
        'avatar': 'assets/image-3.jpg',
        'name': 'Data Center',
        'action': 'tagged you in a post',
        'time': '1 day ago',
        'isNew': false,
      },
      {
        'avatar': 'assets/image-6.jpg',
        'name': 'Andrew',
        'action': 'shared your post',
        'time': '3hr ago',
        'isNew': false,
      },
      {
        'avatar': 'assets/image-0.jpg',
        'name': 'Ying',
        'action': 'reacted to your comment',
        'time': '5hr ago',
        'isNew': false,
      },
      {
        'avatar': 'assets/image-3.jpg',
        'name': 'Data Center',
        'action': 'tagged you in a post',
        'time': '1 day ago',
        'isNew': false,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.grey[800]),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Notifications',
          style: TextStyle(
            color: Colors.grey[800],
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.grey[800]),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  _buildFilterChip('All', true),
                  SizedBox(width: 8),
                  _buildFilterChip('Unread', false),
                ],
              ),
            ),
          ),

          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 8),
              itemCount: notifications.length,
              separatorBuilder: (context, index) => Divider(
                height: 1,
                indent: 80,
              ),
              itemBuilder: (context, index) {
                return _buildNotificationItem(notifications[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFF667eea) : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey[700],
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildNotificationItem(Map<String, dynamic> notification) {
    return Container(
      color: notification['isNew'] ? Colors.blue[50] : Colors.white,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Stack(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage(notification['avatar']),
            ),
            if (notification['isNew'])
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: Color(0xFF667eea),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
          ],
        ),
        title: RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 15, color: Colors.black87),
            children: [
              TextSpan(
                text: notification['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: ' '),
              TextSpan(text: notification['action']),
            ],
          ),
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(top: 4),
          child: Text(
            notification['time'],
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 13,
            ),
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.more_horiz, color: Colors.grey[600]),
          onPressed: () {},
        ),
      ),
    );
  }
}