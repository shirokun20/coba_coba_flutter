import 'package:coba_coba/features/pie_chart/model/rt_rw_total_model.dart';

class RtRwState {
  RtRwState();
  factory RtRwState.loading() = RtRwLoading;
  factory RtRwState.idle() = RtRwIdle;
  factory RtRwState.success(List<RtRwTotalModel> data) = RtRwSuccess;
  factory RtRwState.error(String message) = RtRwError;
}

class RtRwIdle extends RtRwState {}

class RtRwLoading extends RtRwState {}

class RtRwSuccess extends RtRwState {
  final List<RtRwTotalModel> listData;
  RtRwSuccess(this.listData);
}

class RtRwError extends RtRwState {
  final String message;
  RtRwError(this.message);
}
