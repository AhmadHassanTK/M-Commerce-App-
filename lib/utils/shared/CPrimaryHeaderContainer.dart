import 'package:flutter/material.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/shared/CCurvedEdges.dart';

class CPrimaryHeaderContainer extends StatelessWidget {
  const CPrimaryHeaderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CCurvedEdges(),
      child: Container(
        color: CColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: Container(
                  height: 400,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(400),
                    color: CColors.white.withOpacity(0.1),
                  ),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: Container(
                  height: 400,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(400),
                    color: CColors.white.withOpacity(0.1),
                  ),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
