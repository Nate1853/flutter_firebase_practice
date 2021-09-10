import 'package:flutter/material.dart';
import 'package:practice/models/our_user.dart';
import 'package:practice/screens/authenticate/authenticate.dart';
import 'package:practice/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Our_User?>(context);

    print(user);
    //return either Home or Authenticate
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
