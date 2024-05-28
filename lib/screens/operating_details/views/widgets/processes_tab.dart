import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:operations/common/process_card/process_card.dart';
import 'package:operations/screens/operating_details/controller/operating_details_screen_controller.dart';
import 'package:operations/utils/colors.dart';
import 'package:operations/utils/consts.dart';
import 'package:operations/utils/messages.dart';

class OperatingProcessesTab extends GetView<OperatingDetailsScreenController> {
  const OperatingProcessesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Text(
            Consts.stages.tr,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Obx(
            () => controller.processes.isEmpty
                ? Center(
                    child: Text(
                      Messages.emptyProcessesList,
                      style: const TextStyle(color: CustomColors.tuna),
                    ),
                  )
                : Column(
                    children: [
                      const SizedBox(
                        height: 10.0,
                      ),
                      ...controller.processes
                          .map((p) => ProcessCard(process: p)),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
