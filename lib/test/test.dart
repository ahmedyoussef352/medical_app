// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter/material.dart';

// class Test extends StatefulWidget {
//   const Test({super.key});

//   @override
//   State<Test> createState() => _TestState();
// }

// class _TestState extends State<Test> {
//   get flutterLocalNotificationsPlugin => null;

//   @override
//   Widget build(BuildContext context) {
//     Future<void> _showNotification() async {
//       const AndroidNotificationDetails androidPlatformChannelSpecifics =
//           AndroidNotificationDetails('your channel id', 'your channel name',
//               importance: Importance.max,
//               priority: Priority.high,
//               ticker: 'ticker');
//       const NotificationDetails platformChannelSpecifics =
//           NotificationDetails(android: androidPlatformChannelSpecifics);
//       await flutterLocalNotificationsPlugin.show(0, 'New Notification',
//           'You pressed the button!', platformChannelSpecifics,
//           payload: 'item x');
//     }

//     return Scaffold(
//         body: Center(
//       child: ElevatedButton(
//         onPressed: _showNotification,
//         child: const Text('Press me'),
//       ),
//     ));
//   }
// }

// ignore_for_file: library_private_types_in_public_api, depend_on_referenced_packages, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ChatMessage {
  int? id;
  String text;
  String senderId;
  String receiverId;
  DateTime timestamp;

  ChatMessage({
    this.id,
    required this.text,
    required this.senderId,
    required this.receiverId,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'senderId': senderId,
      'receiverId': receiverId,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  static ChatMessage fromMap(Map<String, dynamic> map) {
    return ChatMessage(
      id: map['id'],
      text: map['text'],
      senderId: map['senderId'],
      receiverId: map['receiverId'],
      timestamp: DateTime.parse(map['timestamp']),
    );
  }
}

class ChatScreen extends StatefulWidget {
  final String senderId;
  final String receiverId;

  const ChatScreen({super.key, required this.senderId, required this.receiverId});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _textEditingController = TextEditingController();
  List<ChatMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    _fetchMessages();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  Future<void> _fetchMessages() async {
    final Database db = await _openDatabase();
    final List<Map<String, dynamic>> maps = await db.query('messages');

    setState(() {
      _messages = List.generate(maps.length, (i) {
        return ChatMessage.fromMap(maps[i]);
      });
    });
  }

  Future<Database> _openDatabase() async {
    final String path = join(await getDatabasesPath(), 'chat.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE messages(id INTEGER PRIMARY KEY AUTOINCREMENT, text TEXT, senderId TEXT, receiverId TEXT, timestamp TEXT)',
        );
      },
    );
  }

  Future<void> _insertMessage(ChatMessage message) async {
    final Database db = await _openDatabase();
    await db.insert(
      'messages',
      message.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_messages[index].text),
                  subtitle: Text(_messages[index].timestamp.toString()),
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textEditingController,
                  decoration: const InputDecoration(hintText: 'Type a message'),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  ChatMessage message = ChatMessage(
                    text: _textEditingController.text.trim(),
                    senderId: widget.senderId,
                    receiverId: widget.receiverId,
                    timestamp: DateTime.now(),
                  );
                  _insertMessage(message);
                  setState(() {
                    _messages.add(message);
                  });
                  _textEditingController.clear();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}