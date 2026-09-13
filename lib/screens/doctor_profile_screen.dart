import 'package:flutter/material.dart';

class DoctorProfileScreen extends StatelessWidget {
  const DoctorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FC),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 22, 20, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: const Color(0xFFE6EDF3)),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 18,
                        color: Color(0xFF263238),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Text(
                    'Doctor Profile',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1F2933),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Avatar + name
                    Center(
                      child: Column(
                        children: [
                          Container(
                            width: 88,
                            height: 88,
                            decoration: const BoxDecoration(
                              color: Color(0xFFDCEEFF),
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Text(
                                'DS',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF2979D8),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                          const Text(
                            'Dr. Sharma',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1F2933),
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'BDS, MDS — Dental Surgeon',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF7B8794),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    _sectionTitle('Personal Information'),
                    const SizedBox(height: 12),
                    _infoCard(rows: [
                      _row(Icons.person_outline_rounded, 'Full Name', 'Dr. Arvind Sharma'),
                      _row(Icons.phone_outlined, 'Phone', '+91 98765 43210'),
                      _row(Icons.email_outlined, 'Email', 'dr.sharma@clinic.com'),
                      _row(Icons.cake_outlined, 'Date of Birth', '14 May 1980'),
                    ]),

                    const SizedBox(height: 22),

                    _sectionTitle('Professional Details'),
                    const SizedBox(height: 12),
                    _infoCard(rows: [
                      _row(Icons.school_outlined, 'Qualification', 'BDS, MDS (Orthodontics)'),
                      _row(Icons.badge_outlined, 'License No.', 'MH-DEN-20045'),
                      _row(Icons.work_outline_rounded, 'Experience', '14 years'),
                      _row(Icons.language_outlined, 'Languages', 'English, Hindi, Marathi'),
                    ]),

                    const SizedBox(height: 28),

                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.edit_outlined, size: 18),
                        label: const Text(
                          'Edit Profile',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF3B82F6),
                          side: const BorderSide(color: Color(0xFFBFD9F5)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) => Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Color(0xFF1F2933),
        ),
      );

  Widget _infoCard({required List<Widget> rows}) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE6EDF3)),
        ),
        child: Column(children: rows),
      );

  Widget _row(IconData icon, String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
        child: Row(
          children: [
            Icon(icon, size: 19, color: const Color(0xFF6B7C8A)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF9AA5B1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF263238),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
