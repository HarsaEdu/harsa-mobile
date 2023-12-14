import 'package:flutter/material.dart';

class KelasCard extends StatelessWidget {
  const KelasCard({
    super.key,
    this.classImage,
    required this.className,
    required this.mentorName,
    this.progress,
    this.dueDate,
    this.button,
  });

  final String? classImage;
  final String className;
  final String mentorName;
  final double? progress;
  final String? dueDate;
  final String? button;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF092C4C),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              classImage == null
                  ? const SizedBox()
                  : CircleAvatar(
                      radius: screenWidth / 20,
                      child: CircleAvatar(
                        radius: screenWidth / 20 - 1,
                        backgroundImage: NetworkImage(classImage!),
                      ),
                    ),
              SizedBox(width: classImage == null ? 0 : 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      className,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      mentorName,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: dueDate == null && progress != null ? 16 : 0),
          progress == null
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '${progress!.round()}%',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
          progress == null
              ? const SizedBox()
              : LinearProgressIndicator(
                  value: progress! < 4 && progress! > 0 ? .04 : progress! / 100,
                  minHeight: 12,
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.red,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(Color(0xFFF2994A)),
                  backgroundColor: const Color(0xFFF6F6F6),
                ),
          dueDate == null
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      dueDate!,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
          button == null
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.fromLTRB(8, 18, 8, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: Text(
                          button!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF222222),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
