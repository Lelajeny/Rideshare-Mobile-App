import 'package:flutter/material.dart';
import 'package:rideshare_app/Screen/Home/home_transport.dart';
import 'package:rideshare_app/Screen/Nav%20Bar/side_menu.dart';
import 'package:rideshare_app/core/configs/theme/app_colors.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  final _pages = const [
    HomeTransport(),
    _NavPlaceholder(title: 'Favourite'),
    _NavPlaceholder(title: 'Wallet'),
    _NavPlaceholder(title: 'Offer'),
    _NavPlaceholder(title: 'Profile'),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      drawer: SideMenu.buildDrawer(context),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: _CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class _CustomBottomNavBar extends StatelessWidget {
  const _CustomBottomNavBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return SizedBox(
      height: 88 + bottomPadding,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 72 + bottomPadding,
            padding: EdgeInsets.only(bottom: bottomPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(36)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 16,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: Row(
              children: [
                _NavItem(
                  index: 0,
                  label: 'Home',
                  outlinedIcon: Icons.home_outlined,
                  filledIcon: Icons.home,
                  selectedIndex: selectedIndex,
                  onTap: onItemTapped,
                ),
                _NavItem(
                  index: 1,
                  label: 'Favourite',
                  outlinedIcon: Icons.favorite_border,
                  filledIcon: Icons.favorite,
                  selectedIndex: selectedIndex,
                  onTap: onItemTapped,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => onItemTapped(2),
                    behavior: HitTestBehavior.opaque,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(height: 32),
                        Text(
                          'Wallet',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: selectedIndex == 2
                                ? AppColors.primary
                                : Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                _NavItem(
                  index: 3,
                  label: 'Offer',
                  outlinedIcon: Icons.local_offer_outlined,
                  filledIcon: Icons.local_offer,
                  selectedIndex: selectedIndex,
                  onTap: onItemTapped,
                ),
                _NavItem(
                  index: 4,
                  label: 'Profile',
                  outlinedIcon: Icons.person_outline,
                  filledIcon: Icons.person,
                  selectedIndex: selectedIndex,
                  onTap: onItemTapped,
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            child: GestureDetector(
              onTap: () => onItemTapped(2),
              child: ClipPath(
                clipper: _HexagonClipper(),
                child: Container(
                  width: 58,
                  height: 66,
                  color: AppColors.primary,
                  child: const Icon(
                    Icons.account_balance_wallet_outlined,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.index,
    required this.label,
    required this.outlinedIcon,
    required this.filledIcon,
    required this.selectedIndex,
    required this.onTap,
  });

  final int index;
  final String label;
  final IconData outlinedIcon;
  final IconData filledIcon;
  final int selectedIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedIndex == index;
    final color = isSelected ? AppColors.primary : Colors.black87;

    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              isSelected ? filledIcon : outlinedIcon,
              color: color,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class _HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;

    return Path()
      ..moveTo(w / 2, 0)
      ..lineTo(w, h * 0.25)
      ..lineTo(w, h * 0.75)
      ..lineTo(w / 2, h)
      ..lineTo(0, h * 0.75)
      ..lineTo(0, h * 0.25)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _NavPlaceholder extends StatelessWidget {
  const _NavPlaceholder({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }
}
