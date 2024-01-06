import 'dart:async';

import 'package:coba_coba/components/utils/result_util.dart';
import 'package:coba_coba/features/pie_chart/model/rt_rw_response_model.dart';
import 'package:coba_coba/features/pie_chart/model/rt_rw_total_model.dart';
import 'package:coba_coba/features/pie_chart/repository/rt_rw_repository.dart';
import 'package:coba_coba/features/pie_chart/state/rt_rw_state.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class RtRwViewModel {
  //
  final RtRwRepository _repository;
  final Logger _logger = Logger();
  //
  RtRwViewModel(this._repository);
  //
  final StreamController<RtRwState> _stateController =
      StreamController.broadcast();
  Stream<RtRwState> get state => _stateController.stream;
  //
  void loadData()  {
    _stateController.sink.add(RtRwState.loading());
    _repository.fetchRtRw().then((result) {
      if (result is Ok) {
        List<RtRwModel> data = [];
        data = result.response;
        //
        int rt = 0;
        int rw = 0;

        _logger.i(data.map((e) => e.toJson().toString()));
        // ini buat ambil jumlah rt dan rw
        for (var element in data) {
          rt += element.jRt!;
          rw += element.jRw!;
        }
        //
        List<RtRwTotalModel> output = [];
        output.add(RtRwTotalModel(
          name: "RT",
          jumlah: rt,
          color: Colors.red,
        ));
        output.add(RtRwTotalModel(
          name: "RW",
          jumlah: rw,
          color: Colors.blue,
        ));
        _stateController.sink.add(RtRwState.success(output));
      } else if (result is Error) {
        _logger.e(result.code);
        _stateController.sink.add(RtRwState.error("NO Data"));
      }
    });
  }
}
