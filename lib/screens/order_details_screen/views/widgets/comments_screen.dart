import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/common/searchbars/searchbar.dart';
import 'package:operations/common/text_fields/comment_field.dart';
import 'package:operations/screens/order_details_screen/controller/order_details_screen_controller.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';
import 'package:operations/utils/lists.dart';

class CommentsScreen extends GetView<OrderDetailsScreenController> {
  const CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomSearchBar(
              widthRatio: 0.90,
              controller: controller.searchController,
              textInputType: TextInputType.text,
              labelText: Consts.search,
              obscureText: false,
              validator: controller.validator,
              onTap: () {},
              fillColor: CustomColors.transparent,
              fontColor: CustomColors.white,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Column(
              children: [
                ...Lists.comments.map((c) => Container(
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: CustomColors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 50.0,
                                width: 50.0,
                                child: c.userPicture,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text(c.username),
                            ],
                          ),
                          Container(
                            padding:
                                const EdgeInsets.fromLTRB(60.0, 0.0, 60.0, 0.0),
                            child: Text(c.comment),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            CommentField(
              maxLines: 1,
              chatController: controller.chatController,
              textInputType: TextInputType.text,
              labelText: Consts.comment,
              obscureText: false,
              validator: controller.validator,
              onTap: () {},
              fillColor: CustomColors.white,
              widthRatio: 0.86,
              heightRatio: 0.68,
              borderColor: CustomColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
