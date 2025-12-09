import 'package:flutter/material.dart';

class UpcomingSessionPage extends StatelessWidget {
  final Map<String, dynamic> subject;

  const UpcomingSessionPage({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${subject['name']} Session"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SUBJECT INFO
            Text(
              subject['name'],
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text("Schedule: ${subject['schedule']}"),
            Text("Section: ${subject['section']}"),
            Text("Join Code: ${subject['joinCode']}"), // ✔ correct join code

            const SizedBox(height: 25),

            // SESSION OVERVIEW TITLE
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "Session Overview",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),

            const Text(
              "Quick stats for this class meeting",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            // ATTENDANCE RATE CONTAINER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.black12,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: const Text(
                "Attendance Rate: 0%",
                style: TextStyle(fontSize: 18),
              ),
            ),

            const SizedBox(height: 15),

            // ABSENCES CONTAINER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.black12,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: const Text(
                "Absences: 0",
                style: TextStyle(fontSize: 18),
              ),
            ),

            const SizedBox(height: 25),

            // ATTENDANCE BY STUDENT
            const Text(
              "Attendance by Student",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text("Full roster for this session"),

            const SizedBox(height: 15),

            // EMPTY PLACEHOLDER LIST
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "No students yet.",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
