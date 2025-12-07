import 'package:flutter/material.dart';

class TeacherDashboard extends StatefulWidget {
  const TeacherDashboard({super.key, this.teacherName = "Teacher"});

  final String teacherName;

  @override
  State<TeacherDashboard> createState() => _TeacherDashboardState();
}

class _TeacherDashboardState extends State<TeacherDashboard> {
  // Store created subjects in this list
  List<Map<String, String>> subjects = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teacher Dashboard - ${widget.teacherName}"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: "Logout",
            onPressed: () {
              // Navigate back to teacher login
              Navigator.pushReplacementNamed(context, '/teacher/teacher-login');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [

            // Welcome message
            Text(
              "Welcome, ${widget.teacherName}!",
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            // Create Subject Button
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.pushNamed(
                  context,
                  '/teacher/new_subject',
                );

                if (result != null && result is Map<String, String>) {
                  setState(() {
                    subjects.add({
                      'name': result['name']!,
                      'code': result['code']!,
                      'section': result['section']!,
                      'schedule': result['schedule']!,
                    });
                  });
                }
              },
              child: const Text("Create Subject"),
            ),
            const SizedBox(height: 30),

            // SUBJECT OVERVIEW
            const Text(
              "Subject Overview",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            subjects.isEmpty
                ? Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      "No subjects yet...",
                      style: TextStyle(color: Colors.black54),
                    ),
                  )
                : Column(
                    children: subjects.map((subj) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/teacher/add_students',
                            arguments: {
                              'name': subj['name']!,
                              'code': subj['code']!,
                              'section': subj['section']!,
                              'schedule': subj['schedule']!,
                            },
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(subj['name']!,
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600)),
                              const SizedBox(height: 6),
                              Text("Code: ${subj['code']}"),
                              Text("Section: ${subj['section']}"),
                              Text("Schedule: ${subj['schedule']}"),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),

            const SizedBox(height: 30),

            // UPCOMING SESSIONS
            const Text(
              "Upcoming Sessions",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            subjects.isEmpty
                ? Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      "No upcoming sessions...",
                      style: TextStyle(color: Colors.black54),
                    ),
                  )
                : Column(
                    children: subjects.map((subj) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/teacher/session_details',
                            arguments: {
                              'name': subj['name']!,
                              'code': subj['code']!,
                              'section': subj['section']!,
                              'schedule': subj['schedule']!,
                            },
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                subj['name']!,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text("Schedule: ${subj['schedule']}"),
                              Text("Join Code: ${subj['code']}"),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
          ],
        ),
      ),
    );
  }
}
