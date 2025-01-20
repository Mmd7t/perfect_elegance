class Origin {
  int? id;
  String? name;
  String? code;
  int? region;
  int? onstoreDeliveryCity;
  int? mainAccount;
  int? subAccount;
  int? expences;
  int? mainAccBranch;
  int? supervisorAccBranch;
  int? delTryAcc;
  int? comTryAcc;
  int? settlmentAcc;
  int? settlmentAccPre;
  int? tlyncAcc;
  int? bankAcc;
  String? officeDeliveryArray;
  String? mapShortLink;
  String? branchWarehouseCode;
  String? type;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic branchRegions;
  String? workingHours;

  Origin({
    this.id,
    this.name,
    this.code,
    this.region,
    this.onstoreDeliveryCity,
    this.mainAccount,
    this.subAccount,
    this.expences,
    this.mainAccBranch,
    this.supervisorAccBranch,
    this.delTryAcc,
    this.comTryAcc,
    this.settlmentAcc,
    this.settlmentAccPre,
    this.tlyncAcc,
    this.bankAcc,
    this.officeDeliveryArray,
    this.mapShortLink,
    this.branchWarehouseCode,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.branchRegions,
    this.workingHours,
  });

  factory Origin.fromJson(Map<String, dynamic> json) => Origin(
        id: json['id'] as int?,
        name: json['name'] as String?,
        code: json['code'] as String?,
        region: json['region'] as int?,
        onstoreDeliveryCity: json['onstore_delivery_city'] as int?,
        mainAccount: json['main_account'] as int?,
        subAccount: json['sub_account'] as int?,
        expences: json['expences'] as int?,
        mainAccBranch: json['main_acc_branch'] as int?,
        supervisorAccBranch: json['supervisor_acc_branch'] as int?,
        delTryAcc: json['del_TRY_acc'] as int?,
        comTryAcc: json['com_try_acc'] as int?,
        settlmentAcc: json['settlment_acc'] as int?,
        settlmentAccPre: json['settlment_acc_pre'] as int?,
        tlyncAcc: json['tlync_acc'] as int?,
        bankAcc: json['bank_acc'] as int?,
        officeDeliveryArray: json['office_delivery_array'] as String?,
        mapShortLink: json['map_short_link'] as String?,
        branchWarehouseCode: json['branch_warehouse_code'] as String?,
        type: json['type'] as String?,
        createdAt: json['created_at'] as dynamic,
        updatedAt: json['updated_at'] as dynamic,
        branchRegions: json['branch_regions'] as dynamic,
        workingHours: json['working_hours'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'code': code,
        'region': region,
        'onstore_delivery_city': onstoreDeliveryCity,
        'main_account': mainAccount,
        'sub_account': subAccount,
        'expences': expences,
        'main_acc_branch': mainAccBranch,
        'supervisor_acc_branch': supervisorAccBranch,
        'del_TRY_acc': delTryAcc,
        'com_try_acc': comTryAcc,
        'settlment_acc': settlmentAcc,
        'settlment_acc_pre': settlmentAccPre,
        'tlync_acc': tlyncAcc,
        'bank_acc': bankAcc,
        'office_delivery_array': officeDeliveryArray,
        'map_short_link': mapShortLink,
        'branch_warehouse_code': branchWarehouseCode,
        'type': type,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'branch_regions': branchRegions,
        'working_hours': workingHours,
      };
}
