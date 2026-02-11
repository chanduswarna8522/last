// Vibe Mode Screen - Anonymous nickname-based chat UI
import 'package:flutter/material.dart';
import '../models/message_model.dart';
import '../utils/theme.dart';
import '../widgets/chat_bubble.dart';

class VibeModeScreen extends StatefulWidget {
  const VibeModeScreen({super.key});

  @override
  State<VibeModeScreen> createState() => _VibeModeScreenState();
}

class _VibeModeScreenState extends State<VibeModeScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<MessageModel> _messages = [];
  final String _myNickname = 'VibeMaster';
  final String _theirNickname = 'VibeSeeker';
  
  final List<String> _intentChips = [
    'Cuffing',
    'Situationship',
    'Something Casual',
    'Serious Relationship',
    'Just Friends',
    'Exploring',
  ];

  @override
  void initState() {
    super.initState();
    // Load dummy messages
    _messages.addAll(DummyMessages.vibeModeMessages);
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;
    
    final message = MessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: 'me',
      senderName: _myNickname,
      content: _messageController.text.trim(),
      timestamp: DateTime.now(),
    );
    
    setState(() {
      _messages.add(message);
    });
    
    _messageController.clear();
    
    // Simulate reply after delay
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _messages.add(MessageModel(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            senderId: 'other',
            senderName: _theirNickname,
            content: 'That\'s interesting! Tell me more 😊',
            timestamp: DateTime.now(),
          ));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.surfaceColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppTheme.darkBackground,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: AppTheme.primaryText,
                          ),
                        ),
                      ),
                      
                      const SizedBox(width: 16),
                      
                      // Anonymous Avatar
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: AppTheme.primaryGradient,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: Text(
                            'VS',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      
                      const SizedBox(width: 12),
                      
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _theirNickname,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.primaryText,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                const Text(
                                  'Online',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppTheme.secondaryText,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      
                      // Demo Badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Demo',
                          style: TextStyle(
                            fontSize: 11,
                            color: AppTheme.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Intent Chips
                  SizedBox(
                    height: 36,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _intentChips.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          decoration: BoxDecoration(
                            color: index == 2 
                                ? AppTheme.secondaryColor.withOpacity(0.3)
                                : AppTheme.darkBackground,
                            borderRadius: BorderRadius.circular(18),
                            border: index == 2
                                ? Border.all(
                                    color: AppTheme.secondaryColor,
                                    width: 1,
                                  )
                                : null,
                          ),
                          child: Center(
                            child: Text(
                              _intentChips[index],
                              style: TextStyle(
                                fontSize: 12,
                                color: index == 2
                                    ? AppTheme.secondaryColor
                                    : AppTheme.secondaryText,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            
            // Chat Messages
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return AnonymousChatBubble(
                    message: message,
                    isMe: message.senderId == 'me',
                    nickname: message.senderId == 'me' ? _myNickname : _theirNickname,
                  );
                },
              ),
            ),
            
            // Auto-delete Notice
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.timer_outlined,
                    size: 16,
                    color: Colors.orange.withOpacity(0.8),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Chats auto-delete in 7 days',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.orange.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
            
            // Message Input
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.surfaceColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        hintStyle: const TextStyle(
                          color: AppTheme.mutedText,
                        ),
                        filled: true,
                        fillColor: AppTheme.darkBackground,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                      ),
                      style: const TextStyle(
                        color: AppTheme.primaryText,
                      ),
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  
                  const SizedBox(width: 12),
                  
                  GestureDetector(
                    onTap: _sendMessage,
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        gradient: AppTheme.primaryGradient,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
