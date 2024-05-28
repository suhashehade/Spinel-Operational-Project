import 'package:operations/utils/consts.dart';

class Urls {
  static String loginUrl = '${Consts.accountUrl}/Login';
  static String clientLoginUrl = '${Consts.accountUrl}/OperationClientLogin';
  static String operationInstallationsListUrl =
      '${Consts.operationsUrl}/OperationInstallationsList_mobile';
  static String operationInstallationViewDetailsUrl =
      '${Consts.operationsUrl}/OperationInstallationViewDetails';
  static String lkpsUrl = '${Consts.lookupsUrl}?categoryCode=';
  static String operationInstallationProcessDetailsListUrl =
      '${Consts.operationsUrl}/OperationInstallationProcessDetailsList';
  static String operationInstallationClientProcessDetailsListUrl =
      '${Consts.operationsUrl}/OperationInstallationClientProcessDetailsList';
  static String operationsInstallationsOtherCostsListUrl =
      '${Consts.operationsUrl}/OperationInstallationProcessOtherCostList';
  static String addOperationsInstallationsOtherCostsListUrl =
      '${Consts.operationsUrl}/AddOperationInstallationProcessOtherCost';
  static String getOperationInstallationSubContractorOrdersListUrl =
      '${Consts.operationsUrl}/OperationInstallationSubContractorOrdersList';
  static String getOperationInstallationSubContractorOrdersDetailsUrl =
      '${Consts.operationsUrl}/OperationInstallationSubContractorOrdersDetails';
  static String addOperationInstallationSubContractorOrderUrl =
      '${Consts.operationsUrl}/AddOperationInstallationSubContractorOrders';
  static String addOperationInstallationProcessDetailsListUrl =
      '${Consts.operationsUrl}/AddOperationInstallationProcessDetailsList';
  static String addOperationInstallationClientProcessDetailsListUrl =
      '${Consts.operationsUrl}/AddOperationInstallationClientProcessDetailsList';
  static String getOperationInstallationProcessesListUrl =
      '${Consts.operationsUrl}/OperationInstallationProcessesList';
  static String getOperationInstallationClientProcessesListUrl =
      '${Consts.operationsUrl}/OperationInstallationClientProcessesList';
  static String getOperationCommentsListUrl =
      '${Consts.operationsUrl}/OperationCommentsList';
  static String addOperationCommentUrl =
      '${Consts.operationsUrl}/AddOperationComment';
  // operating
  static String operationOperatingListUrl =
      '${Consts.operationsUrl}/OperationOperatingList_mobile';
  static String getOperationOperatingViewDetailsUrl =
      '${Consts.operationsUrl}/OperationOperatingViewDetails';
  static String getOperationOperatingProcessesListUrl =
      '${Consts.operationsUrl}/OperationOperatingProcessesList';
  static String getOperationOperatingProcessDetailsListUrl =
      '${Consts.operationsUrl}/OperationOperatingProcessDetailsList';
  static String addOperationOperatingProcessDetailsListUrl =
      '${Consts.operationsUrl}/AddOperationOperatingProcessDetailsList';
  static String getOperationsOperatingOtherCostsListUrl =
      '${Consts.operationsUrl}/OperationOperatingProcessOtherCostList';
  static String addOperationsOperatingOtherCostsListUrl =
      '${Consts.operationsUrl}/AddOperationOperatingProcessOtherCost';
  static String getClientsListUrl =
      '${Consts.operationsUrl}/OperationInstallationPossibleClientsList';
}
