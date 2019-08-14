import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class InformationWidgetParent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InformationWidgetParentState();
  }
}

class InformationWidgetParentState extends State<InformationWidgetParent> {
  bool _newValue = false;

  void _handleBoxClicked(bool newValue) {
    setState(() {
      _newValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InformationWidgetChild(
      onChanged: _handleBoxClicked,
      change: _newValue,
    );
  }
}

class InformationWidgetChild extends StatelessWidget {
  InformationWidgetChild(
      {Key key, @required this.onChanged, this.change: false});

  final bool change;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: !change ? _buildTextArea() : _buildGoogleMaps(context),
    );

    //_buildTextArea();
  }

  Widget _buildTextArea() {
    return Container(
      padding: EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );
  }

  Widget _buildGoogleMaps(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
            target: const LatLng(45.521563, -122.677433), zoom: 11.0),
        mapType: MapType.normal,
      ),
    );
  }

  void _handleTap() {
    onChanged(!change);
  }
}
