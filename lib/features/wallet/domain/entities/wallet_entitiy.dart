import 'package:equatable/equatable.dart';

// This class represents a Wallet entity. It's the core domain object that 
// defines what a wallet is within the context of the application. 
// Extending Equatable ensures that two instances of WalletEntity are considered 
// equal if their properties are the same, which is useful for comparison operations.
class WalletEntity extends Equatable{
  
  // The unique identifier for the wallet, typically used in databases.
  final int? id;

  // A universally unique identifier for the wallet, which can be used across 
  // different systems or platforms.
  final String? uuid;

  // The name of the wallet.
  final String name;

  // The type or name of the coin the wallet holds.
  final String coin;

  // The balance of coins in the wallet.
  final double? balance;

  // The constructor for the WalletEntity. It takes in all properties as named arguments,
  // with some of them being optional.
  const WalletEntity({
    this.id,
    this.uuid,
    required this.name,
    required this.coin,
    this.balance,
  });

  // This override of the `props` getter from Equatable provides a list of 
  // properties that Equatable uses to determine if two instances are equal.
  @override
  List<Object?> get props => [id, uuid, name, coin, balance];
}