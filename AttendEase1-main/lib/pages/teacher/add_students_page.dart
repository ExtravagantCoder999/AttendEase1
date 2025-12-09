import 'package:flutter/material.dart';
import 'dart:math';

class AddStudentsPage extends StatefulWidget {
  final String subjectName;
  final String subjectCode;
  final String section;
  final String schedule;

  const AddStudentsPage({
    super.key,
    required this.subjectName,
    required this.subjectCode,
    required this.section,
    required this.schedule,
  });

  @override
  State<AddStudentsPage> createState() => _AddStudentsPageState();
}

class _AddStudentsPageState extends State<AddStudentsPage> {
  final studentIdCtrl = TextEditingController();
  List<String> studentList = [];

  late String joinCode;

  @override
  void initState() {
    super.initState();
    // Generate dummy join code for example
    joinCode = "${widget.subjectCode}-${Random().nextInt(9999).toString().padLeft(4, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Students"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Subject Info
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.subjectName,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    Text("Code: ${widget.subjectCode}"),
                    Text("Section: ${widget.section}"),
                    Text("Schedule: ${widget.schedule}"),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              // Share Join Code
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
                      "Share Join Code",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "Students self-enroll using this code or link",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        joinCode,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              // Add Student Manually
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
                      "Add Student Manually",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: studentIdCtrl,
                      decoration: const InputDecoration(
                        labelText: "Student ID",
                        hintText: "Enter student ID (ex: 20-1234-567)",
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {
                        if (studentIdCtrl.text.isNotEmpty) {
                          setState(() {
                            studentList.add(studentIdCtrl.text);
                            studentIdCtrl.clear();
                          });
                        }
                      },
                      child: const Text("Add to List"),
                    ),
                    const SizedBox(height: 12),

                    // List of students
                    if (studentList.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Students Added:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 6),
                          ...studentList.map((s) => Padding(
                                padding: const EdgeInsets.symmetric(vertical: 2),
                                child: Text(s),
                              )),
                        ],
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              // Save Button
              ElevatedButton(
                onPressed: () {
                  // TODO: Save students to subject (backend)
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Students saved!")),
                  );
                },
                child: const Text("Save"),
              ),
              const SizedBox(height: 12),

              // Skip Button
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Skip now, I'll add students later",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
