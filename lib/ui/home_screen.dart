import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_id_homepage/bloc/food_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FoodBloc>(context).add(const GetFoodEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            headerSection(),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 150,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepOrangeAccent),
            ),
            const SizedBox(
              height: 30,
            ),
            specialFoodsSection(),
            const SizedBox(
              height: 30,
            ),
            cariInspirasiSection()
          ],
        ),
      ),
    );
  }

  Padding cariInspirasiSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Cari inspirasi belanja",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<FoodBloc, FoodState>(
            builder: (context, state) {
              if (state is FoodSuccess) {
                return Row(
                  children: [
                    Column(
                      children: [
                        Stack(children: [
                          Container(
                            height: 120,
                            width: 110,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      state.foodResponse!.data![1].media!),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.deepOrangeAccent),
                          ),
                          const Positioned(
                              bottom: 10,
                              left: 10,
                              child: Text(
                                "Makanan Kaleng",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ))
                        ]),
                        const SizedBox(
                          height: 10,
                        ),
                        Stack(children: [
                          Container(
                            height: 120,
                            width: 110,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      state.foodResponse!.data![1].media!),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.deepOrangeAccent),
                          ),
                          const Positioned(
                              bottom: 10,
                              left: 10,
                              child: Text(
                                "Aneka Saos",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ))
                        ]),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Stack(children: [
                      Container(
                        height: 250,
                        width: 210,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  state.foodResponse!.data![3].media!),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.deepOrangeAccent),
                      ),
                      const Positioned(
                          bottom: 10,
                          left: 10,
                          child: Text(
                            "Lagi Trending",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ))
                    ]),
                  ],
                );
              }
              return Container();
            },
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Padding specialFoodsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Special di FOOD.ID",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<FoodBloc, FoodState>(
            builder: (context, state) {
              if (state is FoodSuccess) {
                return Row(
                  children: [
                    Container(
                      height: 100,
                      width: 160,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                state.foodResponse!.data![0].media!),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.deepOrangeAccent),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 100,
                      width: 160,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                state.foodResponse!.data![1].media!),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.deepOrangeAccent),
                    ),
                  ],
                );
              }
              return Container();
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                height: 100,
                width: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orangeAccent),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 100,
                width: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.deepOrangeAccent),
              ),
            ],
          )
        ],
      ),
    );
  }

  Column headerSection() {
    return Column(
      children: [
        Container(
          height: 220,
          width: double.infinity,
          color: Colors.green,
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
            child: Column(
              children: [
                BlocBuilder<FoodBloc, FoodState>(
                  builder: (context, state) {
                    if (state is FoodSuccess) {
                      return headerLogo();
                    }
                    return const Text("Dummy");
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.place_outlined,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    RichText(
                      text: const TextSpan(
                        text: 'Dikirim ke ',
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Jakarta Selatan',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                searchField(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container searchField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: const [
            Icon(
              Icons.search,
              color: Colors.black45,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Mau belanja makanan apa?",
              style: TextStyle(color: Colors.black45),
            )
          ],
        ),
      ),
    );
  }

  Row headerLogo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'assets/images/logo.png',
          width: 200,
        ),
        const Icon(
          Icons.chat,
          color: Colors.white,
        )
      ],
    );
  }
}
