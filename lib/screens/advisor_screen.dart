import 'package:flutter/material.dart';

class AdvisorScreen extends StatefulWidget {
  const AdvisorScreen({super.key});

  @override
  State<AdvisorScreen> createState() => _AdvisorScreenState();
}

class _AdvisorScreenState extends State<AdvisorScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<ChatMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    _messages.add(
      ChatMessage(
        text: 'Hello! I\'m your AI assistant for finding the perfect senior community. '
            'I can help you with questions about amenities, care levels, costs, '
            'location preferences, and more. What would you like to know?',
        isBot: true,
        timestamp: DateTime.now(),
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    setState(() {
      _messages.add(
        ChatMessage(
          text: _messageController.text.trim(),
          isBot: false,
          timestamp: DateTime.now(),
        ),
      );
    });

    final userMessage = _messageController.text.trim();
    _messageController.clear();

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _messages.add(
          ChatMessage(
            text: _generateBotResponse(userMessage),
            isBot: true,
            timestamp: DateTime.now(),
          ),
        );
      });
      _scrollToBottom();
    });

    _scrollToBottom();
  }

  String _generateBotResponse(String userMessage) {
    final message = userMessage.toLowerCase();
    
    if (message.contains('cost') || message.contains('price') || message.contains('afford')) {
      return 'Senior community costs vary widely based on location, services, and level of care. '
          'Independent living typically ranges from \$1,500-\$4,000/month, while assisted living '
          'can range from \$3,000-\$6,000/month. I recommend contacting communities directly '
          'for specific pricing and financial assistance options.';
    } else if (message.contains('memory') || message.contains('dementia') || message.contains('alzheimer')) {
      return 'Memory care communities provide specialized services for residents with dementia '
          'or Alzheimer\'s. They offer secure environments, trained staff, structured activities, '
          'and personalized care plans. Look for communities with locked units, specialized programming, '
          'and staff trained in memory care techniques.';
    } else if (message.contains('pet') || message.contains('dog') || message.contains('cat')) {
      return 'Many senior communities are pet-friendly! Pet policies vary by community - some allow '
          'cats and small dogs, while others may have restrictions on size, breed, or number of pets. '
          'Some communities even have pet therapy programs. Be sure to ask about pet deposits, '
          'monthly fees, and vaccination requirements.';
    } else if (message.contains('visit') || message.contains('tour')) {
      return 'I highly recommend scheduling tours of any communities you\'re considering. '
          'Most communities offer guided tours where you can see living spaces, common areas, '
          'and meet staff. Try to visit during meal times or activities to get a feel for '
          'the community atmosphere. Don\'t hesitate to ask questions about services, costs, and policies.';
    } else if (message.contains('food') || message.contains('meal') || message.contains('dining')) {
      return 'Dining is an important aspect of senior community life! Most communities offer '
          'restaurant-style dining with chef-prepared meals, dietary accommodations, and flexible '
          'meal plans. Look for communities with varied menus, fresh ingredients, and options '
          'for special diets. Some also offer cooking classes and community gardens.';
    } else {
      return 'That\'s a great question! Based on your search criteria, I\'d suggest looking for '
          'communities that match your specific needs regarding location, budget, and required '
          'services. Would you like me to help you refine your search or provide more information '
          'about a specific aspect of senior living?';
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'AI Assistant',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade800,
                ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Card(
              elevation: 2,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.all(16),
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        return _buildMessageBubble(_messages[index]);
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _messageController,
                            decoration: const InputDecoration(
                              hintText: 'Ask me about senior communities...',
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                            ),
                            onSubmitted: (_) => _sendMessage(),
                            maxLines: null,
                          ),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: _sendMessage,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade800,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                          child: const Text('Send'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessage message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment:
            message.isBot ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          if (message.isBot)
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.blue.shade800,
              child: const Icon(
                Icons.smart_toy,
                size: 18,
                color: Colors.white,
              ),
            ),
          const SizedBox(width: 8),
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: message.isBot ? Colors.grey.shade100 : Colors.blue.shade800,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  color: message.isBot ? Colors.black87 : Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          if (!message.isBot) const SizedBox(width: 8),
          if (!message.isBot)
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey.shade400,
              child: const Icon(
                Icons.person,
                size: 18,
                color: Colors.white,
              ),
            ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isBot;
  final DateTime timestamp;

  ChatMessage({
    required this.text,
    required this.isBot,
    required this.timestamp,
  });
}