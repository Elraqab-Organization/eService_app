import 'package:e_service_app/providers/proposal%20provider/proposal_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final propsProvider = ChangeNotifierProvider((ref) => ProposalViewmodel()); //

final proposalList = FutureProvider.autoDispose.family((ref, postId) async {
  final list = ref.watch(propsProvider);

  final data = list.getProposals(postId);
  return data;
});

final proposalsCustomerList =
    FutureProvider.autoDispose.family((ref, customerId) async {
  final list = ref.watch(propsProvider);

  final data = list.getCustomerProposals(customerId);
  return data;
});

final serviceProviderProposalsList =
    FutureProvider.autoDispose.family((ref, serviceProviderId) async {
  final list = ref.watch(propsProvider);

  final data = list.getServiceProvidersProposals(serviceProviderId);
  return data;
});
