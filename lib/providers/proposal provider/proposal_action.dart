// import 'package:e_service_app/model/proposal.dart';
import 'package:e_service_app/providers/proposal%20provider/proposal_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final propsProvider = ChangeNotifierProvider((ref) => ProposalViewmodel());

final proposalList = FutureProvider.autoDispose.family((ref, postId) async {
  final list = ref.read(propsProvider);

  final data = list.getProposals(postId);
  return data;
});
