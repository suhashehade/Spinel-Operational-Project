import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:operations/common/sidebar/custom_sidebar_controller.dart';
import 'package:operations/models/client/client.dart';
import 'package:operations/models/comment/comment.dart';
import 'package:operations/models/comment/comment_body.dart';
import 'package:operations/models/cost/other_cost.dart';
import 'package:operations/models/cost/other_cost_add_body.dart';
import 'package:operations/models/installation/installation_client_process_details_body.dart';
import 'package:operations/models/installation/installation_client_process.dart';
import 'package:operations/models/installation/installation_process_details_items_body.dart';
import 'package:operations/models/installation/installation.dart';
import 'package:operations/models/installation/installation_details.dart';
import 'package:operations/models/installation/installation_process.dart';
import 'package:operations/models/installation/installation_process_details_item.dart';
import 'package:operations/models/installation/installation_process_details_initial.dart';
import 'package:operations/models/lkps/lkps.dart';
import 'package:operations/models/sub_contarctor/sub_contractor_order.dart';
import 'package:operations/models/sub_contarctor/sub_contractor_order_details.dart';
import 'package:operations/screens/installation/controller/installation_screen_controller.dart';
import 'package:operations/services/shared_preferences_service.dart';
import 'package:operations/utils/consts.dart';
import 'package:operations/utils/urls.dart';

class InstallationsAPI {
  static Map<String, String> headers = {
    "Content-Type": "application/json; charset=utf-8",
  };
  static Future<List<Installation>> getOperationInstallationsList(
    String filterKey,
    String filtervalue,
    String searchKey,
    int page,
    int pageSize,
  ) async {
    String? token = PrefsService.to.getString(Consts.tokenKey) ??
        PrefsService.to.getString(Consts.clientTokenKey);
    headers['Authorization'] = 'Bearer $token';

    final startTime = DateTime.now();
    http.Response response = await http.get(
        Uri.parse(
            '${Urls.operationInstallationsListUrl}?$filterKey=$filtervalue&strSearch=$searchKey&page=$page&pageSize=$pageSize'),
        headers: headers);
    final endTime = DateTime.now();
    final totalTime = endTime.difference(startTime).inMilliseconds;
    print('Total time taken to fetch data: $totalTime ms');

    if (response.statusCode == 200) {
      Get.find<InstallationScreenController>().rowCount.value =
          json.decode(response.body)['rowsCount'];
      return (json.decode(response.body)['lstData'] as List)
          .map((tagJson) => Installation.fromJson(tagJson))
          .toList();
    } else {
      throw Exception('Failed to load installations - ${response.statusCode}');
    }
  }

  static Future<List<InstallationProcess>> getOperationsInstallationsProcesses(
      Installation installation) async {
    String? token = PrefsService.to.getString(Consts.tokenKey) ??
        PrefsService.to.getString(Consts.clientTokenKey);
    headers['Authorization'] = 'Bearer $token';
    http.Response response = await http.get(
        Uri.parse(
            '${Urls.getOperationInstallationProcessesListUrl}?InstallationId=${installation.id}'),
        headers: headers);
    CustomSideBarController controller = Get.put(CustomSideBarController());
    if (response.statusCode == 401) {
      controller.logout();
    }
    return (json.decode(response.body)['lstData'] as List)
        .map((tagJson) => InstallationProcess.fromJson(tagJson))
        .toList();
  }

  static Future<List<InstallationClientProcess>>
      getOperationsInstallationsClientProcesses(
          Installation installation) async {
    String? token = PrefsService.to.getString(Consts.tokenKey) ??
        PrefsService.to.getString(Consts.clientTokenKey);
    headers['Authorization'] = 'Bearer $token';
    http.Response response = await http.get(
        Uri.parse(
            '${Urls.getOperationInstallationClientProcessesListUrl}?InstallationId=${installation.id}'),
        headers: headers);
    CustomSideBarController controller = Get.put(CustomSideBarController());
    if (response.statusCode == 401) {
      controller.logout();
    }
    return (json.decode(response.body)['lstData'] as List)
        .map((tagJson) => InstallationClientProcess.fromJson(tagJson))
        .toList();
  }

  static Future<InstallationDetails> getOperationInstallationViewDetails(
      Installation installation) async {
    String? token = PrefsService.to.getString(Consts.tokenKey) ??
        PrefsService.to.getString(Consts.clientTokenKey);
    headers['Authorization'] = 'Bearer $token';

    http.Response response = await http.get(
        Uri.parse(
          '${Urls.operationInstallationViewDetailsUrl}?InstallationId=${installation.id}',
        ),
        headers: headers);
    CustomSideBarController controller = Get.put(CustomSideBarController());
    if (response.statusCode == 401) {
      controller.logout();
      Get.snackbar('Error', 'the session is ended');
    }
    return InstallationDetails.fromJson(json.decode(response.body));
  }

  static Future<List<InstallationDetailsInitialItems>>
      getInstallationsProcessDetailsInitialItems(int processID) async {
    String? token = PrefsService.to.getString(Consts.tokenKey) ??
        PrefsService.to.getString(Consts.clientTokenKey);
    headers['Authorization'] = 'Bearer $token';

    http.Response response = await http.get(
      Uri.parse(
          '${Urls.lkpsUrl}OperationInstallationProcess_CheckList&Id1=$processID'),
    );
    CustomSideBarController controller = Get.put(CustomSideBarController());
    if (response.statusCode == 401) {
      controller.logout();
      Get.snackbar('Error', 'the session is ended');
    }
    return (json.decode(response.body)['data'] as List)
        .map((tagJson) => InstallationDetailsInitialItems.fromJson(tagJson))
        .toList();
  }

  static Future<List<InstallationDetailsInitialItems>>
      getInstallationsClientProcessDetailsInitialItems(int processID) async {
    String? token = PrefsService.to.getString(Consts.tokenKey) ??
        PrefsService.to.getString(Consts.clientTokenKey);
    headers['Authorization'] = 'Bearer $token';

    http.Response response = await http.get(
      Uri.parse(
          '${Urls.lkpsUrl}OperationInstallationClientProcess_CheckList&Id1=$processID'),
    );
    CustomSideBarController controller = Get.put(CustomSideBarController());
    if (response.statusCode == 401) {
      controller.logout();
      Get.snackbar('Error', 'the session is ended');
    }
    return (json.decode(response.body)['data'] as List)
        .map((tagJson) => InstallationDetailsInitialItems.fromJson(tagJson))
        .toList();
  }

  static Future<List<InstallationProcessDetailsItem>>
      getInstallationsProcessesDetails(int detailsID) async {
    String? token = PrefsService.to.getString(Consts.tokenKey) ??
        PrefsService.to.getString(Consts.clientTokenKey);
    headers['Authorization'] = 'Bearer $token';
    http.Response response = await http.get(
      Uri.parse(
          '${Urls.operationInstallationProcessDetailsListUrl}?ProcessId=$detailsID'),
    );
    CustomSideBarController controller = Get.put(CustomSideBarController());
    if (response.statusCode == 401) {
      controller.logout();
      Get.snackbar('Error', 'the session is ended');
    }
    return (json.decode(response.body)['lstData'] as List)
        .map((tagJson) => InstallationProcessDetailsItem.fromJson(tagJson))
        .toList();
  }

  static Future<List<InstallationProcessDetailsItem>>
      getInstallationsClientProcessesDetails(int detailsID) async {
    String? token = PrefsService.to.getString(Consts.tokenKey) ??
        PrefsService.to.getString(Consts.clientTokenKey);
    headers['Authorization'] = 'Bearer $token';
    http.Response response = await http.get(
        Uri.parse(
            '${Urls.operationInstallationClientProcessDetailsListUrl}?ClientProcessId=$detailsID'),
        headers: headers);
    CustomSideBarController controller = Get.put(CustomSideBarController());
    if (response.statusCode == 401) {
      controller.logout();
      Get.snackbar('Error', 'the session is ended');
    }
    return (json.decode(response.body)['lstData'] as List)
        .map((tagJson) => InstallationProcessDetailsItem.fromJson(tagJson))
        .toList();
  }

  static Future<List<OtherCost>> getOtherCosts(
      InstallationProcess process) async {
    String? token = PrefsService.to.getString(Consts.tokenKey) ??
        PrefsService.to.getString(Consts.clientTokenKey);
    headers['Authorization'] = 'Bearer $token';
    http.Response response = await http.get(
        Uri.parse(
            '${Urls.operationsInstallationsOtherCostsListUrl}?ProcessId=${process.detailsID}'),
        headers: headers);
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
    String? token = PrefsService.to.getString(Consts.tokenKey) ??
        PrefsService.to.getString(Consts.clientTokenKey);
    headers['Authorization'] = 'Bearer $token';
    headers["accept"] = "*/*";
    Map<String, dynamic> body = otherCostBody.toJson();
    http.Response response = await http.post(
      Uri.parse(Urls.addOperationsInstallationsOtherCostsListUrl),
      body: jsonEncode(body),
      headers: headers,
    );
    CustomSideBarController controller = Get.put(CustomSideBarController());
    if (response.statusCode == 401) {
      controller.logout();
      Get.snackbar('Error', 'the session is ended');
    }
  }

  static Future<List<Lookups>> getRequestStatus() async {
    String? token = PrefsService.to.getString(Consts.tokenKey) ??
        PrefsService.to.getString(Consts.clientTokenKey);
    headers['Authorization'] = 'Bearer $token';
    http.Response response = await http.get(
      Uri.parse('${Urls.lkpsUrl}Operation_ContractStatus'),
    );
    CustomSideBarController controller = Get.put(CustomSideBarController());
    if (response.statusCode == 401) {
      controller.logout();
      Get.snackbar('Error', 'the session is ended');
    }
    return (json.decode(response.body)['data'] as List)
        .map((tagJson) => Lookups.fromJson(tagJson))
        .toList();
  }

  static Future<List<SubContractorOrder>> getSubContactorOrders(
      Installation installation) async {
    String? token = PrefsService.to.getString(Consts.tokenKey) ??
        PrefsService.to.getString(Consts.clientTokenKey);
    headers['Authorization'] = 'Bearer $token';
    http.Response response = await http.get(
        Uri.parse(
            '${Urls.getOperationInstallationSubContractorOrdersListUrl}?InstallationId=${installation.id}'),
        headers: headers);
    CustomSideBarController controller = Get.put(CustomSideBarController());
    if (response.statusCode == 401) {
      controller.logout();
      Get.snackbar('Error', 'the session is ended');
    }
    return (json.decode(response.body)['lstData'] as List)
        .map((tagJson) => SubContractorOrder.fromJson(tagJson))
        .toList();
  }

  static Future<SubContractorOrderDetails> getSubContactorOrderDetails(
      SubContractorOrder order) async {
    String? token = PrefsService.to.getString(Consts.tokenKey) ??
        PrefsService.to.getString(Consts.clientTokenKey);
    headers['Authorization'] = 'Bearer $token';
    http.Response response = await http.get(
        Uri.parse(
            '${Urls.getOperationInstallationSubContractorOrdersDetailsUrl}?SubContractorOrderId=${order.detailsID}'),
        headers: headers);
    CustomSideBarController controller = Get.put(CustomSideBarController());
    if (response.statusCode == 401) {
      controller.logout();
      Get.snackbar('Error', 'the session is ended');
    }
    return SubContractorOrderDetails.fromJson(json.decode(response.body));
  }

  static Future editSubContractorOrderDetails(
      SubContractorOrderDetails orderDetails) async {
    String? token = PrefsService.to.getString(Consts.tokenKey) ??
        PrefsService.to.getString(Consts.clientTokenKey);
    headers['Authorization'] = 'Bearer $token';
    headers["accept"] = "*/*";
    Map<String, dynamic> body = orderDetails.toJson();

    http.Response response = await http.post(
      Uri.parse(Urls.addOperationInstallationSubContractorOrderUrl),
      body: jsonEncode(body),
      headers: headers,
    );
    CustomSideBarController controller = Get.put(CustomSideBarController());
    if (response.statusCode == 401) {
      controller.logout();
      Get.snackbar('Error', 'the session is ended');
    }
  }

  static Future saveProcessDetailsItems(
      InstallationProcessDetailsItemsBody detailBody) async {
    String? token = PrefsService.to.getString(Consts.tokenKey) ??
        PrefsService.to.getString(Consts.clientTokenKey);
    headers['Authorization'] = 'Bearer $token';
    headers["accept"] = "*/*";
    Map<String, dynamic> body = detailBody.toJson();
    http.Response response = await http.post(
      Uri.parse(Urls.addOperationInstallationProcessDetailsListUrl),
      body: jsonEncode(body),
      headers: headers,
    );
    CustomSideBarController controller = Get.put(CustomSideBarController());
    if (response.statusCode == 401) {
      controller.logout();
      Get.snackbar('Error', 'the session is ended');
    }
  }

  static Future saveClientProcessDetailsItems(
      InstallationClientProcessDetailsBody detailBody) async {
    String? token = PrefsService.to.getString(Consts.tokenKey) ??
        PrefsService.to.getString(Consts.clientTokenKey);
    headers['Authorization'] = 'Bearer $token';
    headers["accept"] = "*/*";
    Map<String, dynamic> body = detailBody.toJson();

    http.Response response = await http.post(
      Uri.parse(Urls.addOperationInstallationClientProcessDetailsListUrl),
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

    http.Response response = await http.get(
      Uri.parse('${Urls.lkpsUrl}City'),
    );
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
    http.Response response = await http.get(
      Uri.parse('${Urls.lkpsUrl}Governorate'),
    );
    CustomSideBarController controller = Get.put(CustomSideBarController());
    if (response.statusCode == 401) {
      controller.logout();
      Get.snackbar('Error', 'the session is ended');
    }
    return (json.decode(response.body)['data'] as List)
        .map((tagJson) => Lookups.fromJson(tagJson))
        .toList();
  }

  static Future<List<Client>> getClients() async {
    String? token = PrefsService.to.getString(Consts.tokenKey) ??
        PrefsService.to.getString(Consts.clientTokenKey);
    headers['Authorization'] = 'Bearer $token';
    http.Response response = await http.get(
      Uri.parse('${Urls.getClientsListUrl}?page=1&pageSize=100'),
    );
    CustomSideBarController controller = Get.put(CustomSideBarController());
    if (response.statusCode == 401) {
      controller.logout();
      Get.snackbar('Error', 'the session is ended');
    }
    return (json.decode(response.body)['lstData'] as List)
        .map((tagJson) => Client.fromJson(tagJson))
        .toList();
  }

  static Future<List<Comment>> getComments(
      int installationId, int typeId) async {
    String? token = PrefsService.to.getString(Consts.tokenKey) ??
        PrefsService.to.getString(Consts.clientTokenKey);
    headers['Authorization'] = 'Bearer $token';
    http.Response response = await http.get(
        Uri.parse(
            '${Urls.getOperationCommentsListUrl}?MasterID=$installationId&TypeID=$typeId'),
        headers: headers);
    CustomSideBarController controller = Get.put(CustomSideBarController());
    if (response.statusCode == 401) {
      controller.logout();
      Get.snackbar('Error', 'the session is ended');
    }
    if (response.statusCode == 200) {
      return (json.decode(response.body)['lstData'] as List)
          .map((tagJson) => Comment.fromJson(tagJson))
          .toList();
    } else {
      throw Exception('Failed to load installations');
    }
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
