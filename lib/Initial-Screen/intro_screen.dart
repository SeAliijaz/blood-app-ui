// import 'dart:async';
// import 'package:blood_app_ui/Constants/constants.dart';
// import 'package:blood_app_ui/Credientals-Screens/login_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class RequestBlood extends StatefulWidget {
//   const RequestBlood({Key? key}) : super(key: key);

//   @override
//   State<RequestBlood> createState() => _RequestBloodState();
// }

// class _RequestBloodState extends State<RequestBlood> {
//   Timer? timer;

//   @override
//   void initState() {
//     timer = Timer.periodic(Duration(seconds: 3), (timer) async {
//       await Navigator.push(context, MaterialPageRoute(builder: (_) {
//         return LogInScreen();
//       }));
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       ///Next Button Using bottomNavigationBar
//       bottomNavigationBar: InkWell(
//         onTap: () {
//           Navigator.push(context, MaterialPageRoute(builder: (_) {
//             return LogInScreen();
//           }));
//         },
//         child: Container(
//           height: Sizer(context).height * 0.070,
//           color: AppColors.primaryColor,
//           child: Center(
//             child: Text(
//               "Next",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: Sizer(context).height * 0.030,
//               ),
//             ),
//           ),
//         ),
//       ),

//       ///BODY
//       body: SizedBox(
//         height: Sizer(context).height,
//         width: Sizer(context).width,
//         child: SizedBox(
//           height: Sizer(context).height,
//           width: Sizer(context).width,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ///SvgPicture
//               SvgPicture.asset(
//                 "assets/017-blood_drop.svg",
//                 height: Sizer(context).height * 0.25,
//               ),

//               ///SizedBox
//               SizedBox(
//                 height: Sizer(context).height * 0.02,
//               ),

//               ///Text
//               Text(
//                 "Request Blood",
//                 style: TextStyle(
//                   color: AppColors.primaryColor,
//                   fontStyle: FontStyle.italic,
//                   fontSize: Sizer(context).height * 0.04,
//                 ),
//               ),

//               ///SizedBox
//               SizedBox(
//                 height: Sizer(context).height * 0.02,
//               ),

//               ///Text
//               Text(
//                 "Submit a blood request and let the donors know!",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontStyle: FontStyle.italic,
//                   fontSize: Sizer(context).height * 0.025,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
