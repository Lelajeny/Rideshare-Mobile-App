import 'package:flutter/material.dart';
import 'package:rideshare_app/Screen/settings/settings1.dart';
import 'package:rideshare_app/core/configs/theme/app_colors.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
    this.userName = 'Nate Samson',
    this.userEmail = 'nate@email.com',
    this.onItemTap,
  });

  final String userName;
  final String userEmail;
  final ValueChanged<String>? onItemTap;

  static Drawer buildDrawer(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 0.72;

    return Drawer(
      width: width,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(48),
          bottomRight: Radius.circular(48),
        ),
      ),
      child: const SideMenu(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBackButton(context),
            const SizedBox(height: 24),
            _buildProfileSection(),
            const SizedBox(height: 32),
            Expanded(child: _buildMenuList(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 16, 0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black87,
                size: 18,
              ),
            ),
            const Text(
              'Back',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff414141),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 36,
            backgroundColor: const Color(0xFFE3F2FD),
            child: CircleAvatar(
              radius: 32,
              backgroundColor: const Color(0xFFBBDEFB),
              child: Icon(
                Icons.person,
                size: 40,
                color: Colors.blue.shade700,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            userName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            userEmail,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.grey600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuList(BuildContext context) {
    const menuItems = [
      _SideMenuItem(icon: Icons.receipt_long_outlined, label: 'History'),
      _SideMenuItem(icon: Icons.feedback_outlined, label: 'Complain'),
      _SideMenuItem(icon: Icons.groups_outlined, label: 'Referral'),
      _SideMenuItem(icon: Icons.info_outline, label: 'About Us'),
      _SideMenuItem(icon: Icons.settings_outlined, label: 'Settings'),
      _SideMenuItem(icon: Icons.help_outline, label: 'Help and Support'),
      _SideMenuItem(icon: Icons.logout, label: 'Logout'),
    ];

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemCount: menuItems.length,
      separatorBuilder: (_, __) => const Divider(
        height: 1,
        thickness: 1,
        color: AppColors.grey400,
      ),
      itemBuilder: (context, index) {
        final item = menuItems[index];

        return InkWell(
          onTap: () => _handleItemTap(context, item.label),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Row(
              children: [
                Icon(
                  item.icon,
                  size: 22,
                  color: Colors.black87,
                ),
                const SizedBox(width: 16),
                Text(
                  item.label,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _handleItemTap(BuildContext context, String label) {
    onItemTap?.call(label);
    Navigator.pop(context);

    if (label == 'Settings') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const SettingsPage()),
      );
    }
  }
}

class _SideMenuItem {
  const _SideMenuItem({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;
}
