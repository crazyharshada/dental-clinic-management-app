import 'package:flutter/material.dart';

import 'add_patient_screen.dart';
import 'appointment_details_screen.dart';
import 'appointments_screen.dart';
import 'book_appointment_screen.dart';
import 'patients_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // HEADER
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Good morning 👋',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF7B8794),
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Dr. Sharma',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF1F2933),
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                'Sharma Dental Clinic',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF8A96A3),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // PROFILE AVATAR (slightly larger)
                        Container(
                          width: 52,
                          height: 52,
                          decoration: const BoxDecoration(
                            color: Color(0xFFDCEEFF),
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Text(
                              'DS',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF2979D8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 22),

                    // HERO CARD
                    Container(
                      width: double.infinity,
                      height: 150,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF3B82F6),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: -15,
                            bottom: -25,
                            child: Container(
                              width: 130,
                              height: 130,
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.10),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Healthy Smiles',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Brighter Days',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Your clinic, organized in one place.',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),

                    // STATS
                    Row(
                      children: [
                        Expanded(
                          child: _statCard(
                            icon: Icons.calendar_today_outlined,
                            number: '8',
                            label: "Today's\nAppointments",
                            iconColor: const Color(0xFF3B82F6),
                            backgroundColor: const Color(0xFFEAF4FF),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _statCard(
                            icon: Icons.people_alt_outlined,
                            number: '24',
                            label: 'Total\nPatients',
                            iconColor: const Color(0xFF20A464),
                            backgroundColor: const Color(0xFFE9F9F1),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _statCard(
                            icon: Icons.access_time_rounded,
                            number: '3',
                            label: 'Pending',
                            iconColor: const Color(0xFFD99400),
                            backgroundColor: const Color(0xFFFFF5D9),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 22),

                    // ─── CLINIC QUEUE ────────────────────────────────────────
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Clinic Queue',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1F2933),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              size: 8,
                              color: Color(0xFF22C55E),
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Moving Normally',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF22C55E),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Token highlight row
                    Row(
                      children: [
                        // Current Token
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 14,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF3B82F6),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Current Token',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  '18',
                                  style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                    height: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Next Token
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 14,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: const Color(0xFFE8EEF3),
                              ),
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Next Token',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFF7B8794),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  '19',
                                  style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF1F2933),
                                    height: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Queue metrics grid
                    Row(
                      children: [
                        Expanded(
                          child: _queueMetricCard(
                            icon: Icons.people_outline_rounded,
                            iconColor: const Color(0xFF8B5CF6),
                            iconBg: const Color(0xFFF3EEFF),
                            label: 'Waiting',
                            value: '11',
                            unit: 'patients',
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _queueMetricCard(
                            icon: Icons.timer_outlined,
                            iconColor: const Color(0xFF10B981),
                            iconBg: const Color(0xFFEAFAF4),
                            label: 'Avg. Time',
                            value: '5',
                            unit: 'min / patient',
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _queueMetricCard(
                            icon: Icons.schedule_rounded,
                            iconColor: const Color(0xFFF59E0B),
                            iconBg: const Color(0xFFFFF8E6),
                            label: 'Doctor Delay',
                            value: '20',
                            unit: 'min',
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Estimated wait banner
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 13,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF8E6),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: const Color(0xFFFFE8A0),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.access_time_filled_rounded,
                            color: Color(0xFFD99400),
                            size: 20,
                          ),
                          const SizedBox(width: 10),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Estimated wait: ~45 min',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF92600A),
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  'Based on current queue and average consultation time',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFFB07A2A),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // ─────────────────────────────────────────────────────────

                    const SizedBox(height: 26),

                    // UPCOMING APPOINTMENTS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Upcoming Appointments',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1F2933),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    const AppointmentsScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'View all',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF3B82F6),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // AARAV
                    _appointmentCard(
                      time: '09:30 AM',
                      name: 'Aarav Mehta',
                      reason: 'Regular Check-up',
                      initials: 'AM',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AppointmentDetailsScreen(
                              patientName: 'Aarav Mehta',
                              initials: 'AM',
                              time: '09:30 AM',
                              reason: 'Regular Check-up',
                              status: 'Confirmed',
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 10),

                    // ANANYA
                    _appointmentCard(
                      time: '10:30 AM',
                      name: 'Ananya Patil',
                      reason: 'Dental Cleaning',
                      initials: 'AP',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AppointmentDetailsScreen(
                              patientName: 'Ananya Patil',
                              initials: 'AP',
                              time: '10:30 AM',
                              reason: 'Dental Cleaning',
                              status: 'Confirmed',
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 10),

                    // ROHAN
                    _appointmentCard(
                      time: '11:30 AM',
                      name: 'Rohan Deshmukh',
                      reason: 'Tooth Pain',
                      initials: 'RD',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AppointmentDetailsScreen(
                              patientName: 'Rohan Deshmukh',
                              initials: 'RD',
                              time: '11:30 AM',
                              reason: 'Tooth Pain',
                              status: 'Confirmed',
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 26),

                    // QUICK ACTIONS
                    const Text(
                      'Quick Actions',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1F2933),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Expanded(
                          child: _quickAction(
                            icon: Icons.person_add_alt_1_outlined,
                            title: 'Add Patient',
                            color: const Color(0xFFEAF4FF),
                            iconColor: const Color(0xFF3B82F6),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      const AddPatientScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _quickAction(
                            icon: Icons.calendar_month_outlined,
                            title: 'Book Appointment',
                            color: const Color(0xFFE9F9F1),
                            iconColor: const Color(0xFF20A464),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      const BookAppointmentScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Row(
                      children: [
                        Expanded(
                          child: _quickAction(
                            icon: Icons.people_outline_rounded,
                            title: 'View Patients',
                            color: const Color(0xFFF0EBFF),
                            iconColor: const Color(0xFF7654D6),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      const PatientsScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _quickAction(
                            icon: Icons.bar_chart_rounded,
                            title: 'Reports',
                            color: const Color(0xFFFFF1E7),
                            iconColor: const Color(0xFFE68A35),
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Reports will be available soon.',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // REMINDER
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(17),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFE8EEF3),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF5D9),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: const Icon(
                              Icons.notifications_active_outlined,
                              color: Color(0xFFD99400),
                              size: 21,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Reminder',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF263238),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '3 appointments are waiting for confirmation.',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF7B8794),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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

  static Widget _statCard({
    required IconData icon,
    required String number,
    required String label,
    required Color iconColor,
    required Color backgroundColor,
  }) {
    return Container(
      height: 112,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE8EEF3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              size: 17,
              color: iconColor,
            ),
          ),
          const Spacer(),
          Text(
            number,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1F2933),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              color: Color(0xFF7B8794),
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  static Widget _queueMetricCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String label,
    required String value,
    required String unit,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE8EEF3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(icon, size: 16, color: iconColor),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1F2933),
              height: 1,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Color(0xFF263238),
            ),
          ),
          Text(
            unit,
            style: const TextStyle(
              fontSize: 10,
              color: Color(0xFF9AA5B1),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _appointmentCard({
    required String time,
    required String name,
    required String reason,
    required String initials,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
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
              width: 46,
              height: 46,
              decoration: const BoxDecoration(
                color: Color(0xFFDCEEFF),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  initials,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2979D8),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF263238),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    reason,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF7B8794),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF3B82F6),
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFF9AA5B1),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget _quickAction({
    required IconData icon,
    required String title,
    required Color color,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 72,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(17),
          border: Border.all(
            color: const Color(0xFFE8EEF3),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(11),
              ),
              child: Icon(
                icon,
                size: 19,
                color: iconColor,
              ),
            ),
            const SizedBox(width: 9),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF263238),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}