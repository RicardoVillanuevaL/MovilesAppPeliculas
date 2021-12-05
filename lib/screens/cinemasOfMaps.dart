import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class CinemasPoints extends StatefulWidget {
  const CinemasPoints({Key? key}) : super(key: key);

  @override
  _CinemasPointsState createState() => _CinemasPointsState();
}

class _CinemasPointsState extends State<CinemasPoints> {
  final location = LatLng(-12.033738, -77.0092206);
  final latituds = [
    -12.032738,
    -12.0137380,
    -12.103738,
    -12.031738,
    -12.071238
  ];
  final longitud = [
    -77.0012206,
    -77.0072206,
    -77.0102206,
    -77.0092116,
    -77.0092206
  ];
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: GoogleMap(
            initialCameraPosition: CameraPosition(target: location, zoom: 14),
            myLocationButtonEnabled: true,
            markers: <Marker>{
              Marker(
                  markerId: MarkerId('marker 1'),
                  position: LatLng(latituds[0], longitud[0])),
                  Marker(
                  markerId: MarkerId('marker 2'),
                  position: LatLng(latituds[1], longitud[1])),
                  Marker(
                  markerId: MarkerId('marker 3'),
                  position: LatLng(latituds[2], longitud[2])),
                  Marker(
                  markerId: MarkerId('marker 4'),
                  position: LatLng(latituds[3], longitud[3])),
                  Marker(
                  markerId: MarkerId('marker 5'),
                  position: LatLng(latituds[4], longitud[4])),
            },
          ),
        ));
  }
}
