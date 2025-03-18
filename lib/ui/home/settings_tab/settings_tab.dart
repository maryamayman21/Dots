import 'package:flutter/material.dart';
import 'package:todoapp/ui/home/settings_tab/theme_bottom_sheet.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Theme',
            style: Theme.of(context).textTheme.bodyLarge
            ,

          ),
          SizedBox(height: 8,),
          GestureDetector(
            onTap: showThemeBottomSheet,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
              border: Border.all(color: Theme.of(context).colorScheme.primary,
              width: 2
              ),
              ),
              child: Text('Light'),
            ),
          )
        ],
      ),
    );
  }
  void showThemeBottomSheet(){
    showModalBottomSheet(context: context, builder: (context)=> ThemeBottomSheet());

  }
}

