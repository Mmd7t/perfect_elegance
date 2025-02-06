enum OtpType { register, forgetPass, verifyPhone }

enum VehicleInvoiceType { inProgress, completed, pending }

enum TicketType { created, completed, pending, cancelled }

enum TicketPriority { low, medium, high }

enum TicketManagement {
  storeMonitoring,
  financialManagement,
  operations;

  String toSnakeCase() {
    final regex = RegExp(r'(?<=[a-z])(?=[A-Z])');
    return name.replaceAllMapped(regex, (match) => '_').toLowerCase();
  }
}

enum TicketPriorityType { low, medium, high }

enum TransactionStatus { withdraw, deposit }

enum OrderStatusSearch {
  init,
  new1,
  onGoing,
  canceled,
  complete,
  pendingDelivery;

  @override
  String toString() {
    if (name == 'new1') {
      return 'New';
    } else if (name == 'onGoing') {
      return 'OnGoing';
    } else if (name == 'canceled') {
      return 'Canceled';
    } else if (name == 'complete') {
      return 'Complete';
    } else if (name == 'pendingDelivery') {
      return 'PendingDelivery';
    } else {
      return '';
    }
  }
}

enum DeliveryOn { market, customer, init }
