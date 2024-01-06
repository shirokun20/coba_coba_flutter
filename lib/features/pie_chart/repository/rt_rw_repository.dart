import 'dart:convert';

import 'package:coba_coba/components/utils/result_util.dart';
import 'package:coba_coba/features/pie_chart/model/rt_rw_response_model.dart';
import 'package:coba_coba/features/pie_chart/repository/rt_rw_datasource.dart';

class RtRwRepository {

  final RtRwDataSource _dataSource;

  RtRwRepository(this._dataSource);

  Future<ResultUtil> fetchRtRw() async {
    try {
      final response = await _dataSource.apiRtRw();
      if (response.statusCode == 200) {
        var raw = json.decode(response.body);
        var data = RtRwResponseModel.fromJson(raw);
        if (data.success == true) {
          return ResultUtil.ok(data.data, "");
        } else {
          return ResultUtil.error(response.statusCode, "Data Empty");
        }
      } else {
        return ResultUtil.error(response.statusCode, "");
      }
    } catch (e) {
      return ResultUtil.error(500, "Failed to get Data");
    }
  }
}