import 'package:flutter/material.dart';
import 'package:tolker/chatpage.dart';



class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/dp1.jpeg'), // Replace with your own image asset
            ),
            SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Susan James'),
                Text(
                  'Online',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ],
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF7F00FF), Color(0xFFE100FF)], // Adjust these colors as needed
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
           Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatListPage(),
          ),
        );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {
              // Add your call action here
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Add your more action here
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildChatBubble(
                  'so, you can go?',
                  '10:33:43',
                  'assets/images/dp1.jpeg', // Replace with your own image asset
                  isMe: false,
                ),
                _buildChatBubble(
                  'I\'ll try',
                  '10:35:21',
                  'assets/images/dp2.jpeg', // Replace with your own image asset
                  isMe: true,
                ),
                _buildChatBubble(
                  'Ok let me know',
                  '10:38:57',
                  'assets/images/dp1.jpeg', // Replace with your own image asset
                  isMe: false,
                ),
                _buildChatBubble(
                  'yes',
                  '10:40:05',
                  'assets/images/dp2.jpeg', // Replace with your own image asset
                  isMe: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                FloatingActionButton(
                  onPressed: () {
                    // Add your send message action here
                  },
                  child: Icon(Icons.send),
                  backgroundColor: Color(0xFF7F00FF),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatBubble(String message, String time, String imagePath, {bool isMe = false}) {
    final radius = Radius.circular(12.0);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          if (!isMe)
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 20.0,
            ),
          if (!isMe) SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                decoration: BoxDecoration(
                  color: isMe ? Color(0xFF7F00FF) : Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: radius,
                    topRight: radius,
                    bottomLeft: isMe ? radius : Radius.zero,
                    bottomRight: isMe ? Radius.zero : radius,
                  ),
                ),
                child: Text(
                  message,
                  style: TextStyle(
                    color: isMe ? Colors.white : Colors.black87,
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                time,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
          if (isMe) SizedBox(width: 10.0),
          if (isMe)
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 20.0,
            ),
        ],
      ),
    );
  }
}
