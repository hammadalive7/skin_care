

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/ui/views/add_card/components/add_card_card_cvv_field.dart';
import 'package:skin_care/ui/views/add_card/components/add_card_card_expiry_date_field.dart';
import 'package:skin_care/ui/views/add_card/components/add_card_card_holder_field.dart';
import 'package:skin_care/ui/views/add_card/components/add_card_card_number_field.dart';
import 'package:skin_care/ui/views/add_card/components/add_card_card_type_field.dart';
import 'package:skin_care/ui/views/add_card/components/add_card_done_button.dart';

class AddCardForm extends StatefulWidget {
  const AddCardForm({
    super.key,
  });

  @override
  State<AddCardForm> createState() => _AddCardFormState();
}

class _AddCardFormState extends State<AddCardForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: DeviceUtils.getDynamicWidth(context, 0.07),
        vertical: 16.0,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const AddCardCardTypeField(),
            const AddCardCardNumberField(),
            const AddCardCardHolderField(),
            const Row(
              children: [
                Expanded(child: AddCardCardExpiryDateField()),
                SizedBox(width: 16.0),
                Expanded(child: AddCardCardCVVField()),
              ],
            ),
            AddCardDoneButton(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  Get
                    ..back()
                    ..showSnackbar(
                      GetSnackBar(
                        message: TranslationKeys.changesSavedSuccessfully.tr,
                        duration: const Duration(seconds: 3),
                      ),
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
