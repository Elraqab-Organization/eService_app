import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/model/proposal.dart';
import 'package:e_service_app/providers/login/login_viewmodel.dart';
import 'package:e_service_app/service/proposal_service/proposal_service.dart';
import 'package:flutter/cupertino.dart';

class ProposalViewmodel extends ChangeNotifier {
  List<Proposal> proposalList;
  ProposalService get _service => dependency();

  get proposals => proposalList;
  set proposals(proposals) => proposalList = proposals;

  Future<List<Proposal>> getProposals(final id) async {
    proposalList = await _service.fetchProposals(id);
    return proposalList;
  }

  Future<Proposal> acceptProposal(final id) async {
    final updatedProposal = await _service.updateProposalAccept(id);
    if (updatedProposal != null) {
      notifyListeners();
    }
    return updatedProposal;
  }

  Future<Proposal> rejectProposal(final id) async {
    final updatedProposal = await _service.updateProposalReject(id);
    if (updatedProposal != null) {
      notifyListeners();
    }
    return updatedProposal;
  }
}
