import 'package:flutter/material.dart';
import 'add_patient_screen.dart';
import 'notifications_screen.dart';
import 'patient_profile_screen.dart';

class PatientsScreen extends StatelessWidget {
  const PatientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 10),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Patients',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1F2933),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Manage your patients',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF7B8794),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationsScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: const Color(0xFFE6EDF3),
                        ),
                      ),
                      child: const Icon(
                        Icons.notifications_none_rounded,
                        color: Color(0xFF263238),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Search
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFFE6EDF3),
                  ),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search patients...',
                    hintStyle: TextStyle(
                      color: Color(0xFF9AA5B1),
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: Color(0xFF7B8794),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
            ),

            // Count + Add
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 14),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      '24 Patients',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF263238),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddPatientScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF3B82F6),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.add_rounded,
                            color: Colors.white,
                            size: 18,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Add Patient',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Patient list
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                children: [
                  _patientCard(
                    context,
                    name: 'Aarav Mehta',
                    age: '28',
                    gender: 'Male',
                    phone: '+91 98765 43210',
                    initials: 'AM',
                    color: const Color(0xFFDCEEFF),
                  ),
                  _patientCard(
                    context,
                    name: 'Ananya Patil',
                    age: '32',
                    gender: 'Female',
                    phone: '+91 98234 56789',
                    initials: 'AP',
                    color: const Color(0xFFE8E0FF),
                  ),
                  _patientCard(
                    context,
                    name: 'Rohan Deshmukh',
                    age: '41',
                    gender: 'Male',
                    phone: '+91 97654 32109',
                    initials: 'RD',
                    color: const Color(0xFFDDF5EA),
                  ),
                  _patientCard(
                    context,
                    name: 'Sneha Kulkarni',
                    age: '26',
                    gender: 'Female',
                    phone: '+91 98989 12345',
                    initials: 'SK',
                    color: const Color(0xFFFFE8D9),
                  ),
                  _patientCard(
                    context,
                    name: 'Vedant Joshi',
                    age: '35',
                    gender: 'Male',
                    phone: '+91 98123 45678',
                    initials: 'VJ',
                    color: const Color(0xFFFFE1E8),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _patientCard(
    BuildContext context, {
    required String name,
    required String age,
    required String gender,
    required String phone,
    required String initials,
    required Color color,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PatientProfileScreen(
              patientName: name,
              initials: initials,
              age: age,
              gender: gender,
              phone: phone,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xFFE8EEF3),
          ),
        ),
        child: Row(
          children: [
            // Avatar
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  initials,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2979D8),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 14),

            // Patient details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF263238),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '$age years • $gender',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF7B8794),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    phone,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF7B8794),
                    ),
                  ),
                ],
              ),
            ),

            // Arrow
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: const Color(0xFFF1F6FA),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.chevron_right_rounded,
                size: 20,
                color: Color(0xFF7B8794),
              ),
            ),
          ],
        ),
      ),
    );
  }
}