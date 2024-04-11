import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: FlutterFlowGoogleMap(
          controller: _model.googleMapsController,
          onCameraIdle: (latLng) =>
              setState(() => _model.googleMapsCenter = latLng),
          initialLocation: _model.googleMapsCenter ??=
              const LatLng(13.106061, -59.613158),
          markerColor: GoogleMarkerColor.red,
          mapType: MapType.normal,
          style: GoogleMapStyle.standard,
          initialZoom: 14.0,
          allowInteraction: true,
          allowZoom: true,
          showZoomControls: true,
          showLocation: true,
          showCompass: false,
          showMapToolbar: false,
          showTraffic: false,
          centerMapOnMarkerTap: true,
        ),
      ),
    );
  }
}
