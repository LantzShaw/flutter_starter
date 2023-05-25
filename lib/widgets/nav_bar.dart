import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: const Text('Lantz'),
            accountEmail: const Text('lantzshaw@163.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/avatar.png',
                  width: 80.0,
                  height: 80.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.amberAccent,
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('favorite'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('favorite'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('favorite'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('favorite'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('favorite'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('favorite'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('favorite'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('favorite'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('favorite'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('favorite'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
