import 'package:flutter/material.dart';

class VisitSummaryScreen extends StatelessWidget {
  final String patientName;

  const VisitSummaryScreen({
    super.key,
    this.patientName = 'Aarav Mehta',
  });

  String _getInitials() {
    final parts = patientName.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    if (parts.isNotEmpty && parts[0].isNotEmpty) {
      return parts[0][0].toUpperCase();
    }
    return '??';
  }

  Widget summaryCard({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE6EBF1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  color: Color(0xFFEAF4FF),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 19,
                  color: const Color(0xFF4A90E2),
                ),
              ),
              const SizedBox(width: 11),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF263238),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          child,
        ],
      ),
    );
  }

  Widget detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 105,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF7A8794),
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF263238),
              ),
            ),
          ),
        ],
      ),
    );
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
          'Visit Summary',
          style: TextStyle(
            color: Color(0xFF263238),
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Patient header
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(17),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF4FF),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Color(0xFFD3E9FF),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                _getInitials(),
                                style: const TextStyle(
                                  color: Color(0xFF2674C9),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 13),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  patientName,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF263238),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  'Visit today',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF6B7785),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    const Text(
                      'Review Visit',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF263238),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Visit notes
                    summaryCard(
                      title: 'Visit Notes',
                      icon: Icons.description_outlined,
                      child: Column(
                        children: [
                          detailRow(
                            'Reason',
                            'Regular Check-up',
                          ),
                          detailRow(
                            'Examination',
                            'Routine dental examination completed.',
                          ),
                          detailRow(
                            'Diagnosis',
                            'No major dental issues found.',
                          ),
                          detailRow(
                            'Notes',
                            'Continue regular oral hygiene.',
                          ),
                        ],
                      ),
                    ),

                    // Treatment
                    summaryCard(
                      title: 'Treatment',
                      icon: Icons.medical_services_outlined,
                      child: Column(
                        children: [
                          detailRow(
                            'Treatment',
                            'Dental Cleaning',
                          ),
                          detailRow(
                            'Tooth',
                            'General',
                          ),
                          detailRow(
                            'Notes',
                            'Routine cleaning performed.',
                          ),
                        ],
                      ),
                    ),

                    // Prescription
                    summaryCard(
                      title: 'Prescription',
                      icon: Icons.medication_outlined,
                      child: Column(
                        children: [
                          detailRow(
                            'Medicine',
                            'Amoxicillin',
                          ),
                          detailRow(
                            'Dosage',
                            '500 mg',
                          ),
                          detailRow(
                            'Frequency',
                            'Twice a day',
                          ),
                          detailRow(
                            'Duration',
                            '5 days',
                          ),
                          detailRow(
                            'Instructions',
                            'Take after food.',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 4),

                    // Info message
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F7FD),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.info_outline,
                            size: 19,
                            color: Color(0xFF4A90E2),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Review the information before saving this visit.',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF5F6D7A),
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Save button
            Container(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 18),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 12,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (dialogContext) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          title: const Text(
                            'Visit Saved',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          content: const Text(
                            'The visit has been successfully saved to the patient record.',
                            style: TextStyle(
                              color: Color(0xFF5F6D7A),
                              height: 1.4,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(dialogContext).pop();
                                // Pop: VisitSummary → Prescription → Treatment → VisitNotes
                                // Returns to PatientProfile or AppointmentDetails
                                int count = 0;
                                Navigator.of(context).popUntil(
                                  (_) => count++ >= 4,
                                );
                              },
                              child: const Text(
                                'Done',
                                style: TextStyle(
                                  color: Color(0xFF4A90E2),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A90E2),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  icon: const Icon(
                    Icons.check_circle_outline,
                    size: 20,
                  ),
                  label: const Text(
                    'Save Visit',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}