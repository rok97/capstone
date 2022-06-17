// import 'package:flutter/material.dart';
// import 'dart:async';
// // import 'package:naver_map_plugin/naver_map_plugin.dart';
// import 'package:flutter_naver_map/flutter_naver_map.dart';

// class MapPage extends StatefulWidget {
//   @override
//   _MapPageState createState() => _MapPageState();
// }

// class _MapPageState extends State<MapPage> {
//   Completer<NaverMapController> _controller = Completer();
//   MapType _mapType = MapType.Basic;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('NaverMap Test')),
//       body: Container(
//         child: NaverMap(
//           onMapCreated: onMapCreated,
//           mapType: _mapType,
//         ),
//       ),
//     );
//   }

//   void onMapCreated(NaverMapController controller) {
//     if (_controller.isCompleted) _controller = Completer();
//     _controller.complete(controller);
//   }
// }
