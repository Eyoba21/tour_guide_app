import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/cubits/app_cubit.dart';
import 'package:myapp/view/widgets/big_text.dart';
import 'package:myapp/view/widgets/custom_button.dart';
import 'package:myapp/view/widgets/light_text.dart';
import 'package:myapp/view/widgets/responsive_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../cubits/app_cubits_states.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int gottenStars = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<Appcubits, CubitStates>(
      builder: (context, state) {
        if (state is DetailState) {
          DetailState detail = state as DetailState;
          return Container(
            margin: EdgeInsets.zero,
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  child: SingleChildScrollView(
                    child: CachedNetworkImage(
                      imageUrl: detail.places.image,
                      imageBuilder: (context, imageProvider) => 
                       Container(
                        width: double.infinity,
                        height: 300,
                        decoration:  BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 30,
                  child: IconButton(
                    onPressed: () {
                      BlocProvider.of<Appcubits>(context).goHome();
                    },
                    icon: const Icon(Icons.arrow_back, size: 30,),
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  top: 250,
                  child: Container(
                    height: 500,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 30, left: 25, right: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: BigText(
                                  text: detail.places.name,
                                  size: 20,
                                  color: Colors.black54.withOpacity(0.9),
                                ),
                              ),
                              LightText(
                                text: detail.places.price,
                                color: AppColors.mainColor,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: Row(
                            children: [
                              const Icon(Icons.location_on_outlined),
                              LightText(
                                text: detail.places.location,
                                size: 14,
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 5),
                              child: Wrap(
                                children: List.generate(
                                  5,
                                  (index) {
                                    return Icon(
                                      Icons.star,
                                      color: index < gottenStars
                                          ? AppColors.starColor
                                          : AppColors.textColor2,
                                    );
                                  },
                                ),
                              ),
                            ),
                            LightText(
                              text: '(4.0)',
                              size: 14,
                              color: AppColors.textColor2,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: BigText(
                            text: "People",
                            size: 20,
                            color: Colors.black54.withOpacity(0.8),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: LightText(
                            text: 'Number of people in your group',
                            size: 14,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Wrap(
                            children: List.generate(5, (index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: CustomButton(
                                  bgColor: AppColors.buttonBackground,
                                  borderColor: index == selectedIndex
                                      ? AppColors.black
                                      : AppColors.buttonBackground,
                                  size: 60,
                                  color: AppColors.buttonBackground,
                                  text: (index + 1).toString(),
                                ),
                              );
                            }),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: BigText(
                            text: 'Discription',
                            size: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: LightText(
                            text: detail.places.description,
                            size: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: 15,
                    left: 20,
                    right: 30,
                    child: Row(
                      children: [
                        CustomButton(
                          bgColor: AppColors.white,
                          borderColor: AppColors.buttonBackground,
                          size: 60,
                          color: AppColors.buttonBackground,
                          isIcon: true,
                          icon: Icons.favorite_border,
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        ResponsiveButton(
                          isResponsive: true,
                        )
                      ],
                    ))
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    ));
  }
}
