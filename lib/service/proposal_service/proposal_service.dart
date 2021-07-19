import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/model/proposal.dart';
import 'package:e_service_app/service/rest_service.dart';

class ProposalService {
  RestService get rest => dependency();

  Future<List<Proposal>> fetchProposals(final id) async {
    final List jsonProposals = await rest.get('proposals/$id');
    if (jsonProposals == null || jsonProposals.length == 0) return null;
//
    final proposals =
        jsonProposals.map((doc) => Proposal.fromJson(doc)).toList();

    return proposals;
  }
}
