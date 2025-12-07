import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  final _studentIdController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _courseController = TextEditingController();
  final _passwordController = TextEditingController();

  final studentIdRegEx = RegExp(r'^\d{2}-\d{4}-\d{3}$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Account"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 10),

              Text(
                "Student Registration",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade700,
                ),
              ),

              const SizedBox(height: 24),

              TextFormField(
                controller: _studentIdController,
                decoration: const InputDecoration(
                  labelText: "Student ID (e.g. 11-2024-001)",
                ),
                validator: (value) {
                  if (!studentIdRegEx.hasMatch(value!)) {
                    return "Use format: 11-2024-001";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(labelText: "First Name"),
                validator: (v) => v!.isEmpty ? "Required" : null,
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(labelText: "Last Name"),
                validator: (v) => v!.isEmpty ? "Required" : null,
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _courseController,
                decoration: const InputDecoration(labelText: "Course"),
                validator: (v) => v!.isEmpty ? "Required" : null,
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: "Password"),
                validator: (v) =>
                    v!.length < 6 ? "At least 6 characters" : null,
              ),

              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacementNamed(context, '/login');
                  }
                },
                child: const Text("Create Account"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
