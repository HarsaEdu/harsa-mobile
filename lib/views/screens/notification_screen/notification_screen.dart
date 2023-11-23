import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../viewmodels/inbox_provider.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<InboxProvider>(context, listen: false);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).padding.top),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
              child: Text(
                'Notifikasi',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey[200],
                        filled: true,
                        suffixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(width: 12),
                  const CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: TabBar(
                tabs: [
                  Tab(
                    child: Text(
                      'Inbox',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Arsip',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
                indicatorColor: Colors.grey,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabBarView(
                  children: <Widget>[
                    ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: controller.data!.data.length,
                      itemBuilder: (context, index) {
                        final inboxItem = controller.data!.data[index];
                        return Dismissible(
                          key: Key('item_${inboxItem.id}'),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(82, 172, 255, 100),
                            ),
                            margin: const EdgeInsets.all(4),
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Arsipkan',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                          onDismissed: (direction) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text('Item ${inboxItem.id} diarsipkan'),
                              ),
                            );
                          },
                          child: Card(
                            margin: const EdgeInsets.only(top: 4, bottom: 4),
                            color: const Color.fromRGBO(162, 210, 255, 100),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: const BorderSide(
                                color: Color.fromRGBO(82, 172, 255, 100),
                                width: 1,
                              ),
                            ),
                            elevation: 0,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Container(
                                    padding: const EdgeInsets.all(1),
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      backgroundImage: inboxItem.profilepic !=
                                              null
                                          ? NetworkImage(inboxItem.profilepic!)
                                          : null,
                                    ),
                                  ),
                                  title: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      inboxItem.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        inboxItem.subtitle,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8.0),
                                        child: Text(inboxItem.desc,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        final inboxItem = controller.data!.data[index];
                        return Dismissible(
                          key: Key('item_${inboxItem.id}'),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(242, 153, 74, 1),
                            ),
                            margin: const EdgeInsets.all(4),
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Keluarkan',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                          onDismissed: (direction) {
                            // Hapus item dari data Anda di sini
                            // Misalnya, jika Anda menggunakan list:
                            // setState(() => items.removeAt(index));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content:
                                      Text('Item ${inboxItem.id} dikeluarkan')),
                            );
                          },
                          child: Card(
                            margin: const EdgeInsets.only(top: 4, bottom: 4),
                            color: const Color.fromRGBO(254, 198, 149, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: const BorderSide(
                                  color: Color.fromRGBO(242, 153, 74, 1),
                                  width: 1,
                                )),
                            elevation: 0,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Container(
                                    padding: const EdgeInsets.all(1),
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      backgroundImage: inboxItem.profilepic !=
                                              null
                                          ? NetworkImage(inboxItem.profilepic!)
                                          : null,
                                    ),
                                  ),
                                  title: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      inboxItem.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        inboxItem.subtitle,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8.0),
                                        child: Text(inboxItem.desc,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
