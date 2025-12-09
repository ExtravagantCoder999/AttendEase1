import 'package:flutter/material.dart';

class SubjectCreatedPage extends StatelessWidget {
  final String subjectName;
  final String subjectCode;
  final String section;
  final String schedule;

  const SubjectCreatedPage({
    super.key,
    required this.subjectName,
    required this.subjectCode,
    required this.section,
    required this.schedule,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Subject Created"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Your new subject is ready. Next, add students and schedule sessions.",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              const SizedBox(height: 25),

              // SUBJECT INFO CONTAINER
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Subject: $subjectName",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 6),
                    Text("Code: $subjectCode",
                        style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 6),
                    Text("Section: $section",
                        style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 6),
                    Text("Schedule: $schedule",
                        style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // NEXT STEPS
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Next Step",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Set up the class for attendance",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Add students to this subject"),
                    ),
                    const SizedBox(height: 12),

                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Schedule first class session"),
                    ),
                    const SizedBox(height: 12),

                    TextButton(
                      onPressed: () {
                        // Send subject back to dashboard
                        Navigator.pop(context, {
                          'name': subjectName,
                          'code': subjectCode,
                          'section': section,
                          'schedule': schedule,
                        });
                      },
                      child: const Text(
                        "Back to dashboard",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
