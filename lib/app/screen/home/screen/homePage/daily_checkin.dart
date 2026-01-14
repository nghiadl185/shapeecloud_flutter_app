// ignore_for_file: avoid_unnecessary_containers, deprecated_member_use, unused_element, use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shapeecloud_flutter_app/app/screen/home/provider/daily_provider.dart';
import 'package:shapeecloud_flutter_app/app/utils/SlideFadeIn.dart';
import 'package:shapeecloud_flutter_app/app/screen/home/widget/boxbutton.dart';
import 'package:shapeecloud_flutter_app/app/utils/app_color.dart';
import 'package:shapeecloud_flutter_app/app/utils/app_textStyle.dart';

class DailyCheckIn extends StatefulWidget {
  const DailyCheckIn({super.key});

  @override
  State<DailyCheckIn> createState() => _DailyCheckInState();
}

class _DailyCheckInState extends State<DailyCheckIn> {
  final DailyProvider _provider = DailyProvider();
@override
  void initState() {
    _provider.setMoodStatus('Neutral');
    _provider.setStatus('Energy');
    _provider.updateProgressEnergy(0.6);
    _provider.updateProgressStress(0.6);
    super.initState();
  }

  @override 
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _provider,
      child: Consumer<DailyProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            backgroundColor: AppColor.background,            
            body: DefaultTextStyle(
              style: const TextStyle(color: AppColor.textSelected),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      SlideFadeIn(
                        delay: 0,
                        child: SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: Row(
                            children: [ 
                              Expanded(child: Center(child: Text('Daily Check-in', style: AppTextStyle.title20Bold))),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon( Icons.clear, color: AppColor.white, size: 30,)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      SlideFadeIn(delay: 100, child: SizedBox(width: double.infinity, child: Center(child: Text('How are you feeling today?', style: AppTextStyle.title24Bold)))),
                      const SizedBox(height: 15),
                      SlideFadeIn(
                        delay: 200,
                        child: SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon( Icons.favorite_outlined, color: AppColor.button_menu, size: 15,),
                              const SizedBox(width: 5),
                              Text('Your feelings are valid', style: AppTextStyle.title16Regular.copyWith(color: AppColor.text1 )),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            SlideFadeIn(
                              delay: 400,
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text('Select your mood', style: AppTextStyle.title14Bold.copyWith(color: AppColor.text2))),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: SlideFadeIn(
                                    delay: 500,
                                    child: Stack(
                                      children:[
                                        InkWell(
                                          onTap: () { 
                                            provider.setMoodStatus('Very Sad');
                                          },
                                          child: _mood('Very Sad', provider, Icons.heart_broken_outlined),
                                        ),
                                        if (provider.moodStatus == 'Very Sad') clickMood(),
                                      ] 
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: SlideFadeIn(
                                    delay: 600,
                                    child: Stack(                                    
                                      children:[ 
                                        InkWell(
                                          onTap: () {
                                            provider.setMoodStatus('Sad');
                                          },
                                          child: _mood('Sad', provider, Icons.sentiment_dissatisfied_outlined),
                                        ),
                                        if (provider.moodStatus == 'Sad') clickMood(),
                                      ]
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: SlideFadeIn(
                                    delay: 700,
                                    child: Stack(                                    
                                      children:[ 
                                        InkWell(
                                          onTap: () {
                                            provider.setMoodStatus('Neutral');
                                          },
                                          child: _mood('Neutral', provider, Icons.sentiment_neutral_outlined),
                                        ),
                                        if (provider.moodStatus == 'Neutral') clickMood(),
                                      ]
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: SlideFadeIn(
                                    delay: 800,
                                    child: Stack(                                    
                                      children:[ 
                                        InkWell(
                                          onTap: () {
                                            provider.setMoodStatus('Happy');
                                          },
                                          child: _mood('Happy', provider, Icons.sentiment_satisfied_outlined),
                                        ),
                                        if (provider.moodStatus == 'Happy') clickMood(),
                                      ]
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(flex: 1,
                                  child: SlideFadeIn(
                                    delay: 900,
                                    child: Stack(                                    
                                      children:[ 
                                        InkWell(
                                          onTap: () {
                                            provider.setMoodStatus('Very Happy');
                                          },
                                          child: _mood('Very Happy', provider, Icons.thumb_up_alt_outlined),
                                        ),
                                        if (provider.moodStatus == 'Very Happy') clickMood(),
                                      ]
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            SlideFadeIn(
                              delay: 1000,
                              child: Row(
                                children: [
                                  Icon( Icons.bolt_outlined, color: AppColor.gold, size: 15,),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Energy Level', 
                                        style: AppTextStyle.title14Bold.copyWith(color: AppColor.text2)
                                      )
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: Text('${(provider.progressEnergy * 100).round()}%', 
                                      style: AppTextStyle.title20Bold.copyWith(color: AppColor.button_menu)
                                    )
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: SlideFadeIn(
                                    delay: 1100,
                                    child: InkWell(
                                      onTap: () { 
                                        provider.updateProgressEnergy(0.2);
                                      },
                                      child: _energy(0.06, 0.34, 'Exhausted', provider, Icons.battery_1_bar, AppColor.red),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),                                
                                Expanded(
                                  child: SlideFadeIn(
                                    delay: 1200,
                                    child: InkWell(
                                      onTap: () {  
                                        provider.updateProgressEnergy(0.4);
                                      },
                                      child: _energy(0.26, 0.54, 'Tired', provider, Icons.battery_4_bar, AppColor.material),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),                                
                                Expanded(
                                  child: SlideFadeIn(
                                    delay: 1300,
                                    child: InkWell(
                                      onTap: () { 
                                        provider.updateProgressEnergy(0.6);
                                      },
                                      child: _energy(0.46, 0.74, 'Okay', provider, Icons.battery_5_bar, AppColor.dodgerBlue),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),                                
                                Expanded(
                                  child: SlideFadeIn(
                                    delay: 1400,
                                    child: InkWell(
                                      onTap: () { 
                                        provider.updateProgressEnergy(0.8);
                                      },
                                      child: _energy(0.66, 0.94, 'Energized', provider, Icons.battery_full, AppColor.button_menu),  
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),                                
                                Expanded(
                                  child: SlideFadeIn(
                                    delay: 1500,
                                    child: InkWell(
                                      onTap: () { 
                                        provider.updateProgressEnergy(1.0);
                                      },
                                      child: _energy(0.86, 1.0, 'Peak', provider, Icons.rocket_launch_outlined, AppColor.neonGreen),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            SlideFadeIn(
                              delay: 1600,
                              child: SizedBox(
                                width: double.infinity,
                                child: Slider(
                                  value: provider.progressEnergy,
                                  min: 0,
                                  max: 1,
                                  divisions: 100, // 0% -> 100%
                                  label: '${(provider.progressEnergy * 100).round()}%',
                                  activeColor: AppColor.button_menu,
                                  inactiveColor: AppColor.button.withOpacity(0.2),
                                  onChanged: (double value) {
                                    provider.updateProgressEnergy(value);
                                  },
                                ),
                              ),
                            ),
                          ],
                        )
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            SlideFadeIn(
                              delay: 1700,
                              child: Row(
                                children: [
                                  Icon( Icons.air_outlined, color: AppColor.dodgerBlue, size: 15,),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Stress Level', 
                                        style: AppTextStyle.title14Bold.copyWith(color: AppColor.text2)
                                      )
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: Text('${(provider.progressStress * 100).round()}%',
                                      style: AppTextStyle.title20Bold.copyWith(color: AppColor.red1)
                                    )
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: SlideFadeIn(
                                    delay: 1800,
                                    child: InkWell(
                                      onTap: () { 
                                        provider.updateProgressStress(0.2);
                                      },
                                      child: _stress(0.06, 0.34, 'Calm', provider, Icons.wb_sunny_outlined, AppColor.button_menu),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),                                
                                Expanded(
                                  child: SlideFadeIn(
                                    delay: 1900,
                                    child: InkWell(
                                      onTap: () { 
                                        provider.updateProgressStress(0.4);
                                      },
                                      child: _stress(0.26, 0.54, 'Stress', provider, Icons.cloud_outlined, AppColor.dodgerBlue),  
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),                                
                                Expanded(
                                  child: SlideFadeIn(
                                    delay: 2000,
                                    child: InkWell(
                                      onTap: () { 
                                        provider.updateProgressStress(0.6);
                                      },
                                      child: _stress(0.46, 0.74, 'Moderate', provider, Icons.air_outlined, AppColor.gold),  
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),                                
                                Expanded(
                                  child: SlideFadeIn(
                                    delay: 2100,
                                    child: InkWell(
                                      onTap: () { 
                                        provider.updateProgressStress(0.8);
                                      },
                                      child: _stress(0.66, 0.94, 'Stressed', provider, Icons.cloudy_snowing, AppColor.material), 
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),                                
                                Expanded(
                                  child: SlideFadeIn(
                                    delay: 2200,
                                    child: InkWell(
                                      onTap: () { 
                                        provider.updateProgressStress(1.0);
                                      },
                                      child: _stress(0.86, 1.0, 'High', provider, Icons.local_fire_department_outlined, AppColor.red),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            SlideFadeIn(
                              delay: 2300,
                              child: SizedBox(
                                width: double.infinity,
                                child: Slider(
                                  value: provider.progressStress,
                                  min: 0,
                                  max: 1,
                                  divisions: 100, // 0% -> 100%
                                  label: '${(provider.progressStress * 100).round()}%',
                                  activeColor: AppColor.red1,
                                  inactiveColor: AppColor.button.withOpacity(0.2),
                                  onChanged: (double value) {
                                    provider.updateProgressStress(value);
                                  },
                                ),
                              ),
                            ),
                          ],
                        )
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            SlideFadeIn(
                              delay: 2400,
                              child: Row(
                                children: [
                                  Icon( Icons.note_alt_outlined, color: AppColor.text2, size: 15,),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Your thoughts (optional)', 
                                        style: AppTextStyle.title14Bold.copyWith(color: AppColor.text2)
                                      )
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            SlideFadeIn(
                              delay: 2500,
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: AppColor.background_menu,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: AppColor.BorderRadius,
                                    width: 2,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: TextField(
                                    maxLines: 5,
                                    style: AppTextStyle.title14Regular.copyWith(color: AppColor.text2),
                                    decoration: InputDecoration(
                                      hintText: 'What\'s on your mind today? Take a moment to reflect...',
                                      hintStyle: AppTextStyle.title14Regular.copyWith(color: AppColor.text1),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ),
                      const SizedBox(height: 25),
                      SlideFadeIn(
                        delay: 2600,
                        child: InkWell(
                          onTap: () async { 
                            _provider.setIsLoading();                          
                             await Future.delayed(const Duration(seconds: 5));
                            _showSuccessDialog(context, _provider);
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            width: double.infinity,
                            height: 56,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: _provider.isLoading
                                    ? [
                                        AppColor.button.withOpacity(0.7),
                                        AppColor.button.withOpacity(0.7),
                                      ]
                                    : [
                                        AppColor.button_menu,
                                        AppColor.neonGreen,
                                      ],
                              ),
                              borderRadius: BorderRadius.circular(28),
                            ),
                            child: Center(
                              child: _provider.isLoading
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        SizedBox(
                                          width: 18,
                                          height: 18,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          'Saving...',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Icon(Icons.check, color: Colors.white),
                                        SizedBox(width: 8),
                                        Text(
                                          'Save Check-in',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ],
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

Widget clickMood() {
  return Positioned(
    top: 0,
    right: 0,
    child: Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: AppColor.button_menu,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.check,
        color: AppColor.white,
        size: 16,
      ),
    ),
  );
}

Widget _mood(String clickItemName, DailyProvider provider, IconData iconData) {
  return SizedBox(
    width: double.infinity,
    child: BoxButton(
      status: 'mood',
      isClick: provider.moodStatus == clickItemName ? true : false,
      item: clickItemName,
      height: 90,
      containerIcon: Container(
        alignment: Alignment.center,
        child: Icon(iconData, size: 20, color: provider.moodStatus == clickItemName ? AppColor.white : AppColor.text1)),
      containerText: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const SizedBox(height: 5),
            Text(clickItemName, textAlign: TextAlign.center, maxLines: 2, softWrap: true, style: provider.moodStatus == clickItemName ? AppTextStyle.title14Regular.copyWith(color: AppColor.white) : AppTextStyle.title14Regular),
          ],
        ),
      ),
    ),
  );
}
Widget _energy(double start, double end, String clickItemName, DailyProvider provider, IconData iconData, Color color) {
  return BoxButton(
    status: 'Energy',
    isClick: (start <= provider.progressEnergy && provider.progressEnergy <= end)? true : false,
    height: 90,
    containerIcon: Container(
      alignment: Alignment.center,
      child: Icon(
        iconData, 
        size: 20, 
        color: (start <= provider.progressEnergy && provider.progressEnergy <= end) ? AppColor.button_menu : color)),
    containerText: Container(
      child: Column(
        children: [
          const SizedBox(height: 5),
          Text(clickItemName, style: AppTextStyle.title10Regular.copyWith(color: AppColor.text1)),
        ],
      ),
    ),
  );
}
Widget _stress(double start, double end, String clickItemName, DailyProvider provider, IconData iconData, Color color) {
  return BoxButton(
    status: 'Stress',
    isClick: (start <= provider.progressStress && provider.progressStress <= end)? true : false,
    height: 90,
    containerIcon: Container(
      alignment: Alignment.center,
      child: Icon(
        iconData, 
        size: 20, 
        color: (start <= provider.progressStress && provider.progressStress <= end) ? AppColor.red1 : color)),                              
    containerText: Container(
      child: Column(
        children: [
          const SizedBox(height: 5),
          Text(clickItemName, style: AppTextStyle.title10Regular.copyWith(color: AppColor.text1)),
        ],
      ),
    ),
  );
}

void _showSuccessDialog(BuildContext context, DailyProvider _provider) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 56,
            ),
            const SizedBox(height: 16),
            const Text(
              'Check-in saved successfully!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);                  
                  _provider.setIsLoading();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.button_menu,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('OK', style: AppTextStyle.title16Bold.copyWith(color: AppColor.white)),
              ),
            )
          ],
        ),
      );
    },
  );
}
