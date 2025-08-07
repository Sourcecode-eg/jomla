import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

class ToastHelper {
  static void show({
    BuildContext? context,
    required String title,
    required String description,
    required IconData icon,
    required Color backgroundColor,
  }) {
    if (context == null) return;

    Flushbar(
      backgroundColor: backgroundColor,
      borderRadius: BorderRadius.circular(12),
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      duration: const Duration(seconds: 3),
      messageText: Row(
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    ).show(context);
  }

  static void showSuccess({
    BuildContext? context,
    required String title,
    required String description,
  }) {
    show(
      context: context,
      title: title,
      description: description,
      icon: Icons.check_circle,
      backgroundColor: Colors.green,
    );
  }

  static void showError({
    BuildContext? context,
    required String title,
    required String description,
  }) {
    show(
      context: context,
      title: title,
      description: description,
      icon: Icons.error_outline,
      backgroundColor: Colors.red,
    );
  }

  static void showWarning({
    BuildContext? context,
    required String title,
    required String description,
  }) {
    show(
      context: context,
      title: title,
      description: description,
      icon: Icons.warning_amber_rounded,
      backgroundColor: Colors.orange,
    );
  }
}
