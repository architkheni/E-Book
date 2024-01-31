class PaypalCredentials {
  String paypalClientId;
  String paypalSecretKey;
  String paypalReturnUrl;
  String paypalCancelUrl;

  PaypalCredentials({
    required this.paypalClientId,
    required this.paypalSecretKey,
    required this.paypalReturnUrl,
    required this.paypalCancelUrl,
  });

  factory PaypalCredentials.fromJson(Map<String, dynamic> json) => PaypalCredentials(
        paypalClientId: json['paypal_clientId'],
        paypalSecretKey: json['paypal_secretKey'],
        paypalReturnUrl: json['paypal_returnURL'],
        paypalCancelUrl: json['paypal_cancelURL'],
      );

  Map<String, dynamic> toJson() => {
        'paypal_clientId': paypalClientId,
        'paypal_secretKey': paypalSecretKey,
        'paypal_returnURL': paypalReturnUrl,
        'paypal_cancelURL': paypalCancelUrl,
      };
}
