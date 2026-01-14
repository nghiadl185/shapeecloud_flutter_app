// ignore_for_file: deprecated_member_use, unused_field
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shapeecloud_flutter_app/app/screen/home/provider/BottomNavigation_provider.dart';
import 'package:shapeecloud_flutter_app/app/screen/home/screen/homePage/home_screen.dart'; 
import 'package:shapeecloud_flutter_app/app/screen/kiaraPage/kiara_screen.dart';
import 'package:shapeecloud_flutter_app/app/screen/soundsPage/sounds_screen.dart';
import 'package:shapeecloud_flutter_app/app/utils/app_color.dart';
import 'package:shapeecloud_flutter_app/app/utils/app_textStyle.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key, this.menuIndex = 0});
  final int menuIndex;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final BottomNavigationProvider _provider = BottomNavigationProvider();

  Widget getpage(BottomNavigationProvider provider) {
    switch (provider.currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const Center(child: Text('Insights Page'));
      case 2:
        return const KiaraScreen();
      case 3:
        return const SoundsScreen();
      case 4:
        return const Center(child: Text('Profile Page'));
      default:
        return const HomePage();
    }
  }

  @override
  void initState() {
    _provider.updateIndex(widget.menuIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BottomNavigationProvider>(
      create: (_) => _provider,
      child: Consumer<BottomNavigationProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            backgroundColor: AppColor.background,
            body: getpage(provider),
 
            bottomNavigationBar: SizedBox(
              height: 100, 
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.background_menu,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColor.BorderRadius,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      provider.destination.length,
                      (index) {
                        final item = provider.destination[index];
                        final selected =
                            provider.currentIndex == index;

                        return _BottomNavItem(
                          icon: item.icon,
                          label: item.label,
                          selected: selected,
                          onTap: () =>
                              provider.updateIndex(index),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final Widget icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _BottomNavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        height: 56, 
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 4,
          ),
          decoration: BoxDecoration(
            color: selected
                ? AppColor.button_menu
                : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconTheme(
                data: IconThemeData(
                  color:
                      selected ? Colors.white : Colors.grey,
                  size: 25,
                ),
                child: icon,
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: AppTextStyle.title12Bold.copyWith(
                  fontSize: 11,
                  color: selected
                      ? Colors.white
                      : Colors.grey,
                  fontWeight: selected
                      ? FontWeight.w600
                      : FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
