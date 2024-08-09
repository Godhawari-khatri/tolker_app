import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tolker/chatscreen.dart';

class ChatListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Add your menu action here
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Add your search action here
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No chats available.'));
          }

          final users = snapshot.data!.docs;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              final userData = user.data() as Map<String, dynamic>?; // Cast to Map<String, dynamic>?

              // Detailed logging to see what data is being retrieved
              print('User data: $userData');

              final name = userData?['name'] ?? 'Unknown';
              final status = userData?['status'] ?? 'No status';
              final imageUrl = userData?['profileImageUrl'] ?? 'assets/images/dp5.jpeg'; // Default image if none provided
              final time = '12:00'; // Replace with actual timestamp if available

              // Log to verify imageUrl
              print('User: $name, Image URL: $imageUrl');

              return _buildChatItem(
                context,
                name,
                status,
                time,
                imageUrl,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your action here
        },
        child: Icon(Icons.message),
        backgroundColor: Color(0xFF7F00FF),
      ),
    );
  }

  Widget _buildChatItem(BuildContext context, String name, String status, String time, String imageUrl) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: imageUrl.startsWith('http')
            ? NetworkImage(imageUrl)
            : AssetImage(imageUrl) as ImageProvider,
      ),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFF7F00FF),
        ),
      ),
      subtitle: Text(status),
      trailing: Text(time),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(),
          ),
        );
      },
    );
  }
}
