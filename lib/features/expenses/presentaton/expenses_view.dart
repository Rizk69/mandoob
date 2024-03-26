import 'package:flutter/material.dart';

import '../../home/presentation/widget/drawer_home.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      drawer: buildDrawer(context),
      key: scaffoldKey,
      body: Column(
        children: [

        ],
      ),
    );
  }
}
