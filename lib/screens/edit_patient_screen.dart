import 'package:flutter/material.dart';

class EditPatientScreen extends StatefulWidget {
  const EditPatientScreen({super.key});

  @override
  State<EditPatientScreen> createState() => _EditPatientScreenState();
}

class _EditPatientScreenState extends State<EditPatientScreen> {
  final TextEditingController nameController =
      TextEditingController(text: 'Aarav Mehta');

  final TextEditingController phoneController =
      TextEditingController(text: '+91 98765 43210');

  final TextEditingController addressController =
      TextEditingController(text: 'Pune, Maharashtra');

  final TextEditingController emergencyController =
      TextEditingController(text: '+91 98765 12345');

  String selectedGender = 'Male';
  DateTime? selectedDate = DateTime(1998, 5, 14);

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    emergencyController.dispose();
    super.dispose();
  }

  Future<void> selectDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  String formatDate(DateTime? date) {
    if (date == null) return 'Select date';

    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  void saveChanges() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Patient details updated successfully'),
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
                    'Edit Patient',
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
                    // Profile preview
                    Center(
                      child: Column(
                        children: [
                          Container(
                            width: 78,
                            height: 78,
                            decoration: const BoxDecoration(
                              color: Color(0xFFDCEEFF),
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Text(
                                'AM',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF2979D8),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Update patient information',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF7B8794),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    const Text(
                      'Basic Information',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1F2933),
                      ),
                    ),

                    const SizedBox(height: 14),

                    _inputField(
                      label: 'Full Name',
                      controller: nameController,
                      icon: Icons.person_outline_rounded,
                    ),

                    const SizedBox(height: 14),

                    _inputField(
                      label: 'Mobile Number',
                      controller: phoneController,
                      icon: Icons.phone_outlined,
                      keyboardType: TextInputType.phone,
                    ),

                    const SizedBox(height: 14),

                    // Date of birth
                    _fieldLabel('Date of Birth'),

                    const SizedBox(height: 7),

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
                            const Icon(
                              Icons.calendar_today_outlined,
                              size: 20,
                              color: Color(0xFF6B7C8A),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              formatDate(selectedDate),
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF263238),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    // Gender
                    _fieldLabel('Gender'),

                    const SizedBox(height: 7),

                    Row(
                      children: [
                        Expanded(
                          child: _genderButton('Male'),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _genderButton('Female'),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _genderButton('Other'),
                        ),
                      ],
                    ),

                    const SizedBox(height: 26),

                    const Text(
                      'Contact Information',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1F2933),
                      ),
                    ),

                    const SizedBox(height: 14),

                    _inputField(
                      label: 'Address',
                      controller: addressController,
                      icon: Icons.location_on_outlined,
                      maxLines: 2,
                    ),

                    const SizedBox(height: 14),

                    _inputField(
                      label: 'Emergency Contact',
                      controller: emergencyController,
                      icon: Icons.contact_phone_outlined,
                      keyboardType: TextInputType.phone,
                    ),

                    const SizedBox(height: 30),

                    // Save button
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: saveChanges,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3B82F6),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'Save Changes',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Cancel
                    SizedBox(
                      width: double.infinity,
                      height: 50,
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

  Widget _inputField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _fieldLabel(label),
        const SizedBox(height: 7),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsets.only(
                bottom: maxLines > 1 ? 20 : 0,
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
          ),
        ),
      ],
    );
  }

  Widget _fieldLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Color(0xFF34424D),
      ),
    );
  }

  Widget _genderButton(String gender) {
    final bool selected = selectedGender == gender;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender;
        });
      },
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFFEAF4FF)
              : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected
                ? const Color(0xFF3B82F6)
                : const Color(0xFFE3EAF0),
          ),
        ),
        child: Center(
          child: Text(
            gender,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: selected
                  ? const Color(0xFF3B82F6)
                  : const Color(0xFF6B7C8A),
            ),
          ),
        ),
      ),
    );
  }
}