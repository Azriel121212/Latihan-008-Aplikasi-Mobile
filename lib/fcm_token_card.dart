import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latihan_firebase_mobile/notification_service.dart';

class FcmTokenCard extends StatefulWidget {
  const FcmTokenCard({super.key});

  @override
  State<FcmTokenCard> createState() => _FcmTokenCardState();
}

class _FcmTokenCardState extends State<FcmTokenCard> {
  bool _isSubscribed = true;

  Future<void> _toggleTopic() async {
    if (_isSubscribed) {
      await NotificationService.unsubscribeFromTopic('kelas');
    } else {
      await NotificationService.subscribeToTopic('kelas');
    }

    setState(() {
      _isSubscribed = !_isSubscribed;
    });

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isSubscribed
              ? 'Berhasil subscribe topic kelas'
              : 'Berhasil unsubscribe topic kelas',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: FirebaseMessaging.instance.getToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        final token = snapshot.data ?? 'Token tidak tersedia';
        return Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'FCM Token:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                SelectableText(token, style: const TextStyle(fontSize: 12)),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  icon: const Icon(Icons.copy),
                  label: const Text('Salin Token'),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: token));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Token disalin!')),
                    );
                  },
                ),
                const Divider(height: 24),
                const Text(
                  'Topic Notifikasi (kelas):',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  icon: Icon(
                    _isSubscribed
                        ? Icons.notifications_off
                        : Icons.notifications_active,
                  ),
                  label: Text(
                    _isSubscribed
                        ? 'Unsubscribe Topic Kelas'
                        : 'Subscribe Topic Kelas',
                  ),
                  onPressed: _toggleTopic,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}