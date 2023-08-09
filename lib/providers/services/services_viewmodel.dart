import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/model/user.dart';
import 'package:e_service_app/service/service_providers/service_providers.dart';
import 'package:flutter/cupertino.dart';

class ServicesViewmodel extends ChangeNotifier {
  ServiceProviderService get _service => dependency();

  List<User> serviceProviders;

  // var services = {
  //   'Home Improvment': [],
  //   'Home Maintenance': [],
  //   'Cleaning & Disinfection': [],
  //   'Events & Weddings': [],
  //   'Lessons': [],
  //   'Wellness': [],
  //   'Business': [],
  //   'Tech & Repair': [],
  //   'Personal & Family': [],
  //   'Legal': [],
  //   'Design & Web': [],
  // };
  var services;

  Future<Map> getServices() async {
    serviceProviders = await _service.getServices();

    try {
      Map<String, List<User>> _data = {};

      serviceProviders.forEach((e) {
        if (_data.containsKey(e.jobName)) {
          _data[e.jobName].add(e);
        } else {
          _data.addEntries({
            e.jobName: [e]
          }.entries);
        }
      });

      if (_data.isNotEmpty && serviceProviders.isNotEmpty) services = _data;

      return services;
    } catch (e) {
      print(e);
    }
  }
}
