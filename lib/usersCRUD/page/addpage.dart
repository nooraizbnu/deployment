//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:file_picker/file_picker.dart';
// import '../services/firebase_crud.dart';
// import 'listpage.dart';
//
// class AddPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return _AddPage();
//   }
// }
//
// class _AddPage extends State<AddPage> {
//   final _employee_name = TextEditingController();
//   final _employee_position = TextEditingController();
//   final _employee_contact = TextEditingController();
//   final _employee_email = TextEditingController();
//   final _employee_picture = TextEditingController();
//
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     final nameField = TextFormField(
//         controller: _employee_name,
//         autofocus: false,
//         validator: (value) {
//           if (value == null || value.trim().isEmpty) {
//             return 'This field is required';
//           }
//         },
//         decoration: InputDecoration(
//             contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//             hintText: "Name",
//             border:
//                 OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
//     final positionField = TextFormField(
//         controller: _employee_position,
//         autofocus: false,
//         validator: (value) {
//           if (value == null || value.trim().isEmpty) {
//             return 'This field is required';
//           }
//         },
//         decoration: InputDecoration(
//             contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//             hintText: "Position",
//             border:
//                 OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
//     final contactField = TextFormField(
//         controller: _employee_contact,
//         autofocus: false,
//         validator: (value) {
//           if (value == null || value.trim().isEmpty) {
//             return 'This field is required';
//           }
//         },
//         decoration: InputDecoration(
//             contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//             hintText: "Contact Number",
//             border:
//                 OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
//     final email = TextFormField(
//         controller: _employee_email,
//         autofocus: false,
//         decoration: InputDecoration(
//             contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//             hintText: "Email",
//             border:
//             OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
//
//     final pictureField = ElevatedButton(onPressed: () async {
//       controller: _employee_picture;
//       final result = await FilePicker.platform.pickFiles(
//         allowedExtensions: ['png','jpg'],
//         type: FileType.custom,
//         allowMultiple: false,
//       );
//       if(result == null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text("No file selected"),
//           )
//         );
//         return null;
//       }
//       final path = result.files.single.path;
//       final fileName = result.files.single.name;
//
//       print(path);
//       print(fileName);
//     }, child: Text("Upload Image"));
//
//     final viewListbutton = TextButton(
//         onPressed: () {
//           Navigator.pushAndRemoveUntil<dynamic>(
//             context,
//             MaterialPageRoute<dynamic>(
//               builder: (BuildContext context) => ListPage(),
//             ),
//             (route) => false, //if you want to disable back feature set to false
//           );
//         },
//         child: const Text('View List of Employee'));
//
//     final SaveButon = Material(
//       elevation: 5.0,
//       borderRadius: BorderRadius.circular(30.0),
//       color: Theme.of(context).primaryColor,
//       child: MaterialButton(
//         minWidth: MediaQuery.of(context).size.width,
//         padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//         onPressed: () async {
//           if (_formKey.currentState!.validate()) {
//
//             var response = await FirebaseCrud.addEmployee(
//                 name: _employee_name.text,
//                 position: _employee_position.text,
//                 contactno: _employee_contact.text,
//                 email: _employee_email.text,
//                 picture: _employee_picture.text,
//             );
//             if (response.code != 200) {
//               showDialog(
//                   context: context,
//                   builder: (context) {
//                     return AlertDialog(
//                       content: Text(response.message.toString()),
//                     );
//                   });
//             } else {
//               showDialog(
//                   context: context,
//                   builder: (context) {
//                     return AlertDialog(
//                       content: Text(response.message.toString()),
//                     );
//                   });
//             }
//           }
//         },
//         child: Text(
//           "Save",
//           style: TextStyle(color: Theme.of(context).primaryColorLight),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: const Text('Firebase CRUD'),
//         backgroundColor: Theme.of(context).primaryColor,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Form(
//             key: _formKey,
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   nameField,
//                   const SizedBox(height: 25.0),
//                   positionField,
//                   const SizedBox(height: 35.0),
//                   contactField,
//                   const SizedBox(height: 35.0),
//                   email,
//                   const SizedBox(height: 35.0),
//                   pictureField,
//                   const SizedBox(height: 35.0),
//                   viewListbutton,
//                   const SizedBox(height: 45.0),
//                   SaveButon,
//                   const SizedBox(height: 15.0),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
