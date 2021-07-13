class Card {
  String cardNumber;
  String name;
  String expiryMonth;
  String expiryYear;
  bool primary;

  Card(
      {this.name,
      this.cardNumber,
      this.expiryMonth,
      this.expiryYear,
      this.primary});

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
      cardNumber: json['cardNumber'],
      name: json['name'],
      expiryMonth: json['expiryMonth'],
      expiryYear: json['expiryYear'],
      primary: json['primary'],
    );
  }
  Map<String, dynamic> toJson() => {
        'cardNumber': cardNumber,
        'name': name,
        'expiryMonth': expiryMonth,
        'expiryYear': expiryYear,
        'primary': primary,
      };
}