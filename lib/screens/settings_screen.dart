import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _appointmentReminders = true;
  bool _visitAlerts = false;
  bool _darkMode = false;
  bool _soundEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FC),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 22, 20, 0),
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
                        border: Border.all(color: const Color(0xFFE6EDF3)),
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
                    'Settings',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1F2933),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 30),
                children: [
                  _sectionTitle('Notifications'),
                  const SizedBox(height: 10),
                  _toggleCard(
                    icon: Icons.notifications_outlined,
                    iconColor: const Color(0xFF3B82F6),
                    iconBg: const Color(0xFFEAF4FF),
                    label: 'Push Notifications',
                    subtitle: 'Enable or disable all notifications',
                    value: _notificationsEnabled,
                    onChanged: (v) => setState(() => _notificationsEnabled = v),
                  ),
                  const SizedBox(height: 10),
                  _toggleCard(
                    icon: Icons.alarm_outlined,
                    iconColor: const Color(0xFF10B981),
                    iconBg: const Color(0xFFEAFAF4),
                    label: 'Appointment Reminders',
                    subtitle: 'Get reminded before patient appointments',
                    value: _appointmentReminders,
                    onChanged: (v) => setState(() => _appointmentReminders = v),
                  ),
                  const SizedBox(height: 10),
                  _toggleCard(
                    icon: Icons.medical_services_outlined,
                    iconColor: const Color(0xFF8B5CF6),
                    iconBg: const Color(0xFFF3EEFF),
                    label: 'Visit Alerts',
                    subtitle: 'Notify when a visit is saved or updated',
                    value: _visitAlerts,
                    onChanged: (v) => setState(() => _visitAlerts = v),
                  ),

                  const SizedBox(height: 24),
                  _sectionTitle('Appearance'),
                  const SizedBox(height: 10),
                  _toggleCard(
                    icon: Icons.dark_mode_outlined,
                    iconColor: const Color(0xFF6B7785),
                    iconBg: const Color(0xFFF2F5F8),
                    label: 'Dark Mode',
                    subtitle: 'Switch to a darker colour scheme',
                    value: _darkMode,
                    onChanged: (v) => setState(() => _darkMode = v),
                  ),

                  const SizedBox(height: 24),
                  _sectionTitle('Sound & Haptics'),
                  const SizedBox(height: 10),
                  _toggleCard(
                    icon: Icons.volume_up_outlined,
                    iconColor: const Color(0xFFF59E0B),
                    iconBg: const Color(0xFFFFF8E6),
                    label: 'Sound Effects',
                    subtitle: 'Play sounds for actions and alerts',
                    value: _soundEnabled,
                    onChanged: (v) => setState(() => _soundEnabled = v),
                  ),

                  const SizedBox(height: 24),
                  _sectionTitle('Data'),
                  const SizedBox(height: 10),
                  _actionCard(
                    icon: Icons.backup_outlined,
                    iconColor: const Color(0xFF3B82F6),
                    iconBg: const Color(0xFFEAF4FF),
                    label: 'Backup Data',
                    subtitle: 'Save a local copy of clinic records',
                    onTap: () {},
                  ),
                  const SizedBox(height: 10),
                  _actionCard(
                    icon: Icons.delete_outline_rounded,
                    iconColor: const Color(0xFFEF4444),
                    iconBg: const Color(0xFFFEEEEE),
                    label: 'Clear Cache',
                    subtitle: 'Free up temporary storage',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) => Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Color(0xFF1F2933),
        ),
      );

  Widget _toggleCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String label,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE6EDF3)),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
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
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF9AA5B1),
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: const Color(0xFF3B82F6),
          ),
        ],
      ),
    );
  }

  Widget _actionCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String label,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE6EDF3)),
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
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
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF9AA5B1),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: Color(0xFFB0BAC5),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
