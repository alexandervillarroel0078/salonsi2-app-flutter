// lib/screens/chat_screen.dart
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat con el salón'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Column(
        children: [
          // Lista de mensajes simulados
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                ChatBubble(
                  message: '¡Hola! ¿En qué podemos ayudarte hoy?',
                  isSender: false,
                ),
                ChatBubble(
                  message: 'Quisiera agendar una cita para el sábado',
                  isSender: true,
                ),
                ChatBubble(
                  message: 'Claro, ¿a qué hora te gustaría?',
                  isSender: false,
                ),
              ],
            ),
          ),
          // Campo de entrada de mensaje
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Escribe tu mensaje...',
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: Colors.pinkAccent,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSender;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isSender,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        margin: const EdgeInsets.symmetric(vertical: 5),
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
        decoration: BoxDecoration(
          color: isSender ? Colors.pinkAccent : Colors.grey[300],
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isSender ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
