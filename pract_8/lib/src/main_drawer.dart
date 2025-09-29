import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Padding(
            padding: EdgeInsets.only(top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage('https://imgs.search.brave.com/3N3Xsq-83grgWiMLCcK2EvY0QTa7L1n_INGOmzT3yGE/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93YWxs/cGFwZXJzLmNvbS9p/bWFnZXMvaGQvdGhl/LTEwMC10ZWxldmlz/aW9uLXNob3ctcy1p/bnRyby1sb2dvLWlq/amF4OTYwMTQxbnZu/aWcuanBn'),
                  backgroundColor: Colors.white,
                ),
                SizedBox(height: 5),
                Text('Jesus Reyes', style: TextStyle(fontSize: 22)),
                SizedBox(height: 5),
                Text('Alumno', style: TextStyle(fontSize: 16.0)),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(
            Icons.person,
            color: Colors.black,
          ),
          title: Text('Perfil'),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(
            Icons.inbox,
            color: Colors.black,
          ),
          title: Text('Mensajería'),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(
            Icons.assessment,
            color: Colors.black,
          ),
          title: Text('Dashboard'),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(
            Icons.settings,
            color: Colors.black,
          ),
          title: Text('Configuración'),
        ),
      ],
    );
  }
}
