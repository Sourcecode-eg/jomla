import 'package:flutter/material.dart';

class SupportBottomSheet extends StatelessWidget {
  const SupportBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'المساعدة',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),

          // التواصل عبر الخط الساخن
          supportButton(
            icon: Icons.headset_mic,
            label: 'التواصل عبر الخط الساخن\n091845xxxx',
            onTap: () {
              // اتصل
            },
          ),

          // واتساب
          supportButton(
            icon: Icons.facebook,
            label: 'التواصل عبر واتساب',
            onTap: () {
              // افتح واتساب
            },
          ),

          // فيسبوك
          supportButton(
            icon: Icons.facebook,
            label: 'التواصل عبر الفيس',
            onTap: () {
              // افتح فيسبوك
            },
          ),

          // ارسال الشكوى
          supportButton(
            icon: Icons.question_mark,
            label: 'ارسل الشكوى',
            onTap: () {
              // افتح صفحة الشكاوى
            },
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget supportButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(icon, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(label, style: const TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
