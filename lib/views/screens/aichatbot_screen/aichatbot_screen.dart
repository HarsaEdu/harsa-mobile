import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harsa_mobile/utils/constants/aichatbot_screen_constants.dart';
import 'package:harsa_mobile/viewmodels/aichatbot_provider.dart';
import 'package:provider/provider.dart';

class AIChatbotScreen extends StatefulWidget {
  const AIChatbotScreen({super.key});

  @override
  State<AIChatbotScreen> createState() => _AIChatbotScreenState();
}

class _AIChatbotScreenState extends State<AIChatbotScreen> {
  @override
  void initState() {
    final provider = Provider.of<AIChatbotProvider>(context, listen: false);
    provider.topicController = TextEditingController();
    provider.chatController = TextEditingController();
    provider.topicFormKey = GlobalKey();
    provider.chatFormKey = GlobalKey();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: screenHeight / 10, // appbar total height
        title: const Text(
          "AI Chat",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFFD9D9D9),
            ),
          ),
        ),
        scrolledUnderElevation:
            0, // disable appbar background color changes on scroll
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        width: screenWidth,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Provider.of<AIChatbotProvider>(context, listen: false)
                              .closeDrawer(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 28,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFFD9D9D9),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Row(
                            children: <Widget>[
                              Icon(Icons.add),
                              SizedBox(width: 20),
                              Text(
                                "Buat Chat Baru",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 18),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 28,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFFD9D9D9),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.close),
                      ),
                    ),
                  ],
                ),
                Consumer<AIChatbotProvider>(builder: (context, state, _) {
                  return Column(
                    children: <Widget>[
                      for (String topic in state.topics)
                        Column(
                          children: <Widget>[
                            const SizedBox(height: 8),
                            GestureDetector(
                              onTap: topic == state.activeTopic
                                  ? null
                                  : () {
                                      state.tapTopic(context, topic);
                                    },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 16,
                                ),
                                decoration: BoxDecoration(
                                    color: topic == state.activeTopic
                                        ? const Color(0xFF092C4C)
                                        : Colors.transparent,
                                    border: Border.all(
                                      color: const Color(0xFFD9D9D9),
                                    ),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.chat,
                                      color: topic == state.activeTopic
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                    const SizedBox(width: 24),
                                    Expanded(
                                      child: Text(
                                        topic,
                                        style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          color: topic == state.activeTopic
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    topic == state.activeTopic
                                        ? Row(
                                            children: <Widget>[
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                      content: Text("edit"),
                                                    ),
                                                  );
                                                },
                                                child: SvgPicture.asset(
                                                  'assets/icons/outline/square_and_pencil.svg',
                                                  colorFilter:
                                                      const ColorFilter.mode(
                                                    Colors.white,
                                                    BlendMode.srcIn,
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () =>
                                                    state.deleteTopic(topic),
                                                child: SvgPicture.asset(
                                                  'assets/icons/outline/trash.svg',
                                                  colorFilter:
                                                      const ColorFilter.mode(
                                                    Colors.white,
                                                    BlendMode.srcIn,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : const SizedBox()
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
      body: Consumer<AIChatbotProvider>(
        builder: (context, state, _) {
          return Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: <Widget>[
                    const Center(
                      child: Icon(
                        Icons.chat,
                        color: Color(0xFFD9D9D9),
                        size: 200,
                      ),
                    ),
                    state.screen == AIChatBotScreen.suggestion
                        ? Align(
                            alignment: Alignment.bottomCenter,
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  for (Map<String, String> s
                                      in state.suggestions)
                                    GestureDetector(
                                      onTap: () => state.tapSuggestion(s),
                                      child: Container(
                                        margin: const EdgeInsets.only(top: 8),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 8,
                                          horizontal: 16,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.white,
                                          border: Border.all(
                                            color: const Color(0xFFD9D9D9),
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              s["title"]!,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              s["subtitle"]!,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          )
                        : state.screen == AIChatBotScreen.chat
                            ? ListView.builder(
                                itemCount: state.userChats.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(18),
                                        color: const Color(0xFFF6F6F6),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            CircleAvatar(
                                              radius: screenWidth / 20,
                                              backgroundColor:
                                                  const Color.fromRGBO(
                                                      0, 0, 0, .2),
                                              child: CircleAvatar(
                                                radius: screenWidth / 20 - 1,
                                                backgroundImage:
                                                    const NetworkImage(
                                                  "https://picsum.photos/80",
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 18),
                                            Expanded(
                                              child: Text(
                                                state.userChats[index],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Divider(
                                        height: 1,
                                        thickness: 1,
                                        color: Color.fromRGBO(0, 0, 0, .2),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(18),
                                        color: Colors.white,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            CircleAvatar(
                                              radius: screenWidth / 20,
                                              backgroundColor:
                                                  const Color.fromRGBO(
                                                      0, 0, 0, .2),
                                              child: CircleAvatar(
                                                radius: screenWidth / 20 - 1,
                                                backgroundImage:
                                                    const AssetImage(
                                                  'assets/images/Logo_Harsa.png',
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 18),
                                            Expanded(
                                              child: Text(
                                                state.aiResponses[index],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Divider(
                                        height: 1,
                                        thickness: 1,
                                        color: Color.fromRGBO(0, 0, 0, .2),
                                      )
                                    ],
                                  );
                                },
                              )
                            : const SizedBox(),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: state.screen == AIChatBotScreen.topic
                      ? Border.all(
                          color: const Color(0xFFD9D9D9),
                        )
                      : const BorderDirectional(
                          top: BorderSide(
                            color: Color(0xFFD9D9D9),
                          ),
                        ),
                ),
                padding: const EdgeInsets.all(18),
                child: state.screen == AIChatBotScreen.topic
                    ? Form(
                        key: state.topicFormKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: state.topicController,
                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  borderSide: BorderSide(
                                    color: Color(0xFFCCCDCE),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  borderSide: BorderSide(
                                    color: Color(0xFFCCCDCE),
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  borderSide: BorderSide(
                                    color: Color(0xFFFFCDCE),
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  borderSide: BorderSide(
                                    color: Color(0xFFFFCDCE),
                                  ),
                                ),
                                hintText: "Masukkan Topik",
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 14,
                                  horizontal: 16,
                                ),
                                hintStyle: TextStyle(
                                  color: Color(0xFF999999),
                                ),
                              ),
                              validator: (value) => state.validateTopic(value),
                            ),
                            SizedBox(height: screenHeight / 50),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ElevatedButton(
                                  onPressed: state.submitTopic,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF104F89),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  child: const Text("Buat Topik"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : Form(
                        key: state.chatFormKey,
                        child: Stack(
                          children: <Widget>[
                            TextFormField(
                              controller: state.chatController,
                              decoration: InputDecoration(
                                hintText: "Ask Me Anything",
                                hintStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF999999),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9999),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFCCCDCE),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9999),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFCCCDCE),
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9999),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFFFCDCE),
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9999),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFFFCDCE),
                                  ),
                                ),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(20, 0, 48, 0),
                              ),
                              validator: (value) => state.validateChat(value),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                onPressed: state.submitChat,
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(0),
                                  backgroundColor: Colors.transparent,
                                ),
                                child: SvgPicture.asset(
                                  "assets/icons/outline/paperplane.svg",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
              Container(
                color: state.screen == AIChatBotScreen.topic
                    ? Colors.transparent
                    : Colors.white,
                child: Padding(
                  padding: state.screen == AIChatBotScreen.topic
                      ? const EdgeInsets.all(18)
                      : const EdgeInsets.fromLTRB(18, 0, 18, 18),
                  child: const Text(
                    'AI Chatbot dapat membuat kesalahan. Pertimbangkan untuk memeriksa informasi penting.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF8E8E8E),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
