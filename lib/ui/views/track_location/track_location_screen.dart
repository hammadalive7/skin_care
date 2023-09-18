
import 'package:flutter/material.dart';
import 'package:skin_care/ui/views/track_location/components/track_location_app_bar.dart';
import 'package:skin_care/ui/views/track_location/components/track_location_body.dart';
import 'package:skin_care/ui/views/track_location/components/track_location_info.dart';

class TrackLocationScreen extends StatelessWidget {
  const TrackLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TrackLocationAppBar(),
      body: TrackLocationBody(),
      extendBodyBehindAppBar: true,
      floatingActionButton: TrackLocationInfo(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
