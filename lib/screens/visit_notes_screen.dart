import 'package:flutter/material.dart';
import 'treatment_screen.dart';

class VisitNotesScreen extends StatefulWidget {
  final String patientName;
  final String appointmentReason;

  const VisitNotesScreen({
    super.key,
    this.patientName = 'Aarav Mehta',
    this.appointmentReason = 'Regular Check-up',
  });

  @override
  State<VisitNotesScreen> createState() => _VisitNotesScreenState();
}

class _VisitNotesScreenState extends State<VisitNotesScreen> {
  final TextEditingController reasonController = TextEditingController();
  final TextEditingController examinationController = TextEditingController();
  final TextEditingController diagnosisController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    reasonController.text = widget.appointmentReason;
  }

  @override
  void dispose() {
    reasonController.dispose();
    examinationController.dispose();
    diagnosisController.dispose();
    notesController.dispose();
    super.dispose();
  }

  InputDecoration fieldDecoration(String label, String hint) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      alignLabelWithHint: true,
      filled: true,
      fillColor: const Color(0xFFF7F9FC),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 15,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: Color(0xFF4A90E2),
          width: 1.3,
        ),
      ),
    );
  }

  Widget sectionField({
    required String label,
    required String hint,
    required TextEditingController controller,
    int maxLines = 4,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF263238),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          textCapitalization: TextCapitalization.sentences,
          decoration: fieldDecoration('', hint),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: Color(0xFF263238),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Visit Notes',
          style: TextStyle(
            color: Color(0xFF263238),
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Patient card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF4FF),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: const BoxDecoration(
                              color: Color(0xFFD3E9FF),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                widget.patientName
                                    .trim()
                                    .split(' ')
                                    .map((e) => e.isNotEmpty ? e[0] : '')
                                    .take(2)
                                    .join()
                                    .toUpperCase(),
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
                                  widget.patientName,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF263238),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  'Today • Current Visit',
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

                    const SizedBox(height: 28),

                    const Text(
                      'Visit Information',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF263238),
                      ),
                    ),

                    const SizedBox(height: 18),

                    sectionField(
                      label: 'Reason for Visit',
                      hint: 'Enter reason for the visit',
                      controller: reasonController,
                      maxLines: 2,
                    ),

                    const SizedBox(height: 20),

                    sectionField(
                      label: 'Examination / Findings',
                      hint: 'Enter examination findings',
                      controller: examinationController,
                      maxLines: 5,
                    ),

                    const SizedBox(height: 20),

                    sectionField(
                      label: 'Diagnosis',
                      hint: 'Enter diagnosis',
                      controller: diagnosisController,
                      maxLines: 4,
                    ),

                    const SizedBox(height: 20),

                    sectionField(
                      label: 'Additional Notes',
                      hint: 'Add any additional notes',
                      controller: notesController,
                      maxLines: 5,
                    ),
                  ],
                ),
              ),
            ),

            // Continue button
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
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TreatmentScreen(
                          patientName: widget.patientName,
                        ),
                      ),
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
                  child: const Text(
                    'Continue to Treatment',
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