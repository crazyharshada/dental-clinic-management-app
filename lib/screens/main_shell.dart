import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'patients_screen.dart';
import 'appointments_screen.dart';
import 'more_screen.dart';

class MainShell extends StatefulWidget {
  /// Pass an initial tab index if you want to start on a tab other than Home.
  final int initialIndex;

  const MainShell({super.key, this.initialIndex = 0});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  late int _selectedIndex;

  // The three persistent tab screens.
  // IndexedStack keeps all three alive so state is not lost when switching.
  static const List<Widget> _tabs = [
    DashboardScreen(),
    PatientsScreen(),
    AppointmentsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onTabTap(int index) {
    if (index == 3) {
      // "More" is not a persistent tab — push it over the shell
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const MoreScreen()),
      );
      return;
    }
    if (_selectedIndex == index) return; // already on this tab, do nothing
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Each tab is a full Scaffold internally; we must NOT use a second
      // Scaffold body here — just place the tabs directly.
      body: IndexedStack(
        index: _selectedIndex,
        children: _tabs,
      ),

      // ── Single bottom navigation bar for the whole app ──────────────
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Color(0xFFE8EEF3)),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _navItem(
                  icon: Icons.home_outlined,
                  label: 'Home',
                  index: 0,
                ),
                _navItem(
                  icon: Icons.people_alt_outlined,
                  label: 'Patients',
                  index: 1,
                ),
                _navItem(
                  icon: Icons.calendar_month_outlined,
                  label: 'Appointments',
                  index: 2,
                ),
                _navItem(
                  icon: Icons.more_horiz_rounded,
                  label: 'More',
                  index: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    // index 3 (More) is never "selected" in the persistent sense
    final bool selected = _selectedIndex == index && index != 3;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _onTabTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 23,
            color: selected
                ? const Color(0xFF3B82F6)
                : const Color(0xFF8A96A3),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight:
                  selected ? FontWeight.w600 : FontWeight.w500,
              color: selected
                  ? const Color(0xFF3B82F6)
                  : const Color(0xFF8A96A3),
            ),
          ),
        ],
      ),
    );
  }
}
