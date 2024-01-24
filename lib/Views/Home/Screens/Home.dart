// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/shared/CCurvedEdges.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: CCurvedEdges(),
              child: Container(
                color: CColors.primary,
                padding: EdgeInsets.all(0),
                child: SizedBox(
                  height: 400,
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
