// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'session.dart';
//
// class WordInputScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final userSession = Provider.of<UserSession>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Word Input App'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: <Widget>[
//             Text(
//               'Words Entered: ${userSession.wordCount} / 20',
//               style: TextStyle(fontSize: 18),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: userSession.wordCount,
//                 itemBuilder: (context, index) {
//                   return TextFormField(
//                     decoration: InputDecoration(labelText: 'Word ${index + 1}'),
//                   );
//                 },
//               ),
//             ),
//             if (userSession.wordCount < 20)
//               ElevatedButton(
//                 onPressed: () {
//                   userSession.incrementWordCount();
//                 },
//                 child: Text('Add Word'),
//               ),
//             ElevatedButton(
//               onPressed: () {
//                 userSession.resetWordCount();
//               },
//               child: Text('Reset Session'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
