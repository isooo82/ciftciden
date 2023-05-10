class OrderedItems {
  final int orderType;
  final DateTime orderDate; // convert FireBase Timestampt to DateTime
  final DateTime orderDateString; //
  final int orderAmount;
  final int isOrderCompleted;

  final String coordinates;

  OrderedItems({
    required this.orderType,
    required this.orderDate,
    required this.orderDateString,
    required this.orderAmount,
    required this.isOrderCompleted,
    required this.coordinates,
  });
}