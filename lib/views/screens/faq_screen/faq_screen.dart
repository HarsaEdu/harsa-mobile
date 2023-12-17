import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:harsa_mobile/models/faq_models/faq_models.dart';
import 'package:provider/provider.dart';
import '../../../viewmodels/faq_screen_provider.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<FaqScreenProvider>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 16),
            Row(
              children: [
                GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(Icons.arrow_back_ios)),
                const SizedBox(width: 12),
                Text(
                  'FAQ',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              focusNode: controller.focusNode,
              decoration: InputDecoration(
                fillColor: Colors.grey[200],
                labelText: controller.focusNode.hasFocus ? '' : 'Search...',
                filled: true,
                suffixIcon: const Icon(
                  Icons.search,
                  size: 32,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
              ),
              onChanged: (value) {
                controller.searchFaq(value);
              },
            ),
            const SizedBox(height: 16),
            Consumer<FaqScreenProvider>(
              builder: (context, prov, _) => Visibility(
                visible: !prov.focusNode.hasFocus,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Text(
                    'Frequently Asked Question',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Consumer<FaqScreenProvider>(
              builder: (context, prov, _) {
                bool isShow =
                    !prov.focusNode.hasFocus || prov.searchQuery.isNotEmpty;
                bool hasData = prov.filteredData.isNotEmpty;
                return Visibility(
                  visible: isShow,
                  child: hasData
                      ? Expanded(
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                            itemCount: prov.filteredData.length,
                            itemBuilder: (context, index) {
                              Datum faq =
                                  prov.filteredData[index]; // Change this line
                              bool isExpanded = prov.isExpandedId == faq.id;
                              return ExpansionTile(
                                shape: const Border(),
                                title: isExpanded
                                    ? Text(
                                        faq.question,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                      )
                                    : Text(faq.question),
                                trailing: Icon(isExpanded
                                    ? Icons.expand_less
                                    : Icons.expand_more),
                                onExpansionChanged: (bool expanded) {
                                  if (expanded != isExpanded) {
                                    prov.togglePanelExpansion(faq.id);
                                  }
                                },
                                children: <Widget>[
                                  ListTile(
                                    title: Text(faq.answer),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) => const Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  'assets/icons/outline/search.svg'),
                              const SizedBox(height: 18),
                              Text(
                                'Data tidak ditemukan.',
                                style: Theme.of(context).textTheme.titleSmall,
                              )
                            ],
                          ),
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
