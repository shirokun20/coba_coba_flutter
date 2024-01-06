import 'package:coba_coba/features/pie_chart/repository/rt_rw_datasource.dart';
import 'package:coba_coba/features/pie_chart/repository/rt_rw_repository.dart';
import 'package:coba_coba/features/pie_chart/state/rt_rw_state.dart';
import 'package:coba_coba/features/pie_chart/view_model/rt_rw_viewmodel.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RtRwScreen extends StatefulWidget {
  RtRwScreen({super.key});
  final RtRwRepository _repository = RtRwRepository(RtRwDataSource());

  @override
  State<RtRwScreen> createState() => _RtRwScreenState();
}

class _RtRwScreenState extends State<RtRwScreen> {
  late RtRwViewModel _viewModel;

  @override
  void initState() {
    _viewModel = RtRwViewModel(widget._repository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pie Chart RT/RW"),
      ),
      body: StreamBuilder<RtRwState>(
        stream: _viewModel.state,
        initialData: RtRwIdle(),
        builder: (context, snapshot) {
          if (snapshot.data is RtRwLoading) {
            return _buildLoading();
          }

          if (snapshot.data is RtRwIdle) {
            _viewModel.loadData();
            return _buildLoading();
          }

          if (snapshot.data is RtRwError) {
            RtRwError data = snapshot.data as RtRwError;
            return _buildErrorContent(data.message);
          }

          if (snapshot.data is RtRwSuccess) {
            RtRwSuccess data = snapshot.data as RtRwSuccess;
            //
            int all = 0;
            double oneProcent;
            for (var element in data.listData) {
              all += element.jumlah!;
            }

            oneProcent = all / 100;

            List<PieChartSectionData> output = [];

            for (var element in data.listData) {
              output.add(
                PieChartSectionData(
                  value: element.jumlah!.toDouble(),
                  title:
                      "${element.name}\n${(element.jumlah! / oneProcent).toStringAsFixed(0)}%",
                  color: element.color,
                  radius: 80,
                  titleStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              );
            }
            return PieChart(
              PieChartData(
                sections: output,
                centerSpaceRadius: 40,
                sectionsSpace: 0,
              ),
            );
          }

          return Container();
        },
      ),
    );
  }

  Widget _buildErrorContent(String msg) {
    return Center(
      child: Text(msg),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
