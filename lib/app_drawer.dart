import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  Function onTap;

  AppDrawer({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF171717),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.8,
      height: double.infinity,
      child: Column(
        children: [
          Container(
              color: Colors.white,
              width: double.infinity,
              height: 220,
              alignment: Alignment.center,
              child: Text("News App")),
          InkWell(
            onTap: () {
              onTap();
            },
            child: ListTile(
              leading: Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
              title: Text(
                "Back TO Home",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                "Click Here",
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
