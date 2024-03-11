import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoes_app/utils/formatters/formatter.dart';

class AddressModel {
  String id;
  final String name;
  final String phoneNumber;
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final DateTime? dateTime;
  bool selectedAddress;

  AddressModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    this.dateTime,
    this.selectedAddress = true,
  });

  String get formattedPhoneNo => CFormatter.formatPhoneNumber(phoneNumber);

  static AddressModel empty() => AddressModel(
        id: '',
        name: '',
        phoneNumber: '',
        street: '',
        city: '',
        state: '',
        postalCode: '',
        country: '',
      );

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'PhoneNumber': phoneNumber,
      'State': state,
      'Street': street,
      'City': city,
      'PostalCode': postalCode,
      'Country': country,
      'DateTime': DateTime.now(),
      'SelectedAddress': selectedAddress,
    };
  }

  AddressModel.fromJson(Map<String, dynamic> snapshot)
      : id = snapshot['Id'] as String,
        name = snapshot['Name'] as String,
        phoneNumber = snapshot['PhoneNumber'] as String,
        street = snapshot['Street'] as String,
        city = snapshot['City'] as String,
        postalCode = snapshot['PostalCode'] as String,
        country = snapshot['Country'] as String,
        state = snapshot['State'] as String,
        dateTime = (snapshot['DateTime'] as Timestamp).toDate(),
        selectedAddress = snapshot['SelectedAddress'] as bool;

  AddressModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        name = snapshot['Name'] ?? '',
        phoneNumber = snapshot['PhoneNumber'] ?? '',
        street = snapshot['Street'] ?? '',
        city = snapshot['City'] ?? '',
        postalCode = snapshot['PostalCode'] ?? '',
        country = snapshot['Country'] ?? '',
        state = snapshot['State'] ?? '',
        dateTime = (snapshot['DateTime'] as Timestamp).toDate(),
        selectedAddress = snapshot['SelectedAddress'] as bool;

  @override
  String toString() {
    return '$street, $city, $state, $postalCode, $country';
  }
}
