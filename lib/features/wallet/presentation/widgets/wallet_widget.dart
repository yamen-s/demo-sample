import 'package:echo_cash/features/wallet/domain/entities/wallet_entitiy.dart';
import 'package:flutter/material.dart';

class WalletWidget extends StatefulWidget {
  const WalletWidget({super.key});

  @override
  State<WalletWidget> createState() => _WalletWidgetState();
}

class _WalletWidgetState extends State<WalletWidget> {
  final List _loadedWallets = [
    WalletEntity(
      id: 1,
      uuid: "1234567890",
      name: "Wallet 1",
      coin: "BTC",
      balance: 125.0,
    ),
    WalletEntity(
      id: 2,
      uuid: "1234567890",
      name: "Wallet 2",
      coin: "ETH",
      balance: 200.0,
    ),
    WalletEntity(
      id: 3,
      uuid: "1234567890",
      name: "Wallet 3",
      coin: "LTC",
      balance: 0.0,
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text("My Accounts"), //header title
      children: List.generate(_loadedWallets.length, (index) {
        return ListTile(
          title: Text(_loadedWallets[index].name),
          subtitle: Text(
              "xx${_loadedWallets[index].uuid.toString().substring(_loadedWallets[index].uuid.toString().length - 4)}"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(_loadedWallets[index].balance.toString()),
              const SizedBox(width: 5),
              Text(_loadedWallets[index].coin.toString()),
            ],
          ),
        );
      }),
    );
  }
}
