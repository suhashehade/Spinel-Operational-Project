import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:operations/common/sidebar/custom_sidebar_controller.dart';
import 'package:operations/models/comment/comment.dart';
import 'package:operations/models/comment/comment_body.dart';
import 'package:operations/models/cost/other_cost.dart';
import 'package:operations/models/cost/other_cost_add_body.dart';
import 'package:operations/models/lkps/lkps.dart';
import 'package:operations/models/operating/operating.dart';
import 'package:operations/models/operating/operating_details.dart';
import 'package:operations/models/operating/operating_process.dart';
import 'package:operations/models/operating/operating_process_details_initial.dart';
import 'package:operations/models/operating/operating_process_details_item.dart';
import 'package:operations/models/operating/operating_process_details_items_body.dart';
import 'package:operations/screens/operating/controller/operating_screen_controller.dart';
import 'package:operations/services/shared_preferences_service.dart';
import 'package:operations/utils/consts.dart';
import 'package:operations/utils/urls.dart';

class OperatingAPI {
  CustomSideBarController controller = Get.put(CustomSideBarController());
  static Map<String, String> headers = {
    "Content-Type": "application/json; charset=utf-8",
  };
  static Future<List<Operating>> getOperationOperatingList(
      String filterKey,
      String filtervalue,
      String searchKey,
      int currentPage,
      int pageSize) async {
    String? token = PrefsService.to.getString(Consts.tokenKey) ??
        PrefsService.to.getString(Consts.clientTokenKey);
    headers['Authorization'] = 'Bearer $token';
    final startTime = DateTime.now();
    http.Response response = await http.get(
      Uri.parse(
          '${Urls.operationOperatingListUrl}?$filterKey=$filtervalue&strSearch=$searchKey&page=$currentPage&pageSize=$pageSize'),
    );
    final responseTime = DateTime.now();
    final totalDuration = responseTime.difference(startTime).inMilliseconds;
    print('Total time taken to fetch data: $totalDuration ms');
    CustomSideBarController controller = Get.put(CustomSideBarController());
    if (response.statusCode == 401) {
      controller.logout();
      Get.snackbar('Error', 'the session is ended');
    }
    if (response.statusCode == 200) {
      Get.find<OperatingScreenController>().rowCount.value =
          json.decode(response.body)['rowsCount'];
      // print(json.decode(response.body)['lstData']);
      return (json.decode(response.body)['lstData'] as List)
          .map((tagJson) => Operating.fromJson(tagJson))
          .toList();
    } else {
      throw Exception('Failed to load operatings');
    }
  }

  static Future<List<OperatingProcess>> getOperationsOperatingProcesses(
      Operating operating) async {
    String? token = PrefsService.to.getString(Consts.tokenKey) ??
        PrefsService.to.getString(Consts.clientTokenKey);
    headers['Authorization'] = 'Bearer $token';
    http.Response response = await http.get(
      Uri.parse(
          '${Urls.getOperationOperatingProcessesListUrl}?OperatingId=${operating.id}'),
    );
    CustomSideBarController controller = Get.put(CustomSideBarController());
    if (response.statusCode == 401) {
      controller.logout();
      Get.snackbar('Error', 'the session is ended');
    }
    return (json.decode(response.body)['lstData'] as List)
        .map((tagJson) => OperatingProcess.fromJson(tagJson))
        .toList();
  }

  static Future<OperatingDetails> getOperationOperatingViewDetails(
      Operating operating) async {
    String? token = PrefsService.to.getString(Consts.tokenKey) ??
        PrefsService.to.getString(Consts.clientTokenKey);
    headers['Authorization'] = 'Bearer $token';

    http.Response response = await http.get(
        Uri.parse(
          '${Urls.getOperationOperatingViewDetailsUrl}?OperatingId=${operating.id}',
        ),
        headers: headers);
    CustomSideBarController controller = Get.put(CustomSideBarController());
    if (response.statusCode == 401) {
      controller.logout();
      Get.snackbar('Error', 'the session is ended');
    }
    return OperatingDetails.fromJson(json.decode(response.body));
  }

  static Future<List<OperatingProcessDetailsInitialItems>>
      getOperatingProcessDetailsInitialItems(int processID) async {
    String? token = PrefsService.to.getString(Consts.tokenKey) ??
        PrefsService.to.getString(Consts.clientTokenKey);
    headers['Authorization'] = 'Bearer $token';

    http.Response response = await http.get(
        Uri.parse(
            '${Urls.lkpsUrl}OperationOperatingProcess_CheckList&Id1=$processID'),
        headers: headers);
    CustomSideBarController controller = Get.put(CustomSideBarController());
    if (response.statusCode == 401) {
      controller.logout();
      Get.snackbar('Error', 'the session is ended');
    }
    return (json.decode(response.body)['data'] as List)
        .map((tagJson) => OperatingProcessDetailsInitialItems.fromJson(tagJson))
        .toList();
  }

  static Future<List<OperatingProcessDetailsItem>> getOperatingProcessesDetails(
      int detailsID) async {
    String? token = PrefsService.to.getString(Consts.tokenKey) ??
        PrefsService.to.getString(Consts.clientTokenKey);
    headers['Authorization'] = 'Bearer $token';
    http.Response response = await http.get(
      Uri.parse(
          '${Urls.getOperationOperatingProcessDetailsListUrl}?ProcessId=$detailsID'),
    );
    CustomSideBarController controller = Get.put(CustomSideBarController());
    if (response.statusCode == 401) {
      controller.logout();
      Get.snackbar('Error', 'the session is ended');
    }
    return (json.decode(response.body)['lstData'] as List)
        .map((tagJson) => OperatingProcessDetailsItem.fromJson(tagJson))
        .toList();
  }

  static Future<List<OtherCost>> getOtherCosts(OperatingProcess process) async {
    String? token = PrefsService.to.getString(Consts.tokenKey) ??
        PrefsService.to.getString(Consts.clientTokenKey);
    headers['Authorization'] = 'Bearer $token';
    http.Response response = await http.get(
      Uri.parse(
          '${Urls.getOperationsOperatingOtherCostsListUrl}?ProcessId=${process.detailsID}'),
    );
    CustomSideBarController controller = Get.put(CustomSideBarController());
    if (response.statusCode == 401) {
      controller.logout();
      Get.snackbar('Error', 'the session is ended');
    }
    return (json.decode(response.body)['lstData'] as List)
        .map((tagJson) => OtherCost.fromJson(tagJson))
        .toList();
  }

  static Future addOtherCost(OtherCostBody otherCostBody) async {
    if (PrefsService.to.getString(Consts.tokenKey) != null) {
      String? token = PrefsService.to.getString(Consts.tokenKey);
      headers['Authorization'] = 'Bearer $token';
    }

    headers["accept"] = "*/*";
    Map<String, dynamic> body = otherCostBody.toJson();
    http.Response response = await http.post(
      Uri.parse(Urls.addOperationsOperatingOtherCostsListUrl),
      body: jsonEncode(body),
      headers: headers,
    );
    CustomSideBarController controller = Get.find();
    if (response.statusCode == 401) {
      controller.logout();
      Get.snackbar('Error', 'the session is ended');
    }
  }

  static Future<List<Lookups>> getRequestStatus() async {
    String? token = PrefsService.to.getString(Consts.tokenKey) ??
        PrefsService.to.getString(Consts.clientTokenKey);
    headers['Authorization'] = 'Bearer $token';

    http.Response response =
        await http.get(Uri.parse('${Urls.lkpsUrl}Operation_ContractStatus'));
    CustomSideBarController controller = Get.put(CustomSideBarController());
    if (response.statusCode == 401) {
      controller.logout();
      Get.snackbar('Error', 'the session is ended');
    }
    return (json.decode(response.body)['data'] as List)
        .map((tagJson) => Lookups.fromJson(tagJson))
        .toList();
  }

  static Future saveProcessDetailsItems(
      OperatingProcessDetailsItemsBody detailBody) async {
    String? token = PrefsService.to.getString(Consts.tokenKey) ??
        PrefsService.to.getString(Consts.clientTokenKey);
    headers['Authorization'] = 'Bearer $token';

    headers["accept"] = "*/*";
    Map<String, dynamic> body = detailBody.toJson();
    http.Response response = await http.post(
      Uri.parse(Urls.addOperationOperatingProcessDetailsListUrl),
      body: jsonEncode(body),
      headers: headers,
    );
    CustomSideBarController controller = Get.put(CustomSideBarController());
    if (response.statusCode == 401) {
      controller.logout();
      Get.snackbar('Error', 'the session is ended');
    }
  }

  static Future<List<Lookups>> getCities() async {
    String? token = PrefsService.to.getString(Consts.tokenKey) ??
        PrefsService.to.getString(Consts.clientTokenKey);

    headers['Authorization'] = 'Bearer $token';

    http.Response response =
        await http.get(Uri.parse('${Urls.lkpsUrl}City'), headers: headers);
    CustomSideBarController controller = Get.put(CustomSideBarController());
    if (response.statusCode == 401) {
      controller.logout();
      Get.snackbar('Error', 'the session is ended');
    }
    return (json.decode(response.body)['data'] as List)
        .map((tagJson) => Lookups.fromJson(tagJson))
        .toList();
  }

  static Future<List<Lookups>> getGoverns() async {
    String? token = PrefsService.to.getString(Consts.tokenKey) ??
        PrefsService.to.getString(Consts.clientTokenKey);
    headers['Authorization'] = 'Bearer $token';
    http.Response response = await http
        .get(Uri.parse('${Urls.lkpsUrl}Governorate'), headers: headers);
    CustomSideBarController controller = Get.put(CustomSideBarController());
    if (response.statusCode == 401) {
      controller.logout();
      Get.snackbar('Error', 'the session is ended');
    }
    return (json.decode(response.body)['data'] as List)
        .map((tagJson) => Lookups.fromJson(tagJson))
        .toList();
  }

  static Future<List<Comment>> getComments(int operatingId, int typeId) async {
    String? token = PrefsService.to.getString(Consts.tokenKey) ??
        PrefsService.to.getString(Consts.clientTokenKey);
    headers['Authorization'] = 'Bearer $token';
    http.Response response = await http.get(
        Uri.parse(
            '${Urls.getOperationCommentsListUrl}?MasterID=$operatingId&TypeID=$typeId'),
        headers: headers);
    CustomSideBarController controller = Get.put(CustomSideBarController());
    if (response.statusCode == 401) {
      controller.logout();
      Get.snackbar('Error', 'the session is ended');
    }
    return (json.decode(response.body)['lstData'] as List)
        .map((tagJson) => Comment.fromJson(tagJson))
        .toList();
  }

  static Future<int> postComment(CommentBody commentBody) async {
    String? token = PrefsService.to.getString(Consts.tokenKey) ??
        PrefsService.to.getString(Consts.clientTokenKey);

    headers['Authorization'] = 'Bearer $token';
    headers["accept"] = "*/*";
    Map<String, dynamic> body = commentBody.toJson();

    http.Response response = await http.post(
      Uri.parse(Urls.addOperationCommentUrl),
      body: jsonEncode(body),
      headers: headers,
    );
    CustomSideBarController controller = Get.put(CustomSideBarController());
    if (response.statusCode == 401) {
      controller.logout();
      Get.snackbar('Error', 'the session is ended');
    }
    return json.decode(response.body)['entityId'];
  }
}
