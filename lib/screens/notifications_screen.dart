import 'package:flutter/material.dart';
import 'appointment_details_screen.dart';


class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState
    extends State<NotificationsScreen> {
  String selectedFilter = 'All';

  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'Upcoming appointment',
      'message': 'Aarav Mehta has an appointment tomorrow at 10:00 AM.',
      'time': '10 min ago',
      'icon': Icons.calendar_today_outlined,
      'type': 'appointment',
      'unread': true,
      'patientName': 'Aarav Mehta',
      'initials': 'AM',
      'appointmentTime': '10:00 AM',
      'reason': 'Regular Check-up',
      'status': 'Confirmed',
    },
    {
      'title': 'Appointment reminder',
      'message': 'Aarav Mehta\'s appointment starts in 30 minutes.',
      'time': '1 hour ago',
      'icon': Icons.alarm_outlined,
      'type': 'appointment',
      'unread': true,
      'patientName': 'Aarav Mehta',
      'initials': 'AM',
      'appointmentTime': '10:00 AM',
      'reason': 'Regular Check-up',
      'status': 'Confirmed',
    },
    {
      'title': 'Appointment updated',
      'message': 'Ananya Patil\'s appointment has been rescheduled to 4:30 PM.',
      'time': '3 hours ago',
      'icon': Icons.sync_outlined,
      'type': 'update',
      'unread': false,
      'patientName': 'Ananya Patil',
      'initials': 'AP',
      'appointmentTime': '04:30 PM',
      'reason': 'Dental Cleaning',
      'status': 'Rescheduled',
    },
    {
      'title': 'Visit saved',
      'message': 'The visit for Aarav Mehta was successfully saved.',
      'time': 'Yesterday',
      'icon': Icons.check_circle_outline,
      'type': 'visit',
      'unread': false,
    },
    {
      'title': 'Upcoming appointment',
      'message': 'Rohan Deshmukh has an appointment on Monday at 11:30 AM.',
      'time': 'Yesterday',
      'icon': Icons.calendar_today_outlined,
      'type': 'appointment',
      'unread': false,
      'patientName': 'Rohan Deshmukh',
      'initials': 'RD',
      'appointmentTime': '11:30 AM',
      'reason': 'Tooth Extraction',
      'status': 'Confirmed',
    },
  ];

  List<Map<String, dynamic>> get filteredNotifications {
    if (selectedFilter == 'Unread') {
      return notifications
          .where((notification) => notification['unread'] == true)
          .toList();
    }

    return notifications;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8FAFC),
        elevation: 0,
        surfaceTintColor: const Color(0xFFF8FAFC),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: Color(0xFF263238),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Color(0xFF263238),
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                for (final notification in notifications) {
                  notification['unread'] = false;
                }
              });
            },
            child: const Text(
              'Mark all read',
              style: TextStyle(
                color: Color(0xFF4A90E2),
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Filters
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
              child: Row(
                children: [
                  _filterButton('All'),
                  const SizedBox(width: 10),
                  _filterButton('Unread'),
                ],
              ),
            ),

            Expanded(
              child: filteredNotifications.isEmpty
                  ? _emptyState()
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(
                        20,
                        0,
                        20,
                        24,
                      ),
                      itemCount: filteredNotifications.length,
                      itemBuilder: (context, index) {
                        final notification =
                            filteredNotifications[index];

                        return _notificationCard(notification);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _filterButton(String text) {
    final bool selected = selectedFilter == text;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = text;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFF4A90E2)
              : Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: selected
                ? const Color(0xFF4A90E2)
                : const Color(0xFFE1E7ED),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: selected
                ? Colors.white
                : const Color(0xFF66727F),
          ),
        ),
      ),
    );
  }

  Widget _notificationCard(
      Map<String, dynamic> notification) {
    final bool unread = notification['unread'] == true;

    return GestureDetector(
      onTap: () {
        setState(() {
          notification['unread'] = false;
        });
        final type = notification['type'] as String?;
        if ((type == 'appointment' || type == 'update') &&
            notification['patientName'] != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AppointmentDetailsScreen(
                patientName: notification['patientName'] as String,
                initials: notification['initials'] as String? ?? 'AM',
                time: notification['appointmentTime'] as String? ?? '09:30 AM',
                reason: notification['reason'] as String? ?? 'Check-up',
                status: notification['status'] as String? ?? 'Confirmed',
              ),
            ),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: unread
              ? const Color(0xFFEAF4FF)
              : Colors.white,
          borderRadius: BorderRadius.circular(17),
          border: Border.all(
            color: unread
                ? const Color(0xFFD8EAFB)
                : const Color(0xFFE6EBF1),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                color: Color(0xFFEAF4FF),
                shape: BoxShape.circle,
              ),
              child: Icon(
                notification['icon'],
                size: 20,
                color: const Color(0xFF4A90E2),
              ),
            ),

            const SizedBox(width: 13),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          notification['title'],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF263238),
                          ),
                        ),
                      ),
                      if (unread)
                        Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.only(
                            top: 5,
                            left: 8,
                          ),
                          decoration:
                              const BoxDecoration(
                            color: Color(0xFF4A90E2),
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  Text(
                    notification['message'],
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF66727F),
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 9),

                  Text(
                    notification['time'],
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF9AA5B1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: const BoxDecoration(
                color: Color(0xFFEAF4FF),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.notifications_none,
                size: 30,
                color: Color(0xFF4A90E2),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'No unread notifications',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF263238),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'You’re all caught up.',
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF7A8794),
              ),
            ),
          ],
        ),
      ),
    );
  }
}