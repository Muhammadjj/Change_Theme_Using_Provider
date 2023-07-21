// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managent_provider/Screens/change_Theme/Provider_Using_Theme_Changing/theme_provider.dart';

void main(List<String> args) {
  runApp(const ThemeChanger());
}

class ThemeChanger extends StatefulWidget {
  const ThemeChanger({super.key});
  @override
  State<ThemeChanger> createState() => _ThemeChangerState();
}

class _ThemeChangerState extends State<ThemeChanger> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: Builder( builder: (context) {
            var themechanger = Provider.of<ThemeProvider>(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: themechanger.themeMode,
              darkTheme: ThemeData(brightness: Brightness.dark),
              theme: ThemeData(primarySwatch: Colors.red),
              home: const ThemeChangeUsingProvider(),
            );
          },
        ));
  }
}





class ThemeChangeUsingProvider extends StatefulWidget {
  const ThemeChangeUsingProvider({super.key});

  @override
  State<ThemeChangeUsingProvider> createState() =>  _ThemeChangeUsingProviderState();
}

class _ThemeChangeUsingProviderState extends State<ThemeChangeUsingProvider> {
  @override
  Widget build(BuildContext context) {
    
    // var themeChanger = Provider.of<ThemeProvider>(context, listen: false);

    print("object");
    return Scaffold(
      appBar: AppBar(title:const Text("Theme Check Using Provider"),centerTitle: true,),
      body: Column(
        children: [
          Consumer<ThemeProvider>(
            builder: (context, value, child) {
              return RadioListTile<ThemeMode>(
                  title: const Text("Light Mode"),
                  value: ThemeMode.light,
                  groupValue: value.themeMode,
                  onChanged: value.setTheme);
            },
          ),

          Consumer<ThemeProvider>(
            builder: (context, value, child) {
              return RadioListTile<ThemeMode>(
                  title: const Text("Dark Mode"),
                  value: ThemeMode.dark,
                  groupValue: value.themeMode,
                  onChanged: value.setTheme);
            },
          ),

          Consumer<ThemeProvider>(
            builder: (BuildContext context,ThemeProvider value, Widget? child) {
              return RadioListTile<ThemeMode>(
                  title: const Text("System Display"),
                  value: ThemeMode.system,
                  groupValue: value.themeMode,
                  onChanged: value.setTheme);
            },
          )
        ],
      ),
    );
  }
}
