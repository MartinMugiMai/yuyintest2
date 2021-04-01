import 'dart:convert' show json;

T asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }

  return null;
}

class YgInfoModel {
  YgInfoModel({
    this.result,
    this.msg,
    this.data,
  });

  factory YgInfoModel.fromJson(Map<String, dynamic> jsonRes) {
    if (jsonRes == null) {
      return null;
    }

    final List<Data> data = jsonRes['data'] is List ? <Data>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']) {
        if (item != null) {
          data.add(Data.fromJson(asT<Map<String, dynamic>>(item)));
        }
      }
    }
    return YgInfoModel(
      result: asT<int>(jsonRes['result']),
      msg: asT<String>(jsonRes['msg']),
      data: data,
    );
  }

  int result;
  String msg;
  List<Data> data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'result': result,
        'msg': msg,
        'data': data,
      };
  @override
  String toString() {
    return json.encode(this);
  }
}

class Data {
  Data({
    this.RealName,
    this.DeptName,
    this.CertificatesPhoto,
    this.GyCardNo,
    this.RemindCount,
    this.StarLevel,
  });

  factory Data.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : Data(
          RealName: asT<String>(jsonRes['RealName']),
          DeptName: asT<String>(jsonRes['DeptName']),
          CertificatesPhoto: asT<String>(jsonRes['CertificatesPhoto']),
          GyCardNo: asT<String>(jsonRes['GyCardNo']),
          RemindCount: asT<String>(jsonRes['RemindCount']),
          StarLevel: asT<int>(jsonRes['StarLevel']),
        );

  String RealName;
  String DeptName;
  String CertificatesPhoto;
  String GyCardNo;
  String RemindCount;
  int StarLevel;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'RealName': RealName,
        'DeptName': DeptName,
        'CertificatesPhoto': CertificatesPhoto,
        'GyCardNo': GyCardNo,
        'RemindCount': RemindCount,
        'StarLevel': StarLevel,
      };
  @override
  String toString() {
    return json.encode(this);
  }
}
