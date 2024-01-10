import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/cubits/app_cubit.dart';
import 'package:myapp/services/data_services.dart';
import 'package:myapp/view/widgets/big_text.dart';
import 'package:myapp/view/widgets/light_text.dart';
import 'package:myapp/view/widgets/responsive_button.dart';

class WelcomScreen extends StatefulWidget {
  const WelcomScreen({super.key});

  @override
  State<WelcomScreen> createState() => _WelcomScreenState();
}

class _WelcomScreenState extends State<WelcomScreen> {
  DataServices data = DataServices();
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];
  List qoutes = [
    'Discover the Enchanting Wonders of Ethiopia!',
    " Rich History and Cultural Heritage",
    'Unique Wildlife and Flora',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    // ignore: prefer_interpolation_to_compose_strings
                    image: AssetImage("assets/" + images[index]),
                    fit: BoxFit.cover),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(text: 'Trip'),
                          LightText(text: 'Ethiopia'),
                          const SizedBox(
                            height: 20,
                          ),
                          LightText(
                            text: qoutes[index],
                            color: AppColors.textColor2,
                            size: 14,
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          GestureDetector(
                            onTap: () => BlocProvider.of<Appcubits>(context).getData(),
                            child: Container(
                              margin: EdgeInsets.zero,
                              child: Row(
                                children: [
                                  ResponsiveButton(
                                    width: 100,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: List.generate(3, (indexForDots) {
                        return Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: index == indexForDots ? 25 : 10,
                          width: 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: index == indexForDots
                                ? AppColors.mainColor
                                : AppColors.mainColor.withOpacity(0.3),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
