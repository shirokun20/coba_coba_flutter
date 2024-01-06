class RtRwResponseModel {
  bool? success;
  List<RtRwModel>? data;
  String? message;

  RtRwResponseModel({this.success, this.data, this.message});

  RtRwResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <RtRwModel>[];
      json['data'].forEach((v) {
        data!.add(RtRwModel.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class RtRwModel {
  int? id;
  String? namaLing;
  int? jRw;
  int? jRt;

  RtRwModel({this.id, this.namaLing, this.jRw, this.jRt});

  RtRwModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaLing = json['nama_ling'];
    jRw = json['j_rw'];
    jRt = json['j_rt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama_ling'] = namaLing;
    data['j_rw'] = jRw;
    data['j_rt'] = jRt;
    return data;
  }
}