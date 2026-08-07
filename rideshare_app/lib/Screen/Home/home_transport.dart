import 'package:flutter/material.dart';
import 'package:rideshare_app/core/configs/theme/app_colors.dart';

class HomeTransport extends StatefulWidget {
  const HomeTransport({super.key});

  @override
  State<HomeTransport> createState() => _HomeTransportState();
}

class _HomeTransportState extends State<HomeTransport> {
  bool _isTransport = true;

  static const _panelGreen = Color(0xFFE4F7EF);
  static const _menuGreen = Color(0xFFD4F0E6);

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.paddingOf(context).top;
    final bottomNavHeight = 88.0 + MediaQuery.paddingOf(context).bottom;
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Stack(
      fit: StackFit.expand,
      children: [
        const _MapBackground(),
        SingleChildScrollView(
          padding: EdgeInsets.only(
            top: topPadding + 64,
            left: 16,
            right: 16,
            bottom: bottomNavHeight + 16,
          ),
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.32,
                child: const Center(child: _LocationMarker()),
              ),
              Row(
                children: [
                  Expanded(
                    child: Material(
                      color: AppColors.secondprimary,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(10),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 7),
                          child: Text(
                            'Rental',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  _TopIconButton(
                    backgroundColor: Colors.white,
                    icon: Icons.my_location,
                    hasShadow: true,
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _panelGreen,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Where would you go?',
                        hintStyle: const TextStyle(
                          color: AppColors.textColor,
                          fontSize: 15,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: AppColors.grey600,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border,
                            color: AppColors.textColor,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          _ModeButton(
                            label: 'Transport',
                            isSelected: _isTransport,
                            onTap: () => setState(() => _isTransport = true),
                          ),
                          _ModeButton(
                            label: 'Delivery',
                            isSelected: !_isTransport,
                            onTap: () => setState(() => _isTransport = false),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: topPadding + 12,
          left: 16,
          child: Builder(
            builder: (context) => _TopIconButton(
              backgroundColor: _menuGreen,
              icon: Icons.menu,
              onTap: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
        Positioned(
          top: topPadding + 12,
          right: 16,
          child: _TopIconButton(
            backgroundColor: Colors.white,
            icon: Icons.notifications_none,
            hasShadow: true,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

class _TopIconButton extends StatelessWidget {
  const _TopIconButton({
    required this.backgroundColor,
    required this.icon,
    required this.onTap,
    this.hasShadow = false,
  });

  final Color backgroundColor;
  final IconData icon;
  final VoidCallback onTap;
  final bool hasShadow;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(10),
      elevation: hasShadow ? 2 : 0,
      shadowColor: Colors.black26,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          width: 44,
          height: 44,
          child: Icon(icon, color: Colors.black87, size: 22),
        ),
      ),
    );
  }
}

class _ModeButton extends StatelessWidget {
  const _ModeButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.secondprimary : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}

class _LocationMarker extends StatelessWidget {
  const _LocationMarker();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 160,
        height: 160,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _PulseCircle(size: 160, opacity: 0.12),
            _PulseCircle(size: 110, opacity: 0.18),
            _PulseCircle(size: 60, opacity: 0.25),
            const Icon(
              Icons.location_on,
              size: 36,
              color: Colors.black87,
            ),
          ],
        ),
      ),
    );
  }
}

class _PulseCircle extends StatelessWidget {
  const _PulseCircle({
    required this.size,
    required this.opacity,
  });

  final double size;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primary.withValues(alpha: opacity),
      ),
    );
  }
}

class _MapBackground extends StatelessWidget {
  const _MapBackground();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _MapPainter(),
      size: Size.infinite,
    );
  }
}

class _MapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Offset.zero & size,
      Paint()..color = const Color(0xFFF5F5F0),
    );

    final blockPaint = Paint()..color = const Color(0xFFE8EDE6);
    final roadPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke;

    const blockSize = 80.0;
    for (var y = 0.0; y < size.height; y += blockSize) {
      for (var x = 0.0; x < size.width; x += blockSize) {
        if ((x / blockSize + y / blockSize).toInt() % 2 == 0) {
          canvas.drawRect(
            Rect.fromLTWH(x + 3, y + 3, blockSize - 6, blockSize - 6),
            blockPaint,
          );
        }
      }
    }

    for (var x = 0.0; x <= size.width; x += blockSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), roadPaint);
    }
    for (var y = 0.0; y <= size.height; y += blockSize) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), roadPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
