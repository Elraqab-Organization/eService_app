import 'package:e_service_app/providers/services/services_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final serviceProvider = ChangeNotifierProvider((ref) => ServicesViewmodel());

final getServices = FutureProvider.autoDispose<Map>((ref) async {
  final services = await ref.read(serviceProvider).getServices();

  return services;
});
