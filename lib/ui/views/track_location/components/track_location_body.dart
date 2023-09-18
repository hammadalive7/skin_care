
import 'package:flutter/material.dart';

import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/ui/views/track_location/components/track_location_map.dart';

class TrackLocationBody extends BaseStatelessWidget {
  const TrackLocationBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TrackLocationMap();
  }
}
