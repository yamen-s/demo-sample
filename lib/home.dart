import 'package:echo_cash/core/widgets/logged_in_drawer_widget.dart';
import 'package:echo_cash/features/wallet/presentation/widgets/wallet_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('notifications');
            },
            icon: const Icon(
              Icons.notifications,
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          WalletWidget()
        ],
      ),
      drawer: const LoggedInCustomDrawer(),
    );
  }

}