import 'package:chat_app/chatmessage.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _textcontroller = TextEditingController();
  List<chatmessage> _messages = <chatmessage>[];


  void _handlesubmitted(String text){
    _textcontroller.clear();
    chatmessage message = chatmessage(text: text,);
    setState(() {
      _messages.insert(0, message);
    });

  }
  Widget _textComposer(){
    return IconTheme(
      data: IconThemeData(
        color: Colors.amber
      ),
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
          decoration: InputDecoration.collapsed(hintText: 'send a message'),
          controller: _textcontroller,
          onSubmitted: _handlesubmitted,
        ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(icon: Icon(Icons.send), onPressed:
              () => _handlesubmitted(_textcontroller.text))
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
         children: <Widget>[
           Flexible(
             child: ListView.builder(padding: EdgeInsets.all(8.0),
             reverse: true,
             itemBuilder: (_,int index) => _messages[index],
             itemCount: _messages.length,
             ),
           ),
           Divider(height: 1.0,),
           Container(decoration:
           BoxDecoration(color: Theme.of(context).cardColor
           ),
           child: _textComposer(),
           ),
         ],
       );
  }
}