import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final channel =
      IOWebSocketChannel.connect('wss://socketsbay.com/wss/v2/1/demo/');
  String textMessage = "";

  @override
  initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      startStream();
    });
    super.initState();
  }

  startStream() {
    channel.stream.listen((message) {
      textMessage = message;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(textMessage),
      ),
    );
  }
}
