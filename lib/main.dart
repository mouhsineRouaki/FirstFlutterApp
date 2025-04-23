import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon Application Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/homePage': (context) =>  MyHomePage(title: 'Page d\'accueil Flutter'),
        '/profile': (context) =>  ProfilePage(),
        '/': (context) =>  LoginPage(),
        '/settings': (context) =>  SettingsPage(),
        '/help': (context) =>  HelpPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
   MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();

  String _selectedSexe = 'Homme';
  bool _specialiteWeb = false;
  bool _specialiteMobile = false;

  String _selectedLangage = 'Dart';
  final List<String> _langages = ['Dart', 'Java', 'Kotlin', 'Python', 'JavaScript'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: _buildDrawer(context),
      body: Padding(
        padding:  EdgeInsets.all(16.0),
        child: ListView(
          children: [
             Text("Formulaire d'inscription", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
             SizedBox(height: 20),
            TextField(
              controller: _nomController,
              decoration:  InputDecoration(
                labelText: 'Nom',
                border: OutlineInputBorder(),
              ),
            ),
             SizedBox(height: 16),

            TextField(
              controller: _prenomController,
              decoration:  InputDecoration(
                labelText: 'Prénom',
                border: OutlineInputBorder(),
              ),
            ),
             SizedBox(height: 20),

             Text("Sexe :", style: TextStyle(fontWeight: FontWeight.bold)),
            RadioListTile<String>(
              title:  Text('Homme'),
              value: 'Homme',
              groupValue: _selectedSexe,
              onChanged: (value) {
                setState(() {
                  _selectedSexe = value!;
                });
              },
            ),
            RadioListTile<String>(
              title:  Text('Femme'),
              value: 'Femme',
              groupValue: _selectedSexe,
              onChanged: (value) {
                setState(() {
                  _selectedSexe = value!;
                });
              },
            ),

             SizedBox(height: 20),

             Text("Spécialité :", style: TextStyle(fontWeight: FontWeight.bold)),
            CheckboxListTile(
              title:  Text('Web'),
              value: _specialiteWeb,
              onChanged: (value) {
                setState(() {
                  _specialiteWeb = value!;
                });
              },
            ),
            CheckboxListTile(
              title:  Text('Mobile'),
              value: _specialiteMobile,
              onChanged: (value) {
                setState(() {
                  _specialiteMobile = value!;
                });
              },
            ),

             SizedBox(height: 20),

             Text("Langage préféré :", style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: _selectedLangage,
              isExpanded: true,
              items: _langages.map((lang) {
                return DropdownMenuItem<String>(
                  value: lang,
                  child: Text(lang),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedLangage = value!;
                });
              },
            ),

             SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                final nom = _nomController.text;
                final prenom = _prenomController.text;

                final specialites = [
                  if (_specialiteWeb) 'Web',
                  if (_specialiteMobile) 'Mobile'
                ].join(', ');

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Nom: $nom\nPrénom: $prenom\nSexe: $_selectedSexe\nSpécialités: $specialites\nLangage: $_selectedLangage')),
                );
              },
              child:  Text('Soumettre'),
            ),
          ],
        ),
      ),
    );
  }
}
 Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Menu de Navigation',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                 Text(
                  ' Flutter',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading:  Icon(Icons.home),
            title:  Text('Accueil'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/homePage');
            },
          ),
          ListTile(
            leading:  Icon(Icons.person),
            title:  Text('Profil'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/profile');
            },
          ),
           Divider(),
          ListTile(
            leading:  Icon(Icons.settings),
            title:  Text('Paramètres'),
            trailing:  Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/settings');
            },
          ),
          ListTile(
            leading:  Icon(Icons.help),
            title:  Text('Aide'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/help');
            },
          ), 
           Divider(),
          ListTile( 
            leading:  Icon(Icons.logout, color: Colors.red),
            title:  Text('Déconnexion', style: TextStyle(color: Colors.red)),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/');
            },
          ),
        ],
      ),
    );
  }



class ProfilePage extends StatelessWidget {
   ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Profil'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        padding:  EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.blue.shade100,
              child:  Icon(Icons.person, size: 60, color: Colors.blue),
            ),
             SizedBox(height: 20),

            ListTile(
              leading:  Icon(Icons.account_circle),
              title:  Text('Nom'),
              subtitle:  Text('Mouhsine'),
            ),
            ListTile(
              leading:  Icon(Icons.email),
              title:  Text('Email'),
              subtitle:  Text('mouhsine@example.com'),
            ),

            ListTile(
              leading:  Icon(Icons.phone),
              title:  Text('Telephone'),
              subtitle:  Text('+212 6 12 34 56 78'),
            ),

            ListTile(
              leading:  Icon(Icons.calendar_today),
              title:  Text('Date de naissance'),
              subtitle:  Text('01 janvier 2000'),
            ),

             Divider(height: 40),

            ElevatedButton.icon(
              onPressed: () {
              },
              icon:  Icon(Icons.edit),
              label:  Text('Modifier le profil'),
              style: ElevatedButton.styleFrom(
                minimumSize:  Size(double.infinity, 50),
              ),
            ),
             SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: () {

              },
              icon:  Icon(Icons.logout, color: Colors.red),
              label:  Text('Deconnexion', style: TextStyle(color: Colors.red)),
              style: OutlinedButton.styleFrom(
                side:  BorderSide(color: Colors.red),
                minimumSize:  Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class SettingsPage extends StatefulWidget {
   SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;
  String _selectedLanguage = 'Français';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Paramètres'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView(
        padding:  EdgeInsets.all(16),
        children: [
           Icon(Icons.settings, size: 80, color: Colors.blueAccent),
           SizedBox(height: 20),

           Text(
            'Preferences',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
           SizedBox(height: 10),

          SwitchListTile(
            title:  Text('Mode sombre'),
            value: _darkMode,
            onChanged: (value) {
              setState(() {
                _darkMode = value;
              });
            },
            secondary:  Icon(Icons.dark_mode),
          ),

           SizedBox(height: 10),

          ListTile(
            leading:  Icon(Icons.language),
            title:  Text('Langue'),
            trailing: DropdownButton<String>(
              value: _selectedLanguage,
              items: ['Français', 'Anglais', 'Espagnol']
                  .map((lang) => DropdownMenuItem(
                        value: lang,
                        child: Text(lang),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedLanguage = value!;
                });
              },
            ),
          ),

           Divider(height: 40),

           Text(
            'Compte',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
           SizedBox(height: 10),

          ListTile(
            leading:  Icon(Icons.lock),
            title:  Text('Changer le mot de passe'),
            onTap: () {
            },
          ),
          ListTile(
            leading:  Icon(Icons.delete_forever, color: Colors.red),
            title:  Text('Supprimer le compte'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(content: Text('Suppression du compte...')),
              );
            },
          ),
        ],
      ),
    );
  }
}


class LoginPage extends StatelessWidget {
   LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Center(
        child: SingleChildScrollView(
          padding:  EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue.shade100,
                child: Icon(Icons.lock, size: 50, color: Colors.blue),
              ),
               SizedBox(height: 30),

               Text(
                'Connexion',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
               SizedBox(height: 30),

              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon:  Icon(Icons.email),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
               SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                  prefixIcon:  Icon(Icons.lock),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
               SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon:  Icon(Icons.login),
                  label:  Text('Se connecter'),
                  onPressed: () {
                    String email = emailController.text;
                    String password = passwordController.text;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Connexion avec $email')),
                    );
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/homePage');
                  },
                  style: ElevatedButton.styleFrom(
                    padding:  EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
               SizedBox(height: 20),

              TextButton(
                onPressed: () {
            
                },
                child:  Text('Pas encore de compte ? S\'inscrire'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class HelpPage extends StatelessWidget {
   HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('Aide')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Icon(Icons.help, size: 100),
             SizedBox(height: 20),
             Text('Page d\'Aide', style: TextStyle(fontSize: 24)),
             SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => 
              Navigator.pop(context),
              child:  Text('Retour'),
            ),
          ],
        ),
      ),
    );
  }
}
