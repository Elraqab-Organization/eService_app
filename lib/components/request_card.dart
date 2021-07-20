// import 'package:e_service_app/providers/requests/requests_action.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:e_service_app/components/card.dart';

// class RequestCard extends StatefulWidget {
//   @override
//   _RequestCardState createState() => _RequestCardState();
// }

// class _RequestCardState extends State<RequestCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer(
//       builder: (context, watch, child) {
//         final data = watch(requestList);
//         return data.map(
//           data: (request) {
//             print(request.value);
//             return CardComponent(
//               data: request.value,
//             );
//           },
//           loading: (_) => Expanded(
//             child: Center(
//               child: CircularProgressIndicator(),
//             ),
//           ),
//           error: (_) => Expanded(
//             child: Center(
//               child: Text("error"),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
