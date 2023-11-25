import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class ConfirmationDialog {
  static Future<void> show(
    BuildContext context, {
    required String title,
    required String content,
    required VoidCallback onConfirm,
    required VoidCallback onCancel,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            decoration: BoxDecoration(
              color: ColorsPallete.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: ColorsPallete.grey),
            ),
            child: Wrap(
              alignment: WrapAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      Text(content),
                      const SizedBox(height: 6),
                      const Icon(Icons.help_outline,
                          size: 64.0, color: ColorsPallete.sandyBrown),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () => onCancel(),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(color: ColorsPallete.grey),
                              right: BorderSide(color: ColorsPallete.grey),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Batal',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () => onConfirm(),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            color: ColorsPallete.sandyBrown,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(8)),
                            border: Border(
                              top: BorderSide(color: ColorsPallete.sandyBrown),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Simpan',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
