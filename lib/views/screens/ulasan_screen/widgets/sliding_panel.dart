import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/classes_models.dart/course_details_model.dart';
import 'package:harsa_mobile/viewmodels/kelas_provider.dart';
import 'package:provider/provider.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SlidingPanel extends StatelessWidget {
  final CourseDetailsData? course;

  const SlidingPanel({
    Key? key,
    this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<KelasProvider>(
      builder: (context, state, _) {
        return SlidingUpPanel(
          controller: state.panelController,
          maxHeight: 320,
          minHeight: 0,
          isDraggable: false,
          defaultPanelState: PanelState.OPEN,
          boxShadow: const [],
          panel: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Beri Ulasan',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () {
                        state.rate(index);
                      },
                      child: Icon(
                        index < state.rating ? Icons.star : Icons.star_border,
                        color: Colors.black,
                        size: 28,
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  key: UniqueKey(),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: state.ratingController,
                  maxLines: 5,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Tulis komentar Anda di sini...',
                    hintStyle: const TextStyle(fontSize: 12),
                  ),
                  validator: (value) => state.validateRating(value),
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsPallete.sandyBrown,
                        minimumSize: const Size(99, 26),
                      ),
                      onPressed: () {
                        state.submitMyFeedback(
                            courseId: course?.course.id ?? 0);
                      },
                      child: Text(
                        state.isUpdating ? "Update" : 'Kirim',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: Container(),
        );
      },
    );
  }
}
