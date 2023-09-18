

import 'package:flutter/material.dart';

import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/ui/views/add_card/components/add_card_form.dart';

class AddCardBody extends BaseStatelessWidget {
  const AddCardBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: AddCardForm(),
    );
  }
}
