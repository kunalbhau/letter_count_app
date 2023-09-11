// import 'package:flutter/material.dart';
//
// class SettingsPage extends StatefulWidget {
//   @override
//   _SettingsPageState createState() => _SettingsPageState();
// }
//
// class _SettingsPageState extends State<SettingsPage> {
//   bool _debugLogsEnabled = false;
//   bool _ignoreDuplicateLetters = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('App Settings'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               'Settings',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             ListTile(
//               title: Text('Enable Debug Logs'),
//               trailing: Switch(
//                 // value: _debugLogsEnabled,
//                 onChanged: (value) {
//                   setState(() {
//                     _debugLogsEnabled = value;
//                   });
//                 },
//               ),
//             ),
//             ListTile(
//               title: Text('Ignore Duplicate Letters'),
//               trailing: Switch(
//                 value: _ignoreDuplicateLetters,
//                 onChanged: (value) {
//                   setState(() {
//                     _ignoreDuplicateLetters = value;
//                   });
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
