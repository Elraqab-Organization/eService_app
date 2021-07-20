import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/model/proposal.dart';
import 'package:e_service_app/service/rest_service.dart';

class ProposalService {
  RestService get rest => dependency();

  Future<List<Proposal>> fetchProposals(final id) async {
    final List jsonProposals = await rest.get('proposals/$id');
    if (jsonProposals == null || jsonProposals.length == 0) return null;
    final proposals =
        jsonProposals.map((doc) => Proposal.fromJson(doc)).toList();
    return proposals;
  }

  Future<List<Proposal>> fetchCustomerProposals(final id) async {
    final List jsonProposals = await rest.get('proposals/$id/false');
    if (jsonProposals == null || jsonProposals.length == 0) return null;
    final proposals =
        jsonProposals.map((doc) => Proposal.fromJson(doc)).toList();
    return proposals;
  }

  Future<List<Proposal>> fetchServiceProviderProposals(final id) async {
    final List jsonProposals = await rest.get('proposals/$id/true');
    if (jsonProposals == null || jsonProposals.length == 0) return null;
    final proposals =
        jsonProposals.map((doc) => Proposal.fromJson(doc)).toList();
    return proposals;
  }

  Future<Proposal> updateProposalAccept(final id) async {
    final jsonProposal = await rest.patch('proposals/$id/accept', data: {});
    if (jsonProposal == null) return null;
    final updatedProposal = Proposal.fromJson(jsonProposal);
    return updatedProposal;
  }

  Future<Proposal> updateProposalReject(final id) async {
    final jsonProposal = await rest.patch('proposals/$id/reject', data: {});
    if (jsonProposal == null) return null;
    final updatedProposal = Proposal.fromJson(jsonProposal);
    return updatedProposal;
  }

  Future<Proposal> updateProposalCancelation(final id) async {
    final jsonProposal = await rest.patch('proposals/$id/cancel', data: {});
    if (jsonProposal == null) return null;
    final updatedProposal = Proposal.fromJson(jsonProposal);
    return updatedProposal;
  }
}
