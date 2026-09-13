import 'package:flutter/material.dart';
import 'prescription_screen.dart';

class TreatmentScreen extends StatefulWidget {
  final String patientName;

  const TreatmentScreen({
    super.key,
    this.patientName = 'Aarav Mehta',
  });

  @override
  State<TreatmentScreen> createState() => _TreatmentScreenState();
}

class _TreatmentScreenState extends State<TreatmentScreen> {
  final TextEditingController treatmentController = TextEditingController();
  final TextEditingController prescriptionController = TextEditingController();

  @override
  void dispose() {
    treatmentController.dispose();
    prescriptionController.dispose();
    super.dispose();
  }

  void finishVisit() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PrescriptionScreen(
          patientName: widget.patientName,
        ),
      ),
    );
  }

  InputDecoration fieldDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
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
          'Treatment',
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
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF4FF),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.medical_services_outlined,
                            color: Color(0xFF3B82F6),
                            size: 24,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              widget.patientName,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF263238),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    const Text(
                      'Treatment Details',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF263238),
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Treatment Given',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF263238),
                      ),
                    ),

                    const SizedBox(height: 8),

                    TextField(
                      controller: treatmentController,
                      maxLines: 4,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: fieldDecoration('Describe the treatment given'),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'Prescription',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF263238),
                      ),
                    ),

                    const SizedBox(height: 8),

                    TextField(
                      controller: prescriptionController,
                      maxLines: 4,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: fieldDecoration('Add prescribed medication'),
                    ),
                  ],
                ),
              ),
            ),

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
                  onPressed: finishVisit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A90E2),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Finish Visit',
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
