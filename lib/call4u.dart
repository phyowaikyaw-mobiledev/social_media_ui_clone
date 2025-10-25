import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Call4u extends StatefulWidget {
  const Call4u({super.key});

  @override
  State<Call4u> createState() => _Call4uState();
}

class _Call4uState extends State<Call4u> {
  // Sample contacts data
  final List<Map<String, dynamic>> contacts = [
    {
      'name': 'Drew',
      'phone': '09774977993',
      'avatar': 'assets/andrew.jpg',
      'isFavorite': true,
    },
    {
      'name': 'Ko Kan Hein',
      'phone': '09400957006',
      'avatar': 'assets/image-5.jpg',
      'isFavorite': true,
    },
    {
      'name': 'Phyo Si Thu',
      'phone': '09940965554',
      'avatar': 'assets/image3.jpg',
      'isFavorite': false,
    },
    {
      'name': 'Daddy',
      'phone': '09440310661',
      'avatar': 'assets/image-10.jpg',
      'isFavorite': true,
    },
    {
      'name': 'Mommy',
      'phone': '09987792768',
      'avatar': 'assets/image-10.jpg',
      'isFavorite': true,
    },
    {
      'name': 'Ying',
      'phone': '09774977993',
      'avatar': 'assets/image1.jpg',
      'isFavorite': false,
    },
    {
      'name': 'Andrew',
      'phone': '09774977993',
      'avatar': 'assets/image2.jpg',
      'isFavorite': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.grey[800]),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Contacts',
          style: TextStyle(
            color: Colors.grey[800],
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.grey[800]),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.grey[800]),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          // Favorites Section
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Favorites',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 12),
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: contacts.where((c) => c['isFavorite']).length,
                    itemBuilder: (context, index) {
                      final favoriteContacts =
                      contacts.where((c) => c['isFavorite']).toList();
                      return _buildFavoriteAvatar(favoriteContacts[index]);
                    },
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 8),

          // All Contacts Section Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Text(
                  'All Contacts',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  '(${contacts.length})',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),

          // Contacts List
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return _buildContactItem(contacts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Favorite avatar widget
  Widget _buildFavoriteAvatar(Map<String, dynamic> contact) {
    return GestureDetector(
      onTap: () => _makeCall(contact['phone']),
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(contact['avatar']),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Color(0xFF667eea),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Icon(
                      Icons.phone,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            SizedBox(
              width: 70,
              child: Text(
                contact['name'],
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Contact list item widget
  Widget _buildContactItem(Map<String, dynamic> contact) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: () => _makeCall(contact['phone']),
        onLongPress: () => _showContactOptions(contact),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          radius: 28,
          backgroundImage: AssetImage(contact['avatar']),
        ),
        title: Text(
          contact['name'],
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(top: 4),
          child: Text(
            contact['phone'],
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                contact['isFavorite'] ? Icons.star : Icons.star_border,
                color: contact['isFavorite'] ? Colors.amber : Colors.grey[400],
              ),
              onPressed: () {
                setState(() {
                  contact['isFavorite'] = !contact['isFavorite'];
                });
              },
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0xFF667eea),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.phone,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Make phone call
  void _makeCall(String phoneNumber) async {
    await FlutterPhoneDirectCaller.callNumber(phoneNumber);
  }

  // Show contact options bottom sheet
  void _showContactOptions(Map<String, dynamic> contact) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (context) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Handle bar
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),

                // Contact info header
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(contact['avatar']),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            contact['name'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            contact['phone'],
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Divider(),

                // Action options
                _buildBottomSheetOption(
                  icon: Icons.video_call,
                  label: 'Video Call',
                  color: Colors.green,
                  onTap: () => Navigator.pop(context),
                ),
                _buildBottomSheetOption(
                  icon: Icons.message,
                  label: 'Send Message',
                  color: Colors.blue,
                  onTap: () => Navigator.pop(context),
                ),
                _buildBottomSheetOption(
                  icon: Icons.edit,
                  label: 'Edit Contact',
                  color: Colors.orange,
                  onTap: () => Navigator.pop(context),
                ),
                _buildBottomSheetOption(
                  icon: Icons.share,
                  label: 'Share Contact',
                  color: Colors.purple,
                  onTap: () => Navigator.pop(context),
                ),
                _buildBottomSheetOption(
                  icon: Icons.delete,
                  label: 'Delete Contact',
                  color: Colors.red,
                  onTap: () => Navigator.pop(context),
                ),
                _buildBottomSheetOption(
                  icon: Icons.block,
                  label: 'Block Contact',
                  color: Colors.grey[700]!,
                  onTap: () => Navigator.pop(context),
                ),

                SizedBox(height: 20),
              ],
            ),
          ),)
        );
    }

  // Bottom sheet option item
  Widget _buildBottomSheetOption({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: color, size: 24),
      ),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
    );
  }
}