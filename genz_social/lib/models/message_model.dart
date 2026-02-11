// Message Model - For chat functionality
class MessageModel {
  final String id;
  final String senderId;
  final String senderName;
  final String content;
  final DateTime timestamp;
  final bool isRead;
  final MessageType type;
  
  MessageModel({
    required this.id,
    required this.senderId,
    required this.senderName,
    required this.content,
    required this.timestamp,
    this.isRead = false,
    this.type = MessageType.text,
  });
}

enum MessageType { text, image, voice }

// Dummy Messages for Random Chat
class DummyMessages {
  static List<MessageModel> get randomChatMessages => [
    MessageModel(
      id: '1',
      senderId: 'other',
      senderName: 'MysteryPerson',
      content: 'Hey there! 👋',
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      isRead: true,
    ),
    MessageModel(
      id: '2',
      senderId: 'me',
      senderName: 'You',
      content: 'Hi! How\'s it going?',
      timestamp: DateTime.now().subtract(const Duration(minutes: 4)),
      isRead: true,
    ),
    MessageModel(
      id: '3',
      senderId: 'other',
      senderName: 'MysteryPerson',
      content: 'Pretty good! Just exploring this random chat feature 😄',
      timestamp: DateTime.now().subtract(const Duration(minutes: 3)),
      isRead: true,
    ),
    MessageModel(
      id: '4',
      senderId: 'me',
      senderName: 'You',
      content: 'Same here! It\'s pretty cool to chat anonymously',
      timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
      isRead: true,
    ),
    MessageModel(
      id: '5',
      senderId: 'other',
      senderName: 'MysteryPerson',
      content: 'So, what brings you to this app?',
      timestamp: DateTime.now().subtract(const Duration(minutes: 1)),
      isRead: false,
    ),
  ];
  
  static List<MessageModel> get vibeModeMessages => [
    MessageModel(
      id: '1',
      senderId: 'other',
      senderName: 'VibeSeeker',
      content: 'Hey! I see we matched on vibes ✨',
      timestamp: DateTime.now().subtract(const Duration(hours: 1)),
      isRead: true,
    ),
    MessageModel(
      id: '2',
      senderId: 'me',
      senderName: 'You',
      content: 'Yes! Your intent tag caught my attention 😊',
      timestamp: DateTime.now().subtract(const Duration(minutes: 45)),
      isRead: true,
    ),
    MessageModel(
      id: '3',
      senderId: 'other',
      senderName: 'VibeSeeker',
      content: 'Haha, thanks! I\'m really looking for something genuine',
      timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
      isRead: true,
    ),
    MessageModel(
      id: '4',
      senderId: 'me',
      senderName: 'You',
      content: 'Same here! Tell me more about yourself',
      timestamp: DateTime.now().subtract(const Duration(minutes: 15)),
      isRead: true,
    ),
  ];
}
