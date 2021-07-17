import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/model/user.dart';
import 'package:e_service_app/service/service_providers/service_providers.dart';
import 'package:flutter/cupertino.dart';

class ServicesViewmodel extends ChangeNotifier {
  ServiceProviderService get _service => dependency();

  List<User> serviceProviders;

  Map services = {
    'Home Improvment': [],
    'Home Maintenance': [],
    'Cleaning & Disinfection': [],
    'Events & Weddings': [],
    'Lessons': [],
    'Wellness': [],
    'Business': [],
    'Tech & Repair': [],
    'Personal & Family': [],
    'Legal': [],
    'Design & Web': [],
  };

  Future<Map> getServices() async {
    serviceProviders = await _service.getServices();

    serviceProviders.map(
      (e) => services[e.jobName].put(e),
    );

    return services;
  }
}
