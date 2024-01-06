import 'package:coba_coba/components/config/app_const_config.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class RtRwDataSource {
  final http.Client _client = http.Client();

  Future<Response> apiRtRw() {
    return _client.get(Uri.parse("${AppConstConfig.url}view-barang-rekap?id_kel=65"));
  }
}