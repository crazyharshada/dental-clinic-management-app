import 'package:flutter/material.dart';
import 'visit_notes_screen.dart';
import 'book_appointment_screen.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  final String patientName;
  final String initials;
  final String time;
  final String reason;
  final String status;

  const AppointmentDetailsScreen({
    super.key,
    this.patientName = 'Aarav Mehta',
    this.initials = 'AM',
    this.time = '09:30 AM',
    this.reason = 'Regular Check-up',
    this.status = 'Confirmed',
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
                      'Appointment Details',
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: const Color(0xFFE6EDF3),
                      ),
                    ),
                    child: const Icon(
                      Icons.more_horiz_rounded,
                      color: Color(0xFF263238),
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
                    // Patient card
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
                            width: 72,
                            height: 72,
                            decoration: const BoxDecoration(
                              color: Color(0xFFDCEEFF),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                initials,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF2979D8),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            patientName,
                            style: const TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1F2933),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Patient ID • PT-00124',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF8A96A3),
                            ),
                          ),
                          const SizedBox(height: 14),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 7,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE9F9F1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              status,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF20A464),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 22),

                    const Text(
                      'Appointment Information',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1F2933),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Appointment information
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
                            icon: Icons.calendar_today_outlined,
                            title: 'Date',
                            value: '11 September 2026',
                          ),
                          const SizedBox(height: 18),
                          _detailRow(
                            icon: Icons.access_time_rounded,
                            title: 'Time',
                            value: time,
                          ),
                          const SizedBox(height: 18),
                          _detailRow(
                            icon: Icons.medical_services_outlined,
                            title: 'Reason for Visit',
                            value: reason,
                          ),
                          const SizedBox(height: 18),
                          _detailRow(
                            icon: Icons.person_outline_rounded,
                            title: 'Doctor',
                            value: 'Dr. Sharma',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 22),

                    const Text(
                      'Notes',
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
                        color: const Color(0xFFEAF4FF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Patient requested a routine check-up. '
                        'Please review previous visit history.',
                        style: TextStyle(
                          fontSize: 13,
                          height: 1.5,
                          color: Color(0xFF52606D),
                        ),
                      ),
                    ),

                    const SizedBox(height: 28),

                    // Start Visit
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VisitNotesScreen(
                                patientName: patientName,
                                appointmentReason: reason,
                              ),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.play_circle_outline_rounded,
                          size: 21,
                        ),
                        label: const Text(
                          'Start Visit',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3B82F6),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Reschedule + Cancel
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const BookAppointmentScreen(),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.edit_calendar_outlined,
                              size: 18,
                            ),
                            label: const Text(
                              'Reschedule',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              foregroundColor:
                                  const Color(0xFF3B82F6),
                              minimumSize: const Size(
                                double.infinity,
                                50,
                              ),
                              side: const BorderSide(
                                color: Color(0xFFD6E5F5),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text(
                                      'Cancel Appointment?',
                                    ),
                                    content: const Text(
                                      'Are you sure you want to cancel '
                                      'this appointment?',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('No'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);

                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'Appointment cancelled',
                                              ),
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          'Yes, Cancel',
                                          style: TextStyle(
                                            color: Color(0xFFE05252),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: const Icon(
                              Icons.close_rounded,
                              size: 18,
                            ),
                            label: const Text(
                              'Cancel',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              foregroundColor:
                                  const Color(0xFFE05252),
                              minimumSize: const Size(
                                double.infinity,
                                50,
                              ),
                              side: const BorderSide(
                                color: Color(0xFFF0D6D6),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ],
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

  static Widget _detailRow({
    required IconData icon,
    required String title,
    required String value,
  }) {
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
            size: 20,
            color: const Color(0xFF3B82F6),
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
}