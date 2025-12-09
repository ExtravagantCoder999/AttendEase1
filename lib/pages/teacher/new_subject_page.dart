import 'package:flutter/material.dart';

class NewSubjectPage extends StatefulWidget {
  const NewSubjectPage({super.key});

  @override
  State<NewSubjectPage> createState() => _NewSubjectPageState();
}

class _NewSubjectPageState extends State<NewSubjectPage> {
  final subjectNameCtrl = TextEditingController();
  final subjectCodeCtrl = TextEditingController();
  final sectionCtrl = TextEditingController();
  final scheduleCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Subject"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Top description
              const Text(
                "Set up a new class for attendance and scheduling",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              const SizedBox(height: 25),

              // Subject Details
              const Text(
                "Subject Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              // Subject Name
              const Text(
                "Subject Name",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 6),
              TextField(
                controller: subjectNameCtrl,
                decoration: const InputDecoration(
                  hintText: "Enter subject name...",
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "This name is visible to students.",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 20),

              // Row for Subject Code + Section
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Subject Code"),
                        SizedBox(height: 6),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Section"),
                        SizedBox(height: 6),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: subjectCodeCtrl,
                      decoration: const InputDecoration(
                        hintText: "ex: IT101",
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      controller: sectionCtrl,
                      decoration: const InputDecoration(
                        hintText: "ex: 1A",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              const Text(
                "Short code for the class.",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 20),

              // Schedule field
              const Text(
                "Schedule",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 6),
              TextField(
                controller: scheduleCtrl,
                decoration: const InputDecoration(
                  hintText: "ex: Monday & Wednesday 10:00AM - 12:00PM",
                ),
              ),
              const SizedBox(height: 30),

              // Buttons
              ElevatedButton(
                onPressed: () {
                  // Pass created subject back to dashboard
                  Navigator.pushNamed(
                    context,
                    '/teacher/subject_created',
                    arguments: {
                      'name': subjectNameCtrl.text,
                      'code': subjectCodeCtrl.text,
                      'section': sectionCtrl.text,
                      'schedule': scheduleCtrl.text,
                    },
                  ).then((value) {
                    if (value != null) {
                      Navigator.pop(context, value);
                    }
                  });
                },
                child: const Text("Create Subject"),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
