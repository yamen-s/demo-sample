import 'package:echo_cash/features/wallet/domain/entities/wallet_entitiy.dart';

// The WalletModel class is an extension of WalletEntity. 
// It represents the model structure of a Wallet for the application and can be easily serialized and deserialized from/to JSON.
class WalletModel extends WalletEntity {

  // Constructor for the WalletModel. This is used to create a new instance of WalletModel with the given parameters.
  const WalletModel({
    int? id,
    String? uuid,
    required String name,
    required String coin,
    double? balance,
  }) : super(
    id: id,
    uuid: uuid,
    name: name,
    coin: coin,
    balance: balance,
  );

  // Factory constructor to create a new WalletModel instance from a Map (usually coming from a JSON payload).
  // This provides a way to map the JSON fields to the WalletModel properties.
  factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
    id: json['id'],
    uuid: json['uuid'],
    name: json['name'],
    coin: json['coin'],
    // Safely parsing the balance, converting it to a String first to handle cases where the balance might not be in double format in the JSON.
    balance: double.parse(json['balance'].toString()),
  );

  // Method to convert the WalletModel instance back into a Map, which can be easily converted to a JSON string if needed.
  // This is useful when sending the data back to a server or saving it locally in JSON format.
  Map<String, dynamic> toJson() => {
    'id': id,
    'uuid': uuid,
    'name': name,
    'coin': coin,
    'balance': balance,
  };
}