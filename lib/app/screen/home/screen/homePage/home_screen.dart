// ignore_for_file: unused_field, avoid_unnecessary_containers, deprecated_member_use, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shapeecloud_flutter_app/app/screen/home/provider/home_provider.dart';
import 'package:shapeecloud_flutter_app/app/utils/SlideFadeIn.dart';
import 'package:shapeecloud_flutter_app/app/screen/home/widget/boxbutton.dart';
import 'package:shapeecloud_flutter_app/app/utils/app_color.dart';
import 'package:shapeecloud_flutter_app/app/utils/app_img.dart';
import 'package:shapeecloud_flutter_app/app/utils/app_navigator.dart';
import 'package:shapeecloud_flutter_app/app/utils/app_textStyle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeProvider _provider = HomeProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
      create: (_) => _provider,
      child: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            backgroundColor: AppColor.background,
            body: SafeArea(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    /// HEADER
                    SlideFadeIn(
                      delay: 0,
                      child: SizedBox(
                        width: double.infinity,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Good Afternoon',
                                style: AppTextStyle.title30Bold),
                            Text('How are you feeling today?',
                                style: AppTextStyle.title16Regular),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 50),

                    /// MOOD BOXES
                    SlideFadeIn(
                      delay: 100,
                      child: Row(
                        children: [
                          Expanded(
                            child: BoxButton(
                              height: 100,
                              containerIcon: Icon(
                                Icons.favorite_border_outlined,
                                size: 40,
                                color: AppColor.purple,
                              ),
                              containerText: Column(
                                children: [
                                  Text('Happy',
                                      style: AppTextStyle.title20Regular),
                                  Text('Positive',
                                      style: AppTextStyle.title12Regular),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: BoxButton(
                              height: 100,
                              containerIcon: Icon(
                                Icons.flash_on_outlined,
                                size: 40,
                                color: AppColor.purple,
                              ),
                              containerText: Column(
                                children: [
                                  Text('75%',
                                      style: AppTextStyle.title20Regular),
                                  Text('Good',
                                      style: AppTextStyle.title12Regular),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: BoxButton(
                              height: 100,
                              containerIcon: Icon(
                                Icons.trending_up_outlined,
                                size: 40,
                                color: AppColor.purple,
                              ),
                              containerText: Column(
                                children: [
                                  Text('7d',
                                      style: AppTextStyle.title20Regular),
                                  Text('Keep going!',
                                      style: AppTextStyle.title12Regular),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// DAILY CHECK-IN
                    SlideFadeIn(
                      delay: 200,
                      child: InkWell(
                        onTap: () =>
                            Navigators.navigateToDailyCheckIn(context),
                        child: Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFF7CB342).withOpacity(0.2),
                                const Color(0xFF9CCC65).withOpacity(0.2),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: AppColor.BorderRadius, width: 2),
                          ),
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Daily Check-in',
                                            style:
                                                AppTextStyle.title20Bold),
                                        const SizedBox(height: 10),
                                        Text('Share how you\'re feeling',
                                            style: AppTextStyle
                                                .title14Bold
                                                .copyWith(
                                                    color:
                                                        AppColor.text2)),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      width: 65,
                                      height: 65,
                                      child: AssetImages.iconAdd,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  const Icon(Icons.calendar_today_outlined,
                                      size: 18, color: AppColor.text1,),
                                  const SizedBox(width: 5),
                                  Text(provider.formatLastLogged(),
                                      style: AppTextStyle.title14Regular.copyWith(color: AppColor.text1)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// QUICK ACTIONS
                    SlideFadeIn(
                      delay: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Quick Actions',
                              style: AppTextStyle.title20Bold),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () => Navigators.navigateToDailyCheckIn(context),
                                  child: BoxButton(
                                    height: 140,
                                    containerIcon:
                                        AssetImages.iconSmile,
                                    containerText: const Text('Log Mood',
                                        style:
                                            AppTextStyle.title12Regular),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: InkWell(
                                  onTap: () => Navigators.navigateToBottomNavigation(context, 2),
                                  child: BoxButton(
                                    height: 140,
                                    containerIcon:
                                        AssetImages.iconChat,
                                    containerText: const Text(
                                        'Talk to Kiara',
                                        style:
                                            AppTextStyle.title12Regular),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: InkWell(
                                  onTap: () => Navigators.navigateToBottomNavigation(context, 3),
                                  child: BoxButton(
                                    height: 140,
                                    containerIcon:
                                        AssetImages.iconMusic,
                                    containerText: const Text(
                                        'Browse Frequencies',
                                        style:
                                            AppTextStyle.title12Regular),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// TODAY INSIGHT
                    SlideFadeIn(
                      delay: 400,
                      child: Container( padding: const EdgeInsets.all(16), width: double.infinity, height: 224, decoration: BoxDecoration( gradient: LinearGradient( begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [ Color(0xFF2B7FFF).withOpacity(0.3), Color(0xFF00BBA7).withOpacity(0.3), ], stops: [0.0, 1.0], ), borderRadius: BorderRadius.circular(16), border: Border.all( color: AppColor.BorderRadius, width: 2, ), ), child: Column( mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [ Row( children: [ SizedBox( child: AssetImages.iconUp, ), const SizedBox(width: 10), Expanded( child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ Text('Today\'s Insight', style: AppTextStyle.title18Bold), const SizedBox(height: 5), Text('Your mood has been consistently positive this week! You\'re doing great. Consider maintaining your current routine.', softWrap: true, style: AppTextStyle.title14Regular.copyWith(color: AppColor.text2)), ], ), ) ], ), const SizedBox(height: 20), Container( width: double.infinity, height: 40, decoration: BoxDecoration( color: AppColor.button, borderRadius: BorderRadius.circular(16), border: Border.all( color: AppColor.BorderRadius, width: 2, ), ), child: Center(child: Text('View Full Insights', style: AppTextStyle.title14Bold)), ), ], ) )), 
                    const SizedBox(height: 30),
                    Container( 
                      width: double.infinity, 
                      child: Column( 
                        crossAxisAlignment: CrossAxisAlignment.start, 
                        children: [ SlideFadeIn(
                          delay: 500,
                          child: Text('Recent Activity', 
                          style: AppTextStyle.title20Bold),
                        ), 
                        const SizedBox(height: 20), 
                        SlideFadeIn(
                          delay: 600,
                          child: Container( 
                            width: double.infinity, 
                            height: 90, 
                            decoration: BoxDecoration( 
                              gradient: LinearGradient( 
                                begin: Alignment.topLeft, 
                                end: Alignment.bottomRight, 
                                colors: [ Color(0xFFFE9A00).withOpacity(0.2), Color(0xFFFF6900).withOpacity(0.2), ], stops: [0.0, 1.0], 
                              ), 
                              borderRadius: BorderRadius.circular(16), 
                              border: Border.all( color: AppColor.BorderRadius, width: 2, ), 
                            ), 
                            child: Padding( 
                              padding: const EdgeInsets.all(16.0), 
                              child: Row( 
                                children: [ 
                                  Expanded( 
                                    child: Column( 
                                      crossAxisAlignment: CrossAxisAlignment.start, 
                                      children: [ 
                                        Text('Morning Clarity', style: AppTextStyle.title16Bold), 
                                        const SizedBox(height: 5), 
                                        Text('Frequency',  style: AppTextStyle.title12Regular.copyWith(color: AppColor.text1) ), 
                                      ], 
                                    ), 
                                  ), 
                                  Text("2 hours ago", style: AppTextStyle.title12Regular.copyWith(color: AppColor.text1), textAlign: TextAlign.end), 
                                ], 
                              ),
                            ), 
                          ),
                        ), 
                        const SizedBox(height: 15),
                        SlideFadeIn(
                          delay: 700,
                          child: Container( 
                            width: double.infinity, 
                            height: 90, 
                            decoration: BoxDecoration( 
                              gradient: LinearGradient( 
                                begin: Alignment.topLeft, 
                                end: Alignment.bottomRight, 
                                colors: [ Color(0xFF2B7FFF).withOpacity(0.2), Color(0xFFAD46FF).withOpacity(0.2), ], 
                                stops: [0.0, 1.0], 
                              ), 
                              borderRadius: BorderRadius.circular(16), 
                              border: Border.all( color: AppColor.BorderRadius, width: 2, ), 
                            ), 
                            child: Padding( 
                              padding: const EdgeInsets.all(16.0), 
                              child: Row( 
                                children: [ 
                                  Expanded( 
                                    child: Column( 
                                      crossAxisAlignment: CrossAxisAlignment.start, 
                                      children: [ 
                                        Text('Chat with Kiara', style: AppTextStyle.title16Bold), 
                                        const SizedBox(height: 5), 
                                        Text('AI Session', style: AppTextStyle.title12Regular.copyWith(color: AppColor.text1)), 
                                      ],
                                    ), 
                                  ), 
                                Text("5 hours ago", style: AppTextStyle.title12Regular.copyWith(color: AppColor.text1), textAlign: TextAlign.end), 
                              ], 
                            ), 
                          ), 
                        )
                      ) 
                    ], 
                  ), 
                )  
              ], 
            ), 
          ), 
        ), 
      ); 
    }, 
  ), 
); } }