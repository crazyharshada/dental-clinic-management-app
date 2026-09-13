import 'package:flutter/material.dart';
import 'visit_summary_screen.dart';

class PrescriptionScreen extends StatefulWidget {
  final String patientName;

  const PrescriptionScreen({
    super.key,
    this.patientName = 'Aarav Mehta',
  });

  @override
  State<PrescriptionScreen> createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
  final List<Map<String, TextEditingController>> medicines = [];

  @override
  void initState() {
    super.initState();
    _addMedicine();
  }

  void _addMedicine() {
    setState(() {
      medicines.add({
        'medicine': TextEditingController(),
        'dosage': TextEditingController(),
        'frequency': TextEditingController(),
        'duration': TextEditingController(),
        'instructions': TextEditingController(),
      });
    });
  }

  void _removeMedicine(int index) {
    if (medicines.length == 1) return;

    final medicine = medicines[index];

    for (final controller in medicine.values) {
      controller.dispose();
    }

    setState(() {
      medicines.removeAt(index);
    });
  }

  @override
  void dispose() {
    for (final medicine in medicines) {
      for (final controller in medicine.values) {
        controller.dispose();
      }
    }

    super.dispose();
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

  Widget fieldLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Color(0xFF263238),
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
          'Prescription',
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
                          Column(
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
                                'Current Visit',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF6B7785),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    const Text(
                      'Medicines',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF263238),
                      ),
                    ),

                    const SizedBox(height: 16),

                    ...List.generate(
                      medicines.length,
                      (index) {
                        final medicine = medicines[index];

                        return Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 16),
                          padding: const EdgeInsets.all(16),
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
                                  Text(
                                    'Medicine ${index + 1}',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF263238),
                                    ),
                                  ),
                                  const Spacer(),
                                  if (medicines.length > 1)
                                    IconButton(
                                      onPressed: () =>
                                          _removeMedicine(index),
                                      icon: const Icon(
                                        Icons.delete_outline,
                                        size: 21,
                                      ),
                                      color: const Color(0xFF8A96A3),
                                      padding: EdgeInsets.zero,
                                      constraints:
                                          const BoxConstraints(),
                                    ),
                                ],
                              ),

                              const SizedBox(height: 18),

                              fieldLabel('Medicine Name'),
                              TextField(
                                controller: medicine['medicine'],
                                textCapitalization:
                                    TextCapitalization.words,
                                decoration: fieldDecoration(
                                  'e.g. Amoxicillin',
                                ),
                              ),

                              const SizedBox(height: 18),

                              fieldLabel('Dosage'),
                              TextField(
                                controller: medicine['dosage'],
                                decoration: fieldDecoration(
                                  'e.g. 500 mg',
                                ),
                              ),

                              const SizedBox(height: 18),

                              fieldLabel('Frequency'),
                              TextField(
                                controller: medicine['frequency'],
                                decoration: fieldDecoration(
                                  'e.g. Twice a day',
                                ),
                              ),

                              const SizedBox(height: 18),

                              fieldLabel('Duration'),
                              TextField(
                                controller: medicine['duration'],
                                decoration: fieldDecoration(
                                  'e.g. 5 days',
                                ),
                              ),

                              const SizedBox(height: 18),

                              fieldLabel('Instructions'),
                              TextField(
                                controller: medicine['instructions'],
                                maxLines: 3,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                decoration: fieldDecoration(
                                  'e.g. Take after food',
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: OutlinedButton.icon(
                        onPressed: _addMedicine,
                        icon: const Icon(
                          Icons.add,
                          size: 20,
                        ),
                        label: const Text(
                          'Add Another Medicine',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF4A90E2),
                          side: const BorderSide(
                            color: Color(0xFFBFD9F5),
                          ),
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
                        builder: (context) => VisitSummaryScreen(
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
                    'Continue to Summary',
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