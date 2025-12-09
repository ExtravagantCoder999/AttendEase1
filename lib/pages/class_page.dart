import 'package:flutter/material.dart';
import '../models/class_info.dart';

class ClassPage extends StatefulWidget {
  final ClassInfo classInfo;
  final String teacherId;

  const ClassPage({super.key, required this.classInfo, required this.teacherId});

  @override
  _ClassPageState createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  // Sample student list
  final List<String> allStudents = const [
    "2010-0001 - Juan Dela Cruz",
    "2010-0002 - Maria Santos",
    "2010-0003 - Jose Rizal",
    "2010-0004 - Ana Reyes",
    "2010-0005 - Mark Lee",
  ];

  List<String> filteredStudents = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredStudents = allStudents;
    _searchController.addListener(_filterStudents);
  }

  void _filterStudents() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredStudents = allStudents
          .where((s) => s.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("${widget.classInfo.section} - ${widget.classInfo.subject}"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Class Info Card
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    const Icon(Icons.class_, size: 48, color: Colors.indigo),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "${widget.classInfo.section} - ${widget.classInfo.subject}",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 6),
                          Text("${widget.classInfo.room} • ${widget.classInfo.time}"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(height: 18),
            const Text("Today's Attendance",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            // Attendance counts
            Row(
              children: [
                _countCard("Present", widget.classInfo.present.toString(), Colors.green),
                const SizedBox(width: 8),
                _countCard("Absent", widget.classInfo.absent.toString(), Colors.red),
                const SizedBox(width: 8),
                _countCard("Excused", widget.classInfo.excused.toString(), Colors.orange),
              ],
            ),
            const SizedBox(height: 16),

            // QR Scanner Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.qr_code_scanner),
                label: const Text("Open QR Scanner"),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('QR Scanner not implemented yet.')));
                },
              ),
            ),
            const SizedBox(height: 20),

            // Search Field
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search students...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // Student List
            const Text("Students",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Column(
              children: filteredStudents
                  .map((s) => ListTile(
                        leading: const Icon(Icons.person_outline),
                        title: Text(s),
                        trailing: PopupMenuButton<String>(
                          onSelected: (value) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('$value for $s (not implemented)')));
                          },
                          itemBuilder: (_) => const [
                            PopupMenuItem(
                                value: 'Mark Present', child: Text('Mark Present')),
                            PopupMenuItem(
                                value: 'Mark Absent', child: Text('Mark Absent')),
                            PopupMenuItem(
                                value: 'Mark Excused', child: Text('Mark Excused')),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _countCard(String title, String count, Color color) {
    return Expanded(
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            children: [
              Text(count,
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: color)),
              const SizedBox(height: 4),
              Text(title)
            ],
          ),
        ),
      ),
    );
  }
}
