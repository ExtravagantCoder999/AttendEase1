import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/signup_page.dart';
import 'pages/student_dashboard.dart';
import 'pages/teacher/teacher_login.dart';
import 'pages/teacher/teacher_dashboard.dart';
import 'pages/teacher/new_subject_page.dart';
import 'pages/teacher/subject_created_page.dart';
import 'pages/teacher/add_students_page.dart';
import 'pages/teacher/session_details_page.dart';

final Map<String, WidgetBuilder> appRoutes = {
  // Student routes
  '/login': (context) => const LoginPage(),
  '/signup': (context) => const SignupPage(),
  '/dashboard': (context) => const StudentDashboard(),

  // Teacher routes
  '/teacher/teacher-login': (context) => const TeacherLoginPage(),
  '/teacher/teacher-dashboard': (context) => const TeacherDashboard(),
  '/teacher/new_subject': (context) => const NewSubjectPage(),

  '/teacher/subject_created': (context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return SubjectCreatedPage(
      subjectName: args['name'] ?? '',
      subjectCode: args['code'] ?? '',
      section: args['section'] ?? '',
      schedule: args['schedule'] ?? '',
    );
  },

  '/teacher/add_students': (context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return AddStudentsPage(
      subjectName: args['name'] ?? '',
      subjectCode: args['code'] ?? '',
      section: args['section'] ?? '',
      schedule: args['schedule'] ?? '',
    );
  },

  '/teacher/session_details': (context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return SessionDetailsPage(
      subjectName: args['name'] ?? '',
      subjectCode: args['code'] ?? '',
      section: args['section'] ?? '',
      schedule: args['schedule'] ?? '',
    );
  },
};
