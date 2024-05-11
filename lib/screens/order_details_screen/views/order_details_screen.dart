import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/bottombar/custom_bottombar.dart';
import 'package:operations/common/sidebar/custom_sidebar.dart';
import 'package:operations/screens/order_details_screen/views/widgets/comments_screen.dart';
import 'package:operations/screens/order_details_screen/views/widgets/installation_screen.dart';
import 'package:operations/utils/assets.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';

class OrderDetailsScreen extends StatelessWidget {
  OrderDetailsScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.pacificBlue,
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(Consts.projectName.tr),
        backgroundColor: CustomColors.pacificBlue,
        leading: IconButton(
          icon: Assets.spinelLogo,
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
      ),
      drawer: const CustomSidebar(),
      body: SafeArea(
        child: Container(
          color: CustomColors.pacificBlue,
          padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
          child: Container(
              height: MediaQuery.of(context).size.height * 0.80,
              decoration: BoxDecoration(
                  color: CustomColors.lightGrey,
                  borderRadius: BorderRadius.circular(20.0)),
              child: DefaultTabController(
                initialIndex: 0,
                length: 5,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15.0,
                    ),
                    TabBar(
                      tabAlignment: TabAlignment.center,
                      enableFeedback: false,
                      indicatorPadding: const EdgeInsets.all(1.0),
                      indicatorColor: CustomColors.lightGreen,
                      indicatorWeight: 2.0,
                      labelColor: CustomColors.lightGreen,
                      unselectedLabelColor: CustomColors.lightGreen,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelStyle: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.bold),
                      unselectedLabelStyle:
                          const TextStyle(fontWeight: FontWeight.normal),
                      tabs: [
                        Tab(text: Consts.installation.tr),
                        Tab(text: Consts.customerName.tr),
                        Tab(text: Consts.subcontractors.tr),
                        Tab(text: Consts.comments.tr),
                        Tab(text: Consts.details.tr),
                      ],
                    ),
                    const Expanded(
                      child: TabBarView(
                        children: [
                          InstallationScreen(),
                          Text('customer'),
                          Text('subconstrctor'),
                          CommentsScreen(),
                          Text('details'),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
