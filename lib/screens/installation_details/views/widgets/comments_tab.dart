import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:operations/common/custom_circular_progress_indecator.dart';
import 'package:operations/common/searchbars/searchbar.dart';
import 'package:operations/common/text_fields/comment_field.dart';
import 'package:operations/screens/installation_details/controller/installation_details_screen_controller.dart';
import 'package:operations/utils/assets.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';

class CommentsTab extends GetView<InstallationDetailsScreenController> {
  const CommentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              Consts.comments.tr,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            CustomSearchBar(
              borderColor: CustomColors.white,
              widthRatio: 0.60,
              controller: controller.searchController,
              textInputType: TextInputType.text,
              labelText: Consts.search,
              obscureText: false,
              validator: controller.validator,
              onTap: () {},
              onChange: controller.search,
              fillColor: CustomColors.transparent,
              fontColor: CustomColors.white,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.50,
              child: Obx(
                () => controller.comments.isEmpty &&
                        !controller.isCommentsLoading.value
                    ? const Center(
                        child: Text('No Data Here'),
                      )
                    : ListView.builder(
                        controller: controller.scrollController,
                        itemCount: controller.comments.length +
                            (controller.isCommentsLoading.value ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index < controller.comments.length) {
                            return Container(
                              padding: const EdgeInsets.all(10.0),
                              margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: CustomColors.whiteTransparent50,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 20.0,
                                            width: 20.0,
                                            child: Assets.profilePicture,
                                          ),
                                          const SizedBox(
                                            width: 3.0,
                                          ),
                                          Text(
                                            controller.comments[index]
                                                    .recordAddBy ??
                                                '',
                                            style:
                                                const TextStyle(fontSize: 10.0),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        60.0, 0.0, 60.0, 0.0),
                                    child: Text(
                                      controller.comments[index].note ?? '',
                                      style: const TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return const Center(
                              child: CustomCircularProgressIndicator(),
                            );
                          }
                        },
                      ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            CommentField(
              onSubmit: controller.postComment,
              maxLines: 1,
              chatController: controller.chatController,
              textInputType: TextInputType.text,
              labelText: Consts.comment,
              obscureText: false,
              validator: controller.validator,
              onTap: (context, controller) {},
              fillColor: CustomColors.softPeach,
              widthRatio: 0.70,
              heightRatio: 0.06,
              borderColor: CustomColors.softPeach,
            ),
          ],
        ),
      ),
    );
  }
}
