import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

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
                    'About',
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
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                child: Column(
                  children: [
                    // App logo block
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 32),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFFE6EDF3)),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 76,
                            height: 76,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF3B82F6), Color(0xFF2563EB)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.local_hospital_rounded,
                              color: Colors.white,
                              size: 36,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Sharma Dental Clinic',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1F2933),
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'Clinic Management App',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF7B8794),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEAF4FF),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'Version 1.0.0',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2674C9),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Info rows
                    _infoCard(rows: [
                      _row(Icons.build_circle_outlined, 'Build', '1.0.0 (100)'),
                      _row(Icons.phone_android_outlined, 'Platform', 'Flutter (iOS & Android)'),
                      _row(Icons.calendar_today_outlined, 'Released', 'September 2026'),
                      _row(Icons.person_outline_rounded, 'Developed by', 'Sharma Clinic Dev Team'),
                    ]),

                    const SizedBox(height: 20),

                    // Legal
                    _infoCard(rows: [
                      _tappableRow(
                        Icons.description_outlined,
                        'Terms of Service',
                        () {},
                      ),
                      _tappableRow(
                        Icons.privacy_tip_outlined,
                        'Privacy Policy',
                        () {},
                      ),
                      _tappableRow(
                        Icons.article_outlined,
                        'Open Source Licences',
                        () {},
                      ),
                    ]),

                    const SizedBox(height: 28),

                    const Text(
                      '© 2026 Sharma Dental Clinic. All rights reserved.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFFB0BAC5),
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

  Widget _tappableRow(IconData icon, String label, VoidCallback onTap) =>
      GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              Icon(icon, size: 19, color: const Color(0xFF6B7C8A)),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF263238),
                  ),
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: Color(0xFFB0BAC5),
                size: 20,
              ),
            ],
          ),
        ),
      );
}
