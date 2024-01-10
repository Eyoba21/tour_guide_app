import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/cubits/app_cubit.dart';
import 'package:myapp/cubits/app_cubits_states.dart';
import 'package:myapp/model/user_model.dart';
import 'package:myapp/services/data_services.dart';
import 'package:myapp/view/widgets/big_text.dart';
import 'package:myapp/view/widgets/light_text.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  List images = [
    "balloning.png",
    "hiking.png",
    "kayaking.png",
    "snorkling.png",
  ];

  late List user = [];

  @override
  void initState() {
    getUser();
    super.initState();
  }

  Future<void> getUser() async {
    List futureData;
    futureData = await DataServices.getUserFromApi();
    print(futureData);
    setState(() {
      futureData = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<Appcubits, CubitStates>(
        builder: ((context, state) {
          if (state is LoadedState) {
            var data = state.places;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 70, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.menu, color: Colors.black54),
                      Container(
                        margin: const EdgeInsets.only(right: 20, top: 10),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                          //image: DecorationImage(image: NetworkImage(user[user.length][3])),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: BigText(
                    text: 'Discover',
                    color: AppColors.mainColor,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          height: 300,
                          child: ListView.builder(
                            itemCount: data.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () => {
                                  BlocProvider.of<Appcubits>(context)
                                      .goDetailPage(data[index])
                                },
                                child: CachedNetworkImage(
                                  imageUrl: data[index].image,
                                  imageBuilder: (context, imageProvider) =>
                                      Stack(
                                    children: [
                                      Positioned(
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              right: 20, top: 20),
                                          height: 300,
                                          width: 200,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: Colors.white,
                                              image: DecorationImage(
                                                  image: imageProvider,
                                                  //NetworkImage("${data[index].image}"),
                                                  //AssetImage('assets/mountain.jpeg'),
                                                  fit: BoxFit.cover)),
                                        ),
                                      ),
                                      Positioned(
                                        top: 250,
                                        left: 150,
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: const BoxDecoration(
                                            color: AppColors.mainColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                          ),
                                          child: const Icon(Icons.add,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  placeholder: (context, url) => Container(
                                    alignment: Alignment.center,
                                    child: const CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigText(
                        text: 'Explore more',
                        size: 22,
                      ),
                      LightText(
                        size: 14,
                        text: 'See more',
                        color: AppColors.textColor1,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 100,
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: const EdgeInsets.only(left: 50),
                          child: Column(
                            children: [
                              Container(
                                height: 70,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/' + images[index]),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              const SizedBox(height: 10),
                              LightText(text: 'Hiking', size: 14),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            );
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
