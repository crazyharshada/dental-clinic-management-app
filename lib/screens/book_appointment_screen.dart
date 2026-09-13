import 'package:flutter/material.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});

  @override
  State<BookAppointmentScreen> createState() =>
      _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  String selectedPatient = 'Aarav Mehta';
  DateTime selectedDate = DateTime.now();
  String selectedTime = '10:30 AM';

  final TextEditingController reasonController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  final List<String> patients = [
    'Aarav Mehta',
    'Ananya Patil',
    'Rohan Deshmukh',
    'Sneha Kulkarni',
    'Vedant Joshi',
  ];

  final List<String> timeSlots = [
    '09:00 AM',
    '09:30 AM',
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
    '12:00 PM',
    '02:00 PM',
    '02:30 PM',
    '03:00 PM',
    '03:30 PM',
    '04:00 PM',
  ];

  @override
  void dispose() {
    reasonController.dispose();
    notesController.dispose();
    super.dispose();
  }

  Future<void> selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  String formatDate(DateTime date) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  void createAppointment() {
    if (reasonController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter the reason for the visit'),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Appointment created successfully'),
      ),
    );

    Navigator.pop(context);
  }

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
                  const Text(
                    'Book Appointment',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1F2933),
                    ),
                  ),
                ],
              ),
            ),

            // Form
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Intro card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF4FF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.calendar_month_rounded,
                            color: Color(0xFF3B82F6),
                            size: 28,
                          ),
                          SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Schedule a visit',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF263238),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Choose a patient, date and available time.',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF6B7C8A),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 26),

                    // Patient
                    _sectionTitle('Patient'),

                    const SizedBox(height: 9),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color(0xFFE3EAF0),
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedPatient,
                          isExpanded: true,
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Color(0xFF7B8794),
                          ),
                          items: patients.map(
                            (patient) {
                              return DropdownMenuItem<String>(
                                value: patient,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 36,
                                      height: 36,
                                      decoration:
                                          const BoxDecoration(
                                        color: Color(0xFFDCEEFF),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Text(
                                          patient
                                              .split(' ')
                                              .map((e) => e[0])
                                              .take(2)
                                              .join(),
                                          style: const TextStyle(
                                            fontSize: 11,
                                            fontWeight:
                                                FontWeight.w700,
                                            color:
                                                Color(0xFF2979D8),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      patient,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight:
                                            FontWeight.w600,
                                        color:
                                            Color(0xFF263238),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                selectedPatient = value;
                              });
                            }
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Date
                    _sectionTitle('Date'),

                    const SizedBox(height: 9),

                    GestureDetector(
                      onTap: selectDate,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 17,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: const Color(0xFFE3EAF0),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: const Color(0xFFEAF4FF),
                                borderRadius:
                                    BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.calendar_today_outlined,
                                size: 19,
                                color: Color(0xFF3B82F6),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                formatDate(selectedDate),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF263238),
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.chevron_right_rounded,
                              color: Color(0xFF9AA5B1),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Time
                    _sectionTitle('Available Time'),

                    const SizedBox(height: 10),

                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: timeSlots.map(
                        (time) {
                          final bool selected =
                              selectedTime == time;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedTime = time;
                              });
                            },
                            child: Container(
                              width: 94,
                              height: 44,
                              decoration: BoxDecoration(
                                color: selected
                                    ? const Color(0xFF3B82F6)
                                    : Colors.white,
                                borderRadius:
                                    BorderRadius.circular(13),
                                border: Border.all(
                                  color: selected
                                      ? const Color(0xFF3B82F6)
                                      : const Color(0xFFE3EAF0),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  time,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight:
                                        FontWeight.w600,
                                    color: selected
                                        ? Colors.white
                                        : const Color(
                                            0xFF52606D,
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),

                    const SizedBox(height: 26),

                    // Reason
                    _sectionTitle('Reason for Visit'),

                    const SizedBox(height: 9),

                    TextField(
                      controller: reasonController,
                      textInputAction: TextInputAction.next,
                      decoration: _inputDecoration(
                        hint: 'e.g. Regular check-up',
                        icon: Icons.medical_services_outlined,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Notes
                    _sectionTitle('Additional Notes'),

                    const SizedBox(height: 9),

                    TextField(
                      controller: notesController,
                      maxLines: 4,
                      decoration: _inputDecoration(
                        hint: 'Add any notes for this appointment...',
                        icon: Icons.notes_outlined,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Create button
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: createAppointment,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xFF3B82F6),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'Create Appointment',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF7B8794),
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

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: Color(0xFF263238),
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(
        fontSize: 13,
        color: Color(0xFF9AA5B1),
      ),
      prefixIcon: Padding(
        padding: const EdgeInsets.only(
          left: 4,
          right: 4,
        ),
        child: Icon(
          icon,
          size: 20,
          color: const Color(0xFF6B7C8A),
        ),
      ),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: Color(0xFFE3EAF0),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: Color(0xFFE3EAF0),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: Color(0xFF3B82F6),
          width: 1.5,
        ),
      ),
    );
  }
}