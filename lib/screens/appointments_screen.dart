import 'package:flutter/material.dart';
import 'appointment_details_screen.dart';
import 'book_appointment_screen.dart';
import 'notifications_screen.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 12),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Appointments',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1F2933),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Manage your clinic schedule',
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

            // Date selector
            SizedBox(
              height: 88,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.fromLTRB(20, 6, 20, 12),
                children: [
                  _dateCard(
                    day: '10',
                    weekday: 'Tue',
                    selected: false,
                  ),
                  _dateCard(
                    day: '11',
                    weekday: 'Wed',
                    selected: true,
                  ),
                  _dateCard(
                    day: '12',
                    weekday: 'Thu',
                    selected: false,
                  ),
                  _dateCard(
                    day: '13',
                    weekday: 'Fri',
                    selected: false,
                  ),
                  _dateCard(
                    day: '14',
                    weekday: 'Sat',
                    selected: false,
                  ),
                  _dateCard(
                    day: '15',
                    weekday: 'Sun',
                    selected: false,
                  ),
                ],
              ),
            ),

            // Summary
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 14),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Today • 8 Appointments',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF263238),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 11,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAF4FF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.filter_list_rounded,
                          size: 17,
                          color: Color(0xFF3B82F6),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Filter',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF3B82F6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Appointment list
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
                children: [
                  _appointmentCard(
                    context,
                    time: '09:30 AM',
                    patient: 'Aarav Mehta',
                    reason: 'Regular Check-up',
                    status: 'Confirmed',
                    statusColor: const Color(0xFF20A464),
                    statusBackground: const Color(0xFFE9F9F1),
                    initials: 'AM',
                  ),
                  _appointmentCard(
                    context,
                    time: '10:30 AM',
                    patient: 'Ananya Patil',
                    reason: 'Dental Cleaning',
                    status: 'Confirmed',
                    statusColor: const Color(0xFF20A464),
                    statusBackground: const Color(0xFFE9F9F1),
                    initials: 'AP',
                  ),
                  _appointmentCard(
                    context,
                    time: '11:30 AM',
                    patient: 'Rohan Deshmukh',
                    reason: 'Tooth Pain',
                    status: 'Pending',
                    statusColor: const Color(0xFFD99400),
                    statusBackground: const Color(0xFFFFF5D9),
                    initials: 'RD',
                  ),
                  _appointmentCard(
                    context,
                    time: '01:00 PM',
                    patient: 'Sneha Kulkarni',
                    reason: 'Follow-up',
                    status: 'Confirmed',
                    statusColor: const Color(0xFF20A464),
                    statusBackground: const Color(0xFFE9F9F1),
                    initials: 'SK',
                  ),
                  _appointmentCard(
                    context,
                    time: '03:00 PM',
                    patient: 'Vedant Joshi',
                    reason: 'Tooth Sensitivity',
                    status: 'Pending',
                    statusColor: const Color(0xFFD99400),
                    statusBackground: const Color(0xFFFFF5D9),
                    initials: 'VJ',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Book Appointment button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BookAppointmentScreen(),
            ),
          );
        },
        backgroundColor: const Color(0xFF3B82F6),
        elevation: 3,
        icon: const Icon(
          Icons.add_rounded,
          color: Colors.white,
        ),
        label: const Text(
          'Book Appointment',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  static Widget _dateCard({
    required String day,
    required String weekday,
    required bool selected,
  }) {
    return Container(
      width: 62,
      margin: const EdgeInsets.only(right: 9),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF3B82F6) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: selected
              ? const Color(0xFF3B82F6)
              : const Color(0xFFE6EDF3),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weekday,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: selected
                  ? Colors.white.withValues(alpha: 0.85)
                  : const Color(0xFF8A96A3),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            day,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: selected
                  ? Colors.white
                  : const Color(0xFF263238),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _appointmentCard(
    BuildContext context, {
    required String time,
    required String patient,
    required String reason,
    required String status,
    required Color statusColor,
    required Color statusBackground,
    required String initials,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AppointmentDetailsScreen(
              patientName: patient,
              initials: initials,
              time: time,
              reason: reason,
              status: status,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Time
            SizedBox(
              width: 65,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF3B82F6),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 4,
                    height: 34,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDCEEFF),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            // Avatar
            Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                color: Color(0xFFDCEEFF),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  initials,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2979D8),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 12),

            // Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    patient,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF263238),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    reason,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF7B8794),
                    ),
                  ),
                  const SizedBox(height: 9),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: statusBackground,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: statusColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.chevron_right_rounded,
              color: Color(0xFF9AA5B1),
            ),
          ],
        ),
      ),
    );
  }
}