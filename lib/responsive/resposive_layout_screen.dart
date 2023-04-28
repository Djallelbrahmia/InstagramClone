import 'package:flutter/material.dart';
import 'package:instagram_flutter/providers/user_provider.dart';
import 'package:instagram_flutter/utility/global_variables.dart';
import 'package:provider/provider.dart';

class ResposiveLayout extends StatefulWidget {
  final Widget webScreenlayout;
  final Widget mobileScreenLayout;
  const ResposiveLayout(
      {super.key,
      required this.webScreenlayout,
      required this.mobileScreenLayout});

  @override
  State<ResposiveLayout> createState() => _ResposiveLayoutState();
}

class _ResposiveLayoutState extends State<ResposiveLayout> {
  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > webScreenSize) {
        return widget.webScreenlayout;
        //WebScreen
      } else {
        return widget.mobileScreenLayout;
        //Mobile Screen}
      }
    });
  }
}
