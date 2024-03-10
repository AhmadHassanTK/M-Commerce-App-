import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shoes_app/DataBase/AddressCloud.dart';
import 'package:shoes_app/Models/Model/AddressModel.dart';
import 'package:shoes_app/Views/AddressPage/AddNewAddressScreen.dart';
import 'package:shoes_app/Views/AddressPage/Widgets/AddressContainer.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/cloud_helper_functions.dart';
import 'package:shoes_app/utils/helpers/network_manager.dart';
import 'package:shoes_app/utils/loaders/FullScreenLoader.dart';
import 'package:shoes_app/utils/loaders/Loaders.dart';
import 'package:shoes_app/utils/shared/CSectionTitle.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final addressesCloud = Get.put(AddressCloud());
  Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormkey = GlobalKey<FormState>();
  RxBool refreshData = true.obs;

  Future<List<AddressModel>> getAllUsersAddresses() async {
    try {
      final addresses = await addressesCloud.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere(
        (element) => element.selectedAddress,
        orElse: () => AddressModel.empty(),
      );
      return addresses;
    } catch (e) {
      CLoaders.errorSnackbar(title: 'Address not found', message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newAddress) async {
    try {
      Get.defaultDialog(
        title: '',
        onWillPop: () async {
          return false;
        },
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: const CircularProgressIndicator(),
      );

      if (selectedAddress.value.id.isNotEmpty) {
        await addressesCloud.updateSelectField(selectedAddress.value.id, false);
      }

      newAddress.selectedAddress = true;
      selectedAddress.value = newAddress;
      await addressesCloud.updateSelectField(selectedAddress.value.id, true);

      Get.back();
    } catch (e) {
      CLoaders.errorSnackbar(
          title: 'Error in selection', message: e.toString());
    }
  }

  Future addNewAddress() async {
    try {
      CFullScreenLoader.openLoadingDialog(
          'Storing Address...', CImages.dockeranimation);

      final isconnected = await NetworkManager.instance.isConnected();
      if (!isconnected) {
        CFullScreenLoader.stoploading();
        return;
      }

      if (!addressFormkey.currentState!.validate()) {
        CFullScreenLoader.stoploading();
        return;
      }

      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        postalCode: postalCode.text.trim(),
        country: country.text.trim(),
        selectedAddress: true,
      );

      final id = await addressesCloud.addAddress(address);

      address.id = id;
      await selectAddress(address);

      CFullScreenLoader.stoploading();
      CLoaders.successSnackbar(
        title: 'Congratulations',
        message: 'Your address has been saved successfully',
      );

      refreshData.toggle();

      resetFormFields();

      Navigator.of(Get.context!).pop();
    } catch (e) {
      CFullScreenLoader.stoploading();
      CLoaders.errorSnackbar(title: 'Address Not Found', message: e.toString());
    }
  }

  void resetFormFields() {
    name.clear();
    state.clear();
    country.clear();
    city.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    addressFormkey.currentState?.reset();
  }

  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(CSizes.lg),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CSectionTitle(title: 'Select Address'),
              FutureBuilder(
                future: getAllUsersAddresses(),
                builder: (context, snapshot) {
                  final widget = CCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot);

                  if (widget != null) return widget;

                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => AddressContainer(
                      addressmodel: snapshot.data![index],
                      onTap: () async {
                        await selectAddress(snapshot.data![index]);
                        Get.back();
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: CSizes.defaultSpace * 2),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const AddNewAddressScreen()),
                  child: const Text('Add New Address'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
