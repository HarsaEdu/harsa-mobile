import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harsa_mobile/utils/constants/aichatbot_screen_constants.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';
import 'package:harsa_mobile/utils/constants/loading_state.dart';
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
    Provider.of<AIChatbotProvider>(context, listen: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Consumer<AIChatbotProvider>(builder: (context, state, _) {
      return PopScope(
        canPop: state.canPop,
        onPopInvoked: (didPop) => state.onBack(context, didPop),
        child: Scaffold(
          key: state.scaffoldKey,
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
            actions: [
              IconButton(
                onPressed: state.openDrawer,
                icon: const Icon(Icons.menu),
              ),
            ],
          ),
          // LIST OF CREATED THREADS
          endDrawer: Drawer(
            backgroundColor: Colors.white,
            width: screenWidth,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListView(
                  children: <Widget>[
                    // HEADER
                    Row(
                      children: <Widget>[
                        // BUAT CHAT BARU BUTTON
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Provider.of<AIChatbotProvider>(context,
                                      listen: false)
                                  .buatChatBaru(context);
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
                        // CLOSE BUTTON
                        GestureDetector(
                          onTap: () => state.closeDrawer(),
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
                    // LIST OF THREADS BODY
                    state.userThreadsModel == null
                        ? const SizedBox()
                        : Column(
                            children: <Widget>[
                              for (var thread in state.userThreadsModel!.data!)
                                // THREAD LIST ITEM
                                Column(
                                  children: <Widget>[
                                    const SizedBox(height: 8),
                                    GestureDetector(
                                      onTap: thread.id == state.activeThreadId
                                          ? null
                                          : () {
                                              state.tapTopic(
                                                context: context,
                                                topic: thread.topic,
                                                threadId: thread.id,
                                              );
                                            },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 20,
                                          horizontal: 16,
                                        ),
                                        decoration: BoxDecoration(
                                            color: thread.id ==
                                                    state.activeThreadId
                                                ? const Color(0xFF092C4C)
                                                : Colors.transparent,
                                            border: Border.all(
                                              color: const Color(0xFFD9D9D9),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Row(
                                          children: <Widget>[
                                            // CHAT ICON
                                            Icon(
                                              Icons.chat,
                                              color: thread.id ==
                                                      state.activeThreadId
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                            const SizedBox(width: 24),
                                            // THREAD TITLE / THREAD RENAME INPUT FIELD
                                            Expanded(
                                              child: state.isRenaming ==
                                                      thread.id
                                                  ? Form(
                                                      key: state.renameFormKey,
                                                      child: TextFormField(
                                                        controller: state
                                                            .renameController,
                                                        decoration:
                                                            const InputDecoration(
                                                          isDense: true,
                                                          border:
                                                              InputBorder.none,
                                                          contentPadding:
                                                              EdgeInsets.zero,
                                                          errorStyle: TextStyle(
                                                            fontSize: 0,
                                                            height: 0,
                                                          ),
                                                        ),
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                        focusNode:
                                                            state.renameNode,
                                                        cursorColor:
                                                            Colors.white,
                                                        cursorWidth: 2,
                                                        validator: (value) =>
                                                            state
                                                                .validateRename(
                                                                    value),
                                                      ),
                                                    )
                                                  : Text(
                                                      thread.topic,
                                                      style: TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        color: thread.id ==
                                                                state
                                                                    .activeThreadId
                                                            ? Colors.white
                                                            : Colors.black,
                                                      ),
                                                    ),
                                            ),
                                            const SizedBox(width: 10),
                                            // THREAD RENAME / DELETE / CONFIRM RENAME BUTTON
                                            thread.id == state.activeThreadId
                                                ? Row(
                                                    children: <Widget>[
                                                      state.isRenaming ==
                                                              state
                                                                  .activeThreadId
                                                          // CONFIRM RENAME BUTTON
                                                          ? Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(2),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () => state
                                                                    .submitRename(
                                                                  threadTitle:
                                                                      thread
                                                                          .topic,
                                                                  threadId: state
                                                                      .activeThreadId,
                                                                ),
                                                                child:
                                                                    const Icon(
                                                                  Icons.check,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            )
                                                          // RENAME BUTTON
                                                          : GestureDetector(
                                                              onTap: () {
                                                                state
                                                                    .renameThread(
                                                                  threadTitle:
                                                                      thread
                                                                          .topic,
                                                                  threadId:
                                                                      thread.id,
                                                                );
                                                              },
                                                              child: SvgPicture
                                                                  .asset(
                                                                'assets/icons/outline/square_and_pencil.svg',
                                                                colorFilter:
                                                                    const ColorFilter
                                                                        .mode(
                                                                  Colors.white,
                                                                  BlendMode
                                                                      .srcIn,
                                                                ),
                                                              ),
                                                            ),
                                                      state.isRenaming ==
                                                              state
                                                                  .activeThreadId
                                                          ? const SizedBox()
                                                          // DELETE THREAD BUTTON
                                                          : GestureDetector(
                                                              onTap: () {
                                                                state
                                                                    .deleteThread(
                                                                  threadId: state
                                                                      .activeThreadId,
                                                                );
                                                              },
                                                              child: SvgPicture
                                                                  .asset(
                                                                'assets/icons/outline/trash.svg',
                                                                colorFilter:
                                                                    const ColorFilter
                                                                        .mode(
                                                                  Colors.white,
                                                                  BlendMode
                                                                      .srcIn,
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
                          ),
                  ],
                ),
              ),
            ),
          ),
          body: Column(
            children: <Widget>[
              // CHAT BOX AREA
              Expanded(
                child: Stack(
                  children: <Widget>[
                    // CHAT ICON BACKGROUND
                    const Center(
                      child: Icon(
                        Icons.chat,
                        color: Color(0xFFD9D9D9),
                        size: 200,
                      ),
                    ),
                    // CHAT RECOMMENDATION SCREEN
                    state.threadChatsModel == null ||
                            state.threadChatsModel!.data!.isEmpty
                        ? Align(
                            alignment: Alignment.bottomCenter,
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.all(8),
                              child: state.chatLoadingState ==
                                      LoadingState.loading
                                  ? const Padding(
                                      padding: EdgeInsets.all(32),
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: ColorsPallete.prussianBlue,
                                        ),
                                      ),
                                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        for (Map<String, String> s
                                            in state.suggestions)
                                          GestureDetector(
                                            onTap: state.chatLoadingState ==
                                                    LoadingState.loading
                                                ? null
                                                : () => state.submitSuggestion(
                                                      suggestion:
                                                          "${s["title"]!} ${s["subtitle"]!}",
                                                      threadId:
                                                          state.activeThreadId,
                                                    ),
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.only(top: 8),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 8,
                                                horizontal: 16,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Colors.white,
                                                border: Border.all(
                                                  color:
                                                      const Color(0xFFD9D9D9),
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    s["title"]!,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
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
                        // CHAT ROOM SCREEN
                        : state.screen == AIChatBotScreen.chat
                            ? ListView(
                                children: <Widget>[
                                  for (var chat
                                      in state.threadChatsModel!.data!.reversed)
                                    Container(
                                      decoration: BoxDecoration(
                                        color: chat.role == "user"
                                            ? const Color(0xFFF6F6F6)
                                            : Colors.white,
                                        border: const Border(
                                          bottom: BorderSide(
                                            color: Color(0xFFF6F6F6),
                                          ),
                                        ),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 20,
                                        horizontal: 16,
                                      ),
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
                                                  chat.role == "user"
                                                      // USER PROFILE PICTURE
                                                      ? const NetworkImage(
                                                          "https://picsum.photos/80",
                                                        )
                                                      // HARSA PROFILE PICTURE
                                                      : const AssetImage(
                                                          'assets/images/Logo_Harsa.png',
                                                        ) as ImageProvider,
                                            ),
                                          ),
                                          const SizedBox(width: 18),
                                          Expanded(
                                            child: Text(
                                              chat.message,
                                              style: TextStyle(
                                                color: chat.role == "user"
                                                    ? const Color(0xFF222222)
                                                    : Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              )
                            : const SizedBox(),
                  ],
                ),
              ),
              // CHAT INPUT FIELDS AREA
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
                    // TOPIC INPUT FORM FIELD
                    ? Form(
                        key: state.topicFormKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: state.topicController,
                              cursorColor: ColorsPallete.prussianBlue,
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
                                  onPressed: state.chatLoadingState ==
                                          LoadingState.loading
                                      ? null
                                      : state.submitTopic,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF104F89),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  child: state.chatLoadingState ==
                                          LoadingState.loading
                                      ? Transform.scale(
                                          scale: 0.5,
                                          child:
                                              const CircularProgressIndicator(
                                            color: ColorsPallete.prussianBlue,
                                          ),
                                        )
                                      : const Text("Buat Topik"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    // CHAT INPUT FORM FIELD
                    : Form(
                        key: state.chatFormKey,
                        child: Stack(
                          children: <Widget>[
                            TextFormField(
                              controller: state.chatController,
                              cursorColor: ColorsPallete.prussianBlue,
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
                                onPressed: state.chatLoadingState ==
                                        LoadingState.loading
                                    ? null
                                    : () =>
                                        state.submitChat(state.activeThreadId),
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(0),
                                  backgroundColor: Colors.transparent,
                                  disabledBackgroundColor: Colors.transparent,
                                ),
                                child: state.chatLoadingState ==
                                        LoadingState.loading
                                    ? Transform.scale(
                                        scale: 0.5,
                                        child: const CircularProgressIndicator(
                                          color: ColorsPallete.prussianBlue,
                                        ),
                                      )
                                    : SvgPicture.asset(
                                        "assets/icons/outline/paperplane.svg",
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
              // AI REMINDER AREA
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
          ),
        ),
      );
    });
  }
}
