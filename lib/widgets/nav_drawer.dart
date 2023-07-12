import 'package:flutter/material.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        const UserAccountsDrawerHeader(
          accountName: Text('John Doe'), // User's name
          accountEmail: Text('johndoe@example.com'), // User's email
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage('assets/avatar.png'), // User's avatar
          ),
          decoration: BoxDecoration(
            color: Colors.blue, // Header background color
          ),
        ),
        // Container(
        //   width: 150.0,
        //   height: 60.0,
        //   color: Colors.green,
        // ),
        Container(
          color: Colors.red,
          padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          child: ListView(children: [
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60.0,
                margin: const EdgeInsets.only(top: 10, right: 15.0),
                padding: const EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF2B88D8), Color(0xFF0545EA)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )
                ),
                child:  const Row(
                  children: [
                    Icon(Icons.home_filled, color: Colors.white,),
                    SizedBox(width: 10),
                    Text('Dashboard', style: TextStyle(color: Colors.white),)
                  ],),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60.0,
                margin: const EdgeInsets.only(top: 10, right: 15.0),
                padding: const EdgeInsets.only(left: 15, right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.transparent
                ),
                child:  const Row(children: [
                  Icon(Icons.home_filled, color: Colors.grey,),
                  SizedBox(width: 10),
                  Expanded(child: Text('Loans', style: TextStyle(color: Colors.grey),)),
                  Icon(Icons.arrow_forward_ios, size: 12.0,)
                ],),
              ),
            ),
            const SizedBox(height: 15),
          ],),
        ),
      ],),
    );
  }
}
