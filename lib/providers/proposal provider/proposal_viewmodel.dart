import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/model/proposal.dart';
import 'package:e_service_app/providers/login/login_viewmodel.dart';
import 'package:e_service_app/service/proposal_service/proposal_service.dart';
import 'package:flutter/cupertino.dart';

class ProposalViewmodel extends ChangeNotifier {
  List<Proposal> proposalList;
  ProposalService get _service => dependency();

  LoginViewmodel get _user => dependency();

  get proposals => proposalList;
  set proposals(proposals) => proposalList = proposals;

  Future<List<Proposal>> getProposals() async {
    proposalList = await _service.fetchProposals();
    return proposalList;
  }
}
