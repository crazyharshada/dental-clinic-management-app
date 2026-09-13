import 'package:flutter/material.dart';

class ClinicProfileScreen extends StatelessWidget {
  const ClinicProfileScreen({super.key});

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
                    'Clinic Profile',
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
                    // Clinic banner
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF3B82F6), Color(0xFF2563EB)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Icon(
                              Icons.local_hospital_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          const SizedBox(width: 16),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sharma Dental Clinic',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Specialized Dental Care',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    _sectionTitle('Contact & Location'),
                    const SizedBox(height: 12),
                    _infoCard(rows: [
                      _row(Icons.location_on_outlined, 'Address',
                          '12, MG Road, Pune, Maharashtra 411001'),
                      _row(Icons.phone_outlined, 'Phone', '+91 20 1234 5678'),
                      _row(Icons.email_outlined, 'Email', 'info@sharmadentalclinic.com'),
                      _row(Icons.language_outlined, 'Website', 'www.sharmadentalclinic.com'),
                    ]),

                    const SizedBox(height: 22),

                    _sectionTitle('Working Hours'),
                    const SizedBox(height: 12),
                    _infoCard(rows: [
                      _row(Icons.schedule_outlined, 'Mon – Sat', '9:00 AM – 7:00 PM'),
                      _row(Icons.schedule_outlined, 'Sunday', 'Closed'),
                    ]),

                    const SizedBox(height: 22),

                    _sectionTitle('Specializations'),
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFE6EDF3)),
                      ),
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: const [
                          _Chip('Orthodontics'),
                          _Chip('Cosmetic Dentistry'),
                          _Chip('Root Canal'),
                          _Chip('Teeth Whitening'),
                          _Chip('Implants'),
                          _Chip('Pediatric Dental'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.edit_outlined, size: 18),
                        label: const Text(
                          'Edit Clinic Info',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Icon(icon, size: 19, color: const Color(0xFF6B7C8A)),
            ),
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

class _Chip extends StatelessWidget {
  final String label;
  const _Chip(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF4FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Color(0xFF2674C9),
        ),
      ),
    );
  }
}
