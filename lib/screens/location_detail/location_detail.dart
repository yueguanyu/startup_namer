import 'package:flutter/material.dart';

class LocationDetail extends StatelessWidget {
  final int _locationID;
  const LocationDetail(this._locationID);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LocationDetails $_locationID $_locationID'),
      ),
      body: Container(),
    );
  }
}