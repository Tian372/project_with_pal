class Transaction {
  final String uid;
  final String userId;
  final String merchantId;
  final List<String> order;
  String payment;

  Transaction({this.uid, this.userId, this.merchantId, this.order, this.payment});

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    uid: json['uid'] as String,
    userId: json['userId'] as String,
    merchantId: json['merchantId'] as String,
    order: json['order'] as List<String>,
    payment: json['payment'] as String,
  );
}