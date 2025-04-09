import
'package:flutter/material.dart';
import 'package:routiner/core/theme/app_colors.dart';
import 'package:routiner/core/widgets/settings_navigation_tile.dart';
import 'package:routiner/core/widgets/settings_section.dart';
import 'package:routiner/core/widgets/settings_switch_tile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // State variables for switches
  bool _isDarkModeEnabled = false;
  bool _isSoundsEnabled = true;
  bool _isVacationModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.textPrimary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // General Section
              SettingsSection(
                title: 'GENERAL',
                children: [
                  SettingsNavigationTile(
                    icon: Icons.settings_outlined,
                    title: 'General',
                    onTap: () {
                      // Navigate to general settings
                    },
                  ),
                  SettingsSwitchTile(
                    icon: Icons.dark_mode_outlined,
                    title: 'Dark Mode',
                    value: _isDarkModeEnabled,
                    onChanged: (value) {
                      setState(() {
                        _isDarkModeEnabled = value;
                      });
                      // Implement theme change logic
                    },
                  ),
                  SettingsNavigationTile(
                    icon: Icons.security_outlined,
                    title: 'Security',
                    onTap: () {
                      // Navigate to security settings
                    },
                  ),
                  SettingsNavigationTile(
                    icon: Icons.notifications_outlined,
                    title: 'Notifications',
                    onTap: () {
                      // Navigate to notifications settings
                    },
                  ),
                  SettingsSwitchTile(
                    icon: Icons.volume_up_outlined,
                    title: 'Sounds',
                    value: _isSoundsEnabled,
                    onChanged: (value) {
                      setState(() {
                        _isSoundsEnabled = value;
                      });
                      // Implement sounds toggle logic
                    },
                  ),
                  SettingsSwitchTile(
                    icon: Icons.beach_access_outlined,
                    title: 'Vacation Mode',
                    value: _isVacationModeEnabled,
                    onChanged: (value) {
                      setState(() {
                        _isVacationModeEnabled = value;
                      });
                      // Implement vacation mode logic
                    },
                  ),
                ],
              ),

              // About Us Section
              SettingsSection(
                title: 'ABOUT US',
                children: [
                  SettingsNavigationTile(
                    icon: Icons.star_outline,
                    title: 'Rate Routiner',
                    onTap: () {
                      // Open app store rating
                    },
                  ),
                  SettingsNavigationTile(
                    icon: Icons.share_outlined,
                    title: 'Share with Friends',
                    onTap: () {
                      // Open share dialog
                    },
                  ),
                  SettingsNavigationTile(
                    icon: Icons.info_outline,
                    title: 'About Us',
                    onTap: () {
                      // Navigate to about us screen
                    },
                  ),
                  SettingsNavigationTile(
                    icon: Icons.support_agent_outlined,
                    title: 'Support',
                    onTap: () {
                      // Navigate to support screen
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}