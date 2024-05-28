// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:operations/common/bottombar/custom_bottombar.dart';
// import 'package:operations/common/buttons/submit_button.dart';
// import 'package:operations/common/sidebar/custom_sidebar.dart';
// import 'package:operations/common/text_fields/text_field.dart';
// import 'package:operations/screens/level_details/controller/level_details_screen_controller.dart';
// import 'package:operations/utils/assets.dart';
// import 'package:operations/utils/colors.dart';
// import 'package:operations/utils/consts.dart';
// import 'package:operations/utils/lists.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';

// class LevelDetailsScreen extends GetView<LevelDetailsScreenController> {
//   LevelDetailsScreen({super.key});
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: CustomColors.pacificBlue,
//       key: _scaffoldKey,
//       appBar: AppBar(
//         title: Text(Consts.projectName.tr),
//         backgroundColor: CustomColors.pacificBlue,
//         leading: IconButton(
//           icon: Assets.spinelDarkLogo,
//           onPressed: () {
//             _scaffoldKey.currentState!.openDrawer();
//           },
//         ),
//       ),
//       drawer: const CustomSidebar(),
//       body: SafeArea(
//           child: Container(
//         padding: const EdgeInsets.all(10.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 20.0,
//               ),
//               Container(
//                 margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10.0),
//                   border: Border.all(
//                     color: CustomColors.black,
//                   ),
//                   color: CustomColors.softPeach,
//                 ),
//                 child: Column(
//                   children: [
//                     LinearPercentIndicator(
//                       backgroundColor: CustomColors.softPeach,
//                       progressColor:
//                           controller.process.value.amount!.value < 0.5
//                               ? CustomColors.lightRed
//                               : controller.process.value.amount!.value == 1.0
//                                   ? CustomColors.lightGreen
//                                   : CustomColors.lightYellow,
//                       lineHeight: MediaQuery.of(context).size.height * 0.05,
//                       percent: controller.process.value.amount!.value,
//                       animation: true,
//                       animationDuration: 500,
//                       center: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                             height: 15.0,
//                             width: 15.0,
//                             child: Assets.rightwardIcon,
//                           ),
//                           Container(
//                               margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                               child: Text(
//                                 controller.process.value.labelAr ?? '',
//                               )),
//                         ],
//                       ),
//                     ),
//                     LinearPercentIndicator(
//                       backgroundColor: CustomColors.softPeach,
//                       progressColor:
//                           controller.process.value.amount!.value < 0.5
//                               ? CustomColors.red
//                               : controller.process.value.amount!.value == 1.0
//                                   ? CustomColors.green
//                                   : CustomColors.yellow,
//                       lineHeight: 12,
//                       percent: controller.process.value.amount!.value,
//                       animation: true,
//                       animationDuration: 500,
//                       center: Container(
//                           alignment: Alignment.centerLeft,
//                           padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
//                           child: Text(
//                             '${controller.process.value.amount!.value * 100}%',
//                             style: const TextStyle(
//                               fontSize: 8,
//                             ),
//                             textAlign: TextAlign.center,
//                           )),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                 margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10.0),
//                   color: CustomColors.white,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(Consts.fromDate.tr),
//                     CustomTextFormField(
//                       readOnly: false,
//                       textAlign: TextAlign.start,
//                       textColor: CustomColors.black,
//                       heightRatio: 0.07,
//                       borderColor: CustomColors.white,
//                       widthRatio: 0.5,
//                       fillColor: CustomColors.white,
//                       maxLines: 1,
//                       controller: controller.orderFromDateController,
//                       textInputType: TextInputType.datetime,
//                       labelText: Consts.emptyString,
//                       obscureText: false,
//                       validator: controller.validator,
//                       onTap: controller.pickDate,
//                       onChanged: () {},
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                 margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10.0),
//                   color: CustomColors.white,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(Consts.toDate.tr),
//                     CustomTextFormField(
//                       readOnly: false,
//                       textAlign: TextAlign.start,
//                       textColor: CustomColors.black,
//                       heightRatio: 0.07,
//                       borderColor: CustomColors.white,
//                       widthRatio: 0.5,
//                       fillColor: CustomColors.white,
//                       maxLines: 1,
//                       controller: controller.orderToDateController,
//                       textInputType: TextInputType.datetime,
//                       labelText: Consts.emptyString,
//                       obscureText: false,
//                       validator: controller.validator,
//                       onTap: controller.pickDate,
//                       onChanged: () {},
//                     ),
//                   ],
//                 ),
//               ),
//               InkWell(
//                 onTap: controller.showAdminDialog,
//                 child: Container(
//                   padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                   margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10.0),
//                     color: CustomColors.white,
//                   ),
//                   child: SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.07,
//                     width: MediaQuery.of(context).size.width * 0.90,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(Consts.admin.tr),
//                         Text(Lists.admins[0]),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: controller.showDetailsDialog,
//                 child: Container(
//                   padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                   margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10.0),
//                     color: CustomColors.white,
//                   ),
//                   child: Container(
//                     padding: const EdgeInsets.all(10.0),
//                     height: MediaQuery.of(context).size.height * 0.07,
//                     width: MediaQuery.of(context).size.width * 0.90,
//                     child: Text(
//                       Consts.details.tr,
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: controller.showOtherCostsDialog,
//                 child: Container(
//                   padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                   margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10.0),
//                     color: CustomColors.white,
//                   ),
//                   child: Container(
//                     padding: const EdgeInsets.all(10.0),
//                     height: MediaQuery.of(context).size.height * 0.07,
//                     width: MediaQuery.of(context).size.width * 0.90,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           Consts.sumOtherCosts.tr,
//                           textAlign: TextAlign.center,
//                         ),
//                         Text('${controller.totalCost.value}'),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10.0,
//               ),
//               CustomTextFormField(
//                 readOnly: false,
//                 textAlign: TextAlign.start,
//                 textColor: CustomColors.black,
//                 heightRatio: 0.20,
//                 maxLines: 10,
//                 controller: controller.noteController,
//                 textInputType: TextInputType.text,
//                 labelText: Consts.note,
//                 obscureText: false,
//                 validator: controller.validator,
//                 onTap: (context, controller) {},
//                 onChanged: () {},
//                 fillColor: CustomColors.white,
//                 widthRatio: 1,
//                 borderColor: CustomColors.white,
//               ),
//               const SizedBox(
//                 height: 10.0,
//               ),
//               SubmitButton(
//                 title: Consts.save.tr,
//                 formKey: _keyForm,
//                 handle: () {},
//               ),
//             ],
//           ),
//         ),
//       )),
//       bottomNavigationBar: const CustomBottomBar(),
//     );
//   }
// }
