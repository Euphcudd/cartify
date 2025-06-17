import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationHelper {
  static Future<void> sendNewOrderNotification(
    String userId,
    String orderId,
  ) async {
    final adminRef = FirebaseFirestore.instance
        .collection('admin_notifications')
        .doc();
    await adminRef.set({
      'type': 'new_order',
      'userId': userId,
      'orderId': orderId,
      'timestamp': FieldValue.serverTimestamp(),
      'message': 'New order received: $orderId',
    });
  }
}
