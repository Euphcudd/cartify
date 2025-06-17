class WhatsAppHelper {
  static String buildOrderConfirmationMessage({
    required String name,
    required String invoiceLink,
    required String trackingLink,
  }) {
    return Uri.encodeFull(
      "https://wa.me/?text="
      "Hi $name,\n\n"
      "🧾 Your order has been confirmed!\n"
      "📄 Invoice: $invoiceLink\n"
      "📦 Track Order: $trackingLink\n\n"
      "Thanks for shopping with Cartify 💚",
    );
  }

  static String buildDispatchMessage({
    required String trackingId,
    required String courierLink,
    required String courierBillUrl,
  }) {
    return Uri.encodeFull(
      "https://wa.me/?text="
      "📦 Your order has been dispatched!\n"
      "🆔 Tracking ID: $trackingId\n"
      "🔗 Courier Link: $courierLink\n"
      "🧾 Courier Bill: $courierBillUrl\n\n"
      "Track your shipment for updates 🚚",
    );
  }
}
