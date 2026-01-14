// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shapeecloud_flutter_app/app/screen/home/provider/boxbutton_provider.dart';
class BoxButton extends StatefulWidget {
  const BoxButton({
    super.key,
    required this.height,
    required this.containerIcon,
    required this.containerText,
    this.status = 'default',
    this.isClick = false,
    this.item = 'default',
  });

  final int height;
  final Widget containerIcon;
  final Widget containerText;
  final String status;
  final bool isClick;
  final String item;

  @override
  State<BoxButton> createState() => _BoxButtonState();
}

class _BoxButtonState extends State<BoxButton> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BoxbuttonProvider(),
      child: Consumer<BoxbuttonProvider>(
        builder: (context, provider, _) {
          return Container(
            alignment: Alignment.center,
            height: widget.height.toDouble(),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: provider.setStatus(widget.status, widget.item, widget.isClick),
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: provider.colorsBorder,
                width: 2,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.containerIcon,
                const SizedBox(height: 6),
                widget.containerText,
              ],
            ),
          );
        },
      ),
    );
  }
}
