class Proposal {
  String id;
  String postId;
  String customerId;
  String serviceProviderId;
  String description;
  List<String> steps;

  Proposal({
    this.description,
    this.id,
    this.customerId,
    this.postId,
    this.serviceProviderId,
    this.steps,
  });

  factory Proposal.fromJson(Map<String, dynamic> json) {
    return Proposal(
      description: json['description'],
      id: json['id'],
      customerId: json['customerId'],
      postId: json['postId'],
      serviceProviderId: json['serviceProviderId'],
      steps: json['steps'],
    );
  }

  Map<String, dynamic> toJson() => {
        'description': description,
        'id': id,
        'customerId': customerId,
        'postId': postId,
        'serviceProviderId': serviceProviderId,
        'steps': steps,
      };
}
