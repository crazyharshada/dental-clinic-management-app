import 'package:flutter/material.dart';

class AddPatientScreen extends StatefulWidget {
  const AddPatientScreen({super.key});

  @override
  State<AddPatientScreen> createState() => _AddPatientScreenState();
}

class _AddPatientScreenState extends State<AddPatientScreen> {
  String selectedGender = 'Male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FC),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // ================= HEADER =================

                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 43,
                            height: 43,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: const Icon(
                              Icons.arrow_back_rounded,
                              color: Color(0xFF172033),
                              size: 22,
                            ),
                          ),
                        ),

                        const SizedBox(width: 14),

                        const Text(
                          'Add Patient',
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF172033),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),

                    // ================= PROFILE ICON =================

                    Center(
                      child: Container(
                        width: 82,
                        height: 82,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE5EEFF),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.person_add_alt_1_rounded,
                          color: Color(0xFF527FD4),
                          size: 38,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Center(
                      child: Text(
                        'Create a patient record',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF7A8497),
                        ),
                      ),
                    ),

                    const SizedBox(height: 28),

                    // ================= PERSONAL INFORMATION =================

                    const Text(
                      'Personal Information',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF172033),
                      ),
                    ),

                    const SizedBox(height: 13),

                    _inputField(
                      label: 'Full Name',
                      hint: 'Enter patient name',
                      icon: Icons.person_outline_rounded,
                    ),

                    const SizedBox(height: 14),

                    _inputField(
                      label: 'Mobile Number',
                      hint: 'Enter mobile number',
                      icon: Icons.phone_outlined,
                      keyboardType: TextInputType.phone,
                    ),

                    const SizedBox(height: 14),

                    // DATE OF BIRTH
                    const Text(
                      'Date of Birth',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF344056),
                      ),
                    ),

                    const SizedBox(height: 7),

                    GestureDetector(
                      onTap: () async {
                        await showDatePicker(
                          context: context,
                          firstDate: DateTime(1920),
                          lastDate: DateTime.now(),
                          initialDate: DateTime(
                            2000,
                            1,
                            1,
                          ),
                        );
                      },
                      child: Container(
                        height: 52,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.calendar_today_outlined,
                              color: Color(0xFF527FD4),
                              size: 20,
                            ),
                            SizedBox(width: 11),
                            Text(
                              'Select date of birth',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF9AA3B3),
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Color(0xFFA8B0BE),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    // ================= GENDER =================

                    const Text(
                      'Gender',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF344056),
                      ),
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        _genderOption('Male'),
                        const SizedBox(width: 10),
                        _genderOption('Female'),
                        const SizedBox(width: 10),
                        _genderOption('Other'),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // ================= CONTACT =================

                    const Text(
                      'Contact Details',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF172033),
                      ),
                    ),

                    const SizedBox(height: 13),

                    _inputField(
                      label: 'Address',
                      hint: 'Enter patient address',
                      icon: Icons.location_on_outlined,
                      maxLines: 2,
                    ),

                    const SizedBox(height: 14),

                    _inputField(
                      label: 'Emergency Contact',
                      hint: 'Name & phone number',
                      icon: Icons.contact_emergency_outlined,
                    ),

                    const SizedBox(height: 28),

                    // ================= SAVE BUTTON =================

                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5B84D7),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                        child: const Text(
                          'Save Patient',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Center(
                      child: Text(
                        'Patient information can be edited later',
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFF9AA3B3),
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

  // =============================================================
  // INPUT FIELD
  // =============================================================

  Widget _inputField({
    required String label,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF344056),
          ),
        ),

        const SizedBox(height: 7),

        TextField(
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              fontSize: 13,
              color: Color(0xFF9AA3B3),
            ),
            prefixIcon: Icon(
              icon,
              color: const Color(0xFF527FD4),
              size: 20,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 15,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Color(0xFF5B84D7),
                width: 1.2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // =============================================================
  // GENDER OPTION
  // =============================================================

  Widget _genderOption(String gender) {
    final bool selected = selectedGender == gender;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedGender = gender;
          });
        },
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            color: selected
                ? const Color(0xFFEAF1FF)
                : Colors.white,
            borderRadius: BorderRadius.circular(13),
            border: Border.all(
              color: selected
                  ? const Color(0xFF5B84D7)
                  : Colors.transparent,
              width: 1.2,
            ),
          ),
          child: Center(
            child: Text(
              gender,
              style: TextStyle(
                fontSize: 12,
                fontWeight: selected
                    ? FontWeight.w600
                    : FontWeight.w400,
                color: selected
                    ? const Color(0xFF527FD4)
                    : const Color(0xFF6F7890),
              ),
            ),
          ),
        ),
      ),
    );
  }
}