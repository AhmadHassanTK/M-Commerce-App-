import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoes_app/Models/Model/AddressModel.dart';
import 'package:shoes_app/Models/Model/CartItemModel.dart';
import 'package:shoes_app/utils/constants/enums.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';

class OrderModel {
  final String id;
  final String userId;
  final double totalAmount;
  final DateTime orderdate;
  final String paymentMethod;
  final AddressModel? address;
  final DateTime? deliveryDate;
  final List<CartItemModel> items;
  final OrderStatus status;

  OrderModel({
    required this.id,
    this.userId = '',
    required this.items,
    required this.status,
    required this.totalAmount,
    required this.orderdate,
    this.paymentMethod = 'PayPal',
    this.address,
    this.deliveryDate,
  });

  String get formattedOrderDate => CHelperFunctions.getFormattedDate(orderdate);
  String get formattedDeliveryDate => deliveryDate != null
      ? CHelperFunctions.getFormattedDate(deliveryDate!)
      : '';
  String get orderStatusText => status == OrderStatus.delivered
      ? 'Delivered'
      : status == OrderStatus.shipped
          ? 'Shipment on the way'
          : 'Processing';

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'Status': status.toString(),
      'TotalAmount': totalAmount,
      'OrderDate': orderdate,
      'PaymentMethod': paymentMethod,
      'Address': address?.toJson(),
      'DeliveryDate': deliveryDate,
      'Items': items.map((e) => e.toJson()).toList(),
    };
  }

  OrderModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.data()!['id'] as String,
        userId = snapshot.data()!['userId'] as String,
        status = OrderStatus.values
            .firstWhere((e) => e.toString() == snapshot.data()!['Status']),
        totalAmount = snapshot.data()!['TotalAmount'] as double,
        orderdate = (snapshot.data()!['OrderDate'] as Timestamp).toDate(),
        paymentMethod = snapshot.data()!['PaymentMethod'] as String,
        address = AddressModel.fromJson(
            snapshot.data()!['Address'] as Map<String, dynamic>),
        deliveryDate = snapshot.data()!['DeliveryDate'] == null
            ? null
            : (snapshot.data()!['DeliveryDate'] as Timestamp).toDate(),
        items = (snapshot.data()!['Items'] as List<dynamic>)
            .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
            .toList();
}
