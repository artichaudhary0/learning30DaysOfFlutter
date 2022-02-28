import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: context.theme.canvasColor,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text(
                  'Arti Chaudhary',
                  textScaleFactor: 1.3,
                ),
                accountEmail: Text(
                  'chaudhary.aarti@gmail.com',
                  textScaleFactor: 1.3,
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/artichaudhary.png'),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                'Home',
                textScaleFactor: 1.3,
                style: TextStyle(color: context.theme.accentColor),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                'Profile',
                textScaleFactor: 1.3,
                style: TextStyle(color: context.theme.accentColor),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.at,
                color: Colors.white,
              ),
              title: Text(
                'Email Me',
                textScaleFactor: 1.3,
                style: TextStyle(color: context.theme.accentColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
