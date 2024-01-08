import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no/domain/entities/message.dart';
import 'package:yes_no/presentation/providers/chat_provider.dart';
import 'package:yes_no/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no/presentation/widgets/chat/message_fiel_box.dart';
import 'package:yes_no/presentation/widgets/chat/my_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Scaffold(
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(3),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://styles.redditmedia.com/t5_6z6u6o/styles/communityIcon_knausi6a8il91.png'),
            ),
          ),
          title: const Text('MI LOVE'),
        ),
        body: _ChatView(),
      ),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];
                return (message.fromWho == FromWho.hers)
                    ?  const HerMessageBubble()
                    :  Mymessagebubble(message: message,);
              },
            )),
             MessageFieldBox(
              onValue: (value)=>chatProvider.sendMessage(value),
             ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
