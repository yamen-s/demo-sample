import 'package:echo_cash/features/wallet/domain/entities/wallet_entitiy.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _coinCodeController = TextEditingController();

  final createWalletFormKey = GlobalKey<FormState>();

  final updateWalletFormKey = GlobalKey<FormState>();

  List<WalletEntity> _loadedWallets = [
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

  List<dynamic> availableCoins = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wallets"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Add Wallet'),
                    content: SizedBox(
                      width: double.maxFinite,
                      child: Form(
                        key: createWalletFormKey,
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            TextFormField(
                              controller: _nameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter wallet name';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                labelText: 'Wallet Name',
                              ),
                            ),
                            DropdownButton<String>(
                              isExpanded: true,
                              hint: const Text("Select Coin"),
                              value: _coinCodeController.text,
                              items: _loadedWallets.map((coin) {
                                return DropdownMenuItem<String>(
                                  value: coin.coin,
                                  child: Text(coin.name),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                _coinCodeController.text = newValue!;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          _nameController.clear();
                          _coinCodeController.clear();
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Add'),
                        onPressed: () {
                          if (createWalletFormKey.currentState!.validate()) {
                            _nameController.clear();
                            _coinCodeController.clear();
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: _loadedWallets.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_loadedWallets[index].name),
            subtitle: Text(
                'xx${_loadedWallets[index].uuid.toString().substring(_loadedWallets[index].uuid.toString().length - 4)}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(_loadedWallets[index].balance.toString()),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    _nameController.text = _loadedWallets[index].name;

                    _coinCodeController.text = _loadedWallets[index].coin;

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Edit Wallet'),
                          content: SizedBox(
                            width: double.maxFinite,
                            child: Form(
                              key: updateWalletFormKey,
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  TextFormField(
                                    controller: _nameController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter wallet name';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      labelText: 'Wallet Name',
                                    ),
                                  ),
                                  DropdownButton<String>(
                                    isExpanded: true,
                                    hint: Text(_loadedWallets[index].coin),
                                    value: _loadedWallets[index].coin,
                                    items: _loadedWallets.map((coin) {
                                      return DropdownMenuItem<String>(
                                        value: coin.coin,
                                        child: Text(coin.name),
                                      );
                                    }).toList(),
                                    onChanged: (val) {
                                      print(val);
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                          actions: [
                            TextButton(
                              child: const Text('Cancel'),
                              onPressed: () {
                                _nameController.clear();
                                _coinCodeController.clear();
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text('Update'),
                              onPressed: () {
                                if (updateWalletFormKey.currentState!
                                    .validate()) {
                                  _nameController.clear();
                                  _coinCodeController.clear();

                                  Navigator.of(context).pop();
                                }
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                (_loadedWallets[index].balance == 0.0)
                    ? IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Confirmation"),
                                content: const Text("are you sure ?"),
                                actions: [
                                  TextButton(
                                    child: const Text("Cancel"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  TextButton(
                                    child: const Text("Delete"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      )
                    : const SizedBox(),
              ],
            ),
          );
        },
      ),
    );
  }
}
