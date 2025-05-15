import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/shared_prefs_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  Future<void> _handleLogout(BuildContext context) async {
    await SharedPrefsHelper.clearAll();
    // ignore: use_build_context_synchronously
    GoRouter.of(context).go('/');
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => _handleLogout(context),
      icon: const Icon(Icons.logout, color: Colors.red),
      label: const Text(
        "Logout",
        style: TextStyle(
          color: Colors.red,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: TextButton.styleFrom(
        backgroundColor: kPrimaryColor.withOpacity(0.1),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
