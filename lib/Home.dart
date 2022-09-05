import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './provider/general.dart';
import 'app/wallet/walletScreen.dart';
import './reqular_widgets/loading.dart';
import 'app/signing/signinScreen.dart';
import 'app/exchange/exchangeScreen.dart';
import 'app/plan/planScreen.dart';
import 'app/setting/settingScreen.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Provider.of<General>(context, listen: false).tryAutoLogin(true);
    });
    super.initState();
  }

  List<Widget> _pages = [
    WalletScreen(),
    ExchangeScreen(),
    PlanScreen(),
    SettingScreen()
  ];
  int selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  Widget build(BuildContext context) {
    final g = Provider.of<General>(context);

    return g.token.contains("Bearer")
        ? g.userId.length > 5
            ? SafeArea(
                child: Scaffold(
                body: _pages[selectedPageIndex],
                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed, // This is all you need!
                  onTap: _selectPage,
                  backgroundColor: Colors.white,
                  unselectedItemColor: Colors.grey,
                  selectedItemColor: Colors.black,
                  currentIndex: selectedPageIndex,
                  items: [
                    const BottomNavigationBarItem(
                        icon: Icon(Icons.wallet), label: 'Wallet'),
                    const BottomNavigationBarItem(
                        icon: Icon(Icons.currency_exchange), label: 'Exchange'),
                    const BottomNavigationBarItem(
                        icon: Icon(Icons.waterfall_chart_outlined), label: 'Plan'),
                    const BottomNavigationBarItem(
                        icon: Icon(Icons.settings_applications), label: 'Settings'),
                  ],
                ),
              ))
            : LOADING()
        : SignInScreen();
  }
}
