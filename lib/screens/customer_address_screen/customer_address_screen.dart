import 'package:e_service_app/components/custom_return_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class CustomerAddressScreen extends StatefulWidget {
  @override
  _CustomerAddressScreenState createState() => _CustomerAddressScreenState();
}

class _CustomerAddressScreenState extends State<CustomerAddressScreen> {
  BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    setCustomMapPin();
    // _onMapCreated(_controller);
  }

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 1),
        'lib/assets/maps-and-flags.png');
  }

  LatLng pinPosition = LatLng(13.0, 13.0);
  Location _location = Location();

  GoogleMapController _controller;

  void setMarker(CameraPosition l) {
    pinPosition = new LatLng(l.target.latitude, l.target.longitude);
    _markers.add(
      Marker(
          markerId: MarkerId('<MARKER_ID>'),
          position: pinPosition,
          icon: pinLocationIcon),
    );
    setState(() {});
  }

  // ignore: unused_element
  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    _location.onLocationChanged.listen(
      (l) {
        pinPosition = new LatLng(l.latitude, l.longitude);
        _controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: pinPosition, zoom: 15),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialLocation =
        CameraPosition(zoom: 16, bearing: 30, target: pinPosition);

    return Container(
      height: MediaQuery.of(context).size.height * 0.78,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              myLocationEnabled: true,
              compassEnabled: true,
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              markers: _markers,
              initialCameraPosition: initialLocation,
              // onMapCreated: _onMapCreated,
              onCameraMove: setMarker,
            ),
            CustomReturnBar()
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          padding: EdgeInsets.only(bottom: 16.0),
          width: MediaQuery.of(context).size.width * 0.8,
          child: IconButton(
            icon: Icon(FontAwesomeIcons.accessibleIcon),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
