import 'package:flutter/material.dart';
class NavigationRailScreens extends StatefulWidget {
  const NavigationRailScreens({super.key});

  @override
  State<NavigationRailScreens> createState() => _NavigationRailScreensState();
}

class _NavigationRailScreensState extends State<NavigationRailScreens> {
  int selectedIndex=0;
  final _pages=[
    Container(color: Colors.green,),
    Container(color: Colors.blue,),
  ];
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            NavigationRail(

              labelType: NavigationRailLabelType.selected,
              backgroundColor: Colors.red.shade50,
              destinations: [
      NavigationRailDestination(

          icon: Icon(Icons.wifi), label: Text("Wifi"),selectedIcon: Icon(Icons.wifi,color: Colors.red,)
      ),
      NavigationRailDestination(
        icon: Icon(Icons.g_translate), label: Text("Translate"),selectedIcon: Icon(Icons.g_translate,color: Colors.red,)
      ),
              ],
                selectedIndex:  selectedIndex,
onDestinationSelected: (value) {
  setState(() {
    selectedIndex=value;
  });
},
            ),

            Expanded(
              child: Container(
child: _pages[selectedIndex],
              ),
            )
          ],
        ),
      ),
    );
  }
}
