import 'package:flutter/material.dart';
import 'book_appointment_screen.dart';
import 'edit_patient_screen.dart';
import 'visit_notes_screen.dart';

class PatientProfileScreen extends StatelessWidget {
  final String patientName;
  final String initials;
  final String age;
  final String gender;
  final String phone;

  const PatientProfileScreen({
    super.key,
    this.patientName = 'Aarav Mehta',
    this.initials = 'AM',
    this.age = '28',
    this.gender = 'Male',
    this.phone = '+91 98765 43210',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
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
                        border: Border.all(
                          color: const Color(0xFFE6EDF3),
                        ),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 18,
                        color: Color(0xFF263238),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Text(
                      'Patient Profile',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1F2933),
                      ),
                    ),
                  ),
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAF4FF),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.more_horiz_rounded,
                      color: Color(0xFF3B82F6),
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Patient main card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: const Color(0xFFE8EEF3),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 76,
                            height: 76,
                            decoration: BoxDecoration(
                              color: const Color(0xFFDCEEFF),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                initials,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF2979D8),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),

                          Text(
                            patientName,
                            style: const TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1F2933),
                            ),
                          ),

                          const SizedBox(height: 6),

                          const Text(
                            'Patient ID • PT-00124',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF7B8794),
                            ),
                          ),

                          const SizedBox(height: 18),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _infoItem(age, 'Age'),
                              _verticalDivider(),
                              _infoItem(gender, 'Gender'),
                              _verticalDivider(),
                              _infoItem('12', 'Visits'),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),

                    // Action buttons
                    Row(
                      children: [
                        Expanded(
                          child: _actionButton(
                            icon: Icons.edit_outlined,
                            label: 'Edit Patient',
                            color: const Color(0xFFEAF4FF),
                            iconColor: const Color(0xFF3B82F6),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const EditPatientScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _actionButton(
                            icon: Icons.calendar_month_outlined,
                            label: 'Book Visit',
                            color: const Color(0xFFE9F9F1),
                            iconColor: const Color(0xFF20A464),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const BookAppointmentScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VisitNotesScreen(
                                patientName: patientName,
                              ),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.add_circle_outline_rounded,
                          size: 20,
                        ),
                        label: const Text(
                          'Start New Visit',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3B82F6),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          minimumSize: const Size(double.infinity, 52),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 26),

                    // Contact information
                    const Text(
                      'Patient Information',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1F2933),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFE8EEF3),
                        ),
                      ),
                      child: Column(
                        children: [
                          _detailRow(
                            Icons.phone_outlined,
                            'Mobile Number',
                            phone,
                          ),
                          const SizedBox(height: 18),
                          _detailRow(
                            Icons.email_outlined,
                            'Email',
                            'aarav.mehta@email.com',
                          ),
                          const SizedBox(height: 18),
                          _detailRow(
                            Icons.location_on_outlined,
                            'Address',
                            'Pune, Maharashtra',
                          ),
                          const SizedBox(height: 18),
                          _detailRow(
                            Icons.contact_phone_outlined,
                            'Emergency Contact',
                            'Priya Mehta • +91 98765 12345',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 26),

                    // Medical information
                    const Text(
                      'Medical Information',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1F2933),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFBF2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFF3E7C5),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _medicalItem(
                            'Allergies',
                            'No known allergies',
                          ),
                          const SizedBox(height: 14),
                          _medicalItem(
                            'Medical History',
                            'No major medical history',
                          ),
                          const SizedBox(height: 14),
                          _medicalItem(
                            'Current Medication',
                            'None',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 26),

                    // Recent visits
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Recent Visits',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1F2933),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'View all',
                            style: TextStyle(
                              color: Color(0xFF3B82F6),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    _visitCard(
                      date: '08 Sep 2026',
                      title: 'Regular Check-up',
                      doctor: 'Dr. Sharma',
                      status: 'Completed',
                    ),

                    const SizedBox(height: 10),

                    _visitCard(
                      date: '21 Aug 2026',
                      title: 'Dental Cleaning',
                      doctor: 'Dr. Sharma',
                      status: 'Completed',
                    ),

                    const SizedBox(height: 10),

                    _visitCard(
                      date: '12 Jul 2026',
                      title: 'Tooth Pain',
                      doctor: 'Dr. Sharma',
                      status: 'Completed',
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

  static Widget _infoItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1F2933),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF7B8794),
          ),
        ),
      ],
    );
  }

  static Widget _verticalDivider() {
    return Container(
      height: 30,
      width: 1,
      color: const Color(0xFFE6EDF3),
    );
  }

  static Widget _actionButton({
    required IconData icon,
    required String label,
    required Color color,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 54,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: iconColor,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF263238),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _detailRow(
    IconData icon,
    String title,
    String value,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: const Color(0xFFEAF4FF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF3B82F6),
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF8A96A3),
                ),
              ),
              const SizedBox(height: 4),
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
    );
  }

  static Widget _medicalItem(
    String title,
    String value,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.circle,
          size: 7,
          color: Color(0xFFE0A62B),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$title\n',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF8A96A3),
                  ),
                ),
                TextSpan(
                  text: value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF263238),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  static Widget _visitCard({
    required String date,
    required String title,
    required String doctor,
    required String status,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE8EEF3),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF4FF),
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Icon(
              Icons.medical_services_outlined,
              color: Color(0xFF3B82F6),
              size: 21,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF263238),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '$date • $doctor',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF8A96A3),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 9,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFE9F9F1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              status,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Color(0xFF20A464),
              ),
            ),
          ),
        ],
      ),
    );
  }
}