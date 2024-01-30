import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/remote/dio_network_service.dart';
import '../../data/remote/network_service.dart';

final networkServiceProvider = Provider<NetworkService>((ref) {
  final Dio dio = Dio();
  return DioNetworkService(dio);
});