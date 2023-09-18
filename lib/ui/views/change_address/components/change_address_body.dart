
import 'package:flutter/material.dart';

import 'package:skin_care/ui/views/change_address/components/change_address_form.dart';
import 'package:skin_care/ui/views/change_address/components/change_address_title.dart';

class ChangeAddressBody extends StatelessWidget {
  const ChangeAddressBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ChangeAddressTitle(),
          ChangeAddressForm(),
        ],
      ),
    );
  }
}
