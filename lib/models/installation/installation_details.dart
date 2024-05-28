import 'package:operations/models/installation/installation_service.dart';

class InstallationDetails {
  int? id;
  int? requestStatusID;
  String? clientNameID;
  String? clientNameEn;
  String? clientNameAr;
  int? clientCityID;
  String? clientCityName;
  String? clientAddress;
  String? fullAddress;
  String? buildingName;
  String? buildingFloor;
  int? salesManID;
  String? salesManNameEn;
  String? salesManNameAr;
  int? subContractorAccID;
  String? subContractorAccNameEn;
  String? subContractorAccNameAr;
  String? subContractorMobile;
  String? subContractorPhone;
  String? subContractorNationalID;
  int? subContractorCityID;
  String? subContractorCityName;
  String? insCompany;
  String? insNumber;
  String? validFromDate;
  String? validToDate;
  int? subContractorGovernorateID;
  String? subContractorGovernorateName;
  double? cost;
  int? costCurrencyID;
  String? costCurrencyName;
  bool? hasInsurance;
  String? notes;

  List<InstallationService> lstServices;

  InstallationDetails(
    this.id,
    this.requestStatusID,
    this.clientNameID,
    this.clientNameEn,
    this.clientNameAr,
    this.clientCityID,
    this.clientCityName,
    this.clientAddress,
    this.fullAddress,
    this.buildingName,
    this.buildingFloor,
    this.salesManID,
    this.salesManNameEn,
    this.salesManNameAr,
    this.subContractorAccID,
    this.subContractorAccNameEn,
    this.subContractorAccNameAr,
    this.subContractorMobile,
    this.subContractorPhone,
    this.subContractorNationalID,
    this.subContractorCityID,
    this.subContractorCityName,
    this.insCompany,
    this.insNumber,
    this.validFromDate,
    this.validToDate,
    this.subContractorGovernorateID,
    this.subContractorGovernorateName,
    this.cost,
    this.costCurrencyID,
    this.costCurrencyName,
    this.hasInsurance,
    this.notes,
    this.lstServices,
  );

  factory InstallationDetails.fromJson(json) {
    return InstallationDetails(
      json['id'],
      json['requestStatusID'],
      json['clientNameID'],
      json['clientNameEn'],
      json['clientNameAr'],
      json['clientCityID'],
      json['clientCityName'],
      json['clientAddress'],
      json['fullAddress'],
      json['buildingName'],
      json['buildingFloor'],
      json['salesManID'],
      json['salesManNameEn'],
      json['salesManNameAr'],
      json['subContractorAccID'],
      json['subContractorAccNameEn'],
      json['subContractorAccNameAr'],
      json['subContractorMobile'],
      json['subContractorPhone'],
      json['subContractorNationalID'],
      json['subContractorCityID'],
      json['subContractorCityName'],
      json['insCompany'],
      json['insNumber'],
      json['valid_FromDate'],
      json['valid_ToDate'],
      json['subContractorGovernorateID'],
      json['subContractorGovernorateName'],
      json['cost'],
      json['costCurrencyID'],
      json['costCurrencyName'],
      json['hasInsurance'],
      json['notes'],
      (json['lstServices'] as List)
          .map((tagJson) => InstallationService.fromJson(tagJson))
          .toList(),
    );
  }
}
