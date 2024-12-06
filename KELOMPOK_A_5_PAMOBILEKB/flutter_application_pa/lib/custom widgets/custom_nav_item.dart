import 'package:flutter/material.dart';

class CustomNavItem extends StatefulWidget {
  final IconData icon;
  final int id;
  final Function(int) setPage;
  final bool isActive;

  const CustomNavItem({
    required this.setPage,
    required this.icon,
    required this.id,
    this.isActive = false,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomNavItem> createState() => _CustomNavItemState();
}

class _CustomNavItemState extends State<CustomNavItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0, end: -15).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
    if (widget.isActive) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(CustomNavItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: GestureDetector(
            onTap: () {
              widget.setPage(widget.id); // Memanggil fungsi setPage
            },
            child: CircleAvatar(
              radius: 30,
              backgroundColor: const Color(0xFF107115),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: widget.isActive
                    ? Colors.white.withOpacity(0.9)
                    : Colors.transparent,
                child: Icon(
                  widget.icon,
                  color:
                      widget.isActive ? Colors.black : Colors.white.withOpacity(0.9),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
