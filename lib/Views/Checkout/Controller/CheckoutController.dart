import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Models/Model/PaymentMethodModel.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/shared/CPaymentTile.dart';
import 'package:shoes_app/utils/shared/CSectionTitle.dart';

class CheckOutController extends GetxController {
  static CheckOutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value =
        PaymentMethodModel(name: 'PayPal', image: CImages.paypal);
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(CSizes.lg),
          child: Column(
            children: [
              const CSectionTitle(
                  title: 'Select Payment Method', showactionbutton: false),
              const SizedBox(height: CSizes.spaceBtwSections),
              CPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'PayPal', image: CImages.paypal)),
              const SizedBox(height: CSizes.spaceBtwSections),
              CPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Google Pay', image: CImages.googlePay)),
              const SizedBox(height: CSizes.spaceBtwSections / 2),
              CPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Apple Pay', image: CImages.applePay)),
              const SizedBox(height: CSizes.spaceBtwSections / 2),
              CPaymentTile(
                  paymentMethod:
                      PaymentMethodModel(name: 'VISA', image: CImages.visa)),
              const SizedBox(height: CSizes.spaceBtwSections / 2),
              CPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Master Card', image: CImages.masterCard)),
              const SizedBox(height: CSizes.spaceBtwSections / 2),
              CPaymentTile(
                  paymentMethod:
                      PaymentMethodModel(name: 'paytm', image: CImages.paytm)),
              const SizedBox(height: CSizes.spaceBtwSections / 2),
              CPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Paystack', image: CImages.paystack)),
              const SizedBox(height: CSizes.spaceBtwSections / 2),
              CPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Credit Card', image: CImages.creditCard)),
              const SizedBox(height: CSizes.spaceBtwSections / 2),
              const SizedBox(height: CSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
