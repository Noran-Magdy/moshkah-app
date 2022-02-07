import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart' as Kiwi;
import 'package:moshkah_app/blocs/home_bloc/bloc.dart';
import 'package:moshkah_app/blocs/home_bloc/events.dart';
import 'package:moshkah_app/blocs/home_bloc/states.dart';
import 'package:moshkah_app/models/home_model/home_model.dart';
import 'package:moshkah_app/screens/single_path_screen/single_path_screen.dart';
import 'package:moshkah_app/shared/constant/colors.dart';
import 'package:moshkah_app/shared/constant/sized_config.dart';
import 'package:moshkah_app/shared/constant/variables.dart';

class BuildRowHeader extends StatefulWidget {
  const BuildRowHeader({Key key}) : super(key: key);

  @override
  _BuildRowHeaderState createState() => _BuildRowHeaderState();
}

class _BuildRowHeaderState extends State<BuildRowHeader> {
  int count = 0;
  HomeBloc homeBloc = Kiwi.KiwiContainer().resolve<HomeBloc>();

  HomeModel homeModel = HomeModel();

  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeEventStart());
  }

  @override
  void dispose() {
    homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(13),
          ),
          child: Container(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: whiteColor,
                width: 2.5,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      count = 0;
                    });
                    print('common');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: count == 0 ? whiteColor : Colors.transparent,
                      borderRadius: BorderRadius.circular(
                        getProportionateScreenWidth(15),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(18),
                    ),
                    child: Text(
                      'Common',
                      style: TextStyle(
                        fontSize: 20,
                        color: count == 0
                            ? greenColor
                            : blueColor.withOpacity(0.8),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      count = 1;
                    });
                    print('Courses');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: count == 1 ? whiteColor : Colors.transparent,
                      borderRadius: BorderRadius.circular(
                        getProportionateScreenWidth(15),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(18),
                    ),
                    child: Text(
                      'Courses',
                      style: TextStyle(
                        fontSize: 20,
                        color: count == 1
                            ? greenColor
                            : blueColor.withOpacity(0.8),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      count = 2;
                    });
                    print('Paths');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: count == 2 ? whiteColor : Colors.transparent,
                      borderRadius: BorderRadius.circular(
                        getProportionateScreenWidth(15),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(18),
                    ),
                    child: Text(
                      'Paths',
                      style: TextStyle(
                        fontSize: 20,
                        color: count == 2
                            ? greenColor
                            : blueColor.withOpacity(0.8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        Row(
          children: [
            Expanded(
              child: Divider(
                color: whiteColor,
                endIndent: 5,
                indent: 5,
                thickness: 1.5,
              ),
            ),
            Text(
              'Lastes',
              style: TextStyle(
                color: greenColor.withOpacity(0.6),
              ),
            ),
            Expanded(
              child: Divider(
                color: whiteColor,
                endIndent: 5,
                indent: 5,
                thickness: 1.5,
              ),
            ),
          ],
        ),
        BlocBuilder(
          cubit: homeBloc,
          builder: (context, state) {
            if (state is HomeStateSuccess) {
              return SizedBox(
                height: getProportionateScreenHeight(590),
                child: ListView.separated(
                  shrinkWrap: false,
                  physics: BouncingScrollPhysics(),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  itemBuilder: (context, index) {
                    return Container(
                      // height: 100,
                      margin: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(13),
                      ),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: whiteColor,
                          width: 2.5,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(15),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    count == 0
                                        ? state
                                            .homeModel.commonCourses[index].name
                                        : count == 1
                                            ? state.homeModel
                                                .latestCourses[index].name
                                            : state.homeModel.latestPaths[index]
                                                .name,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                    ),
                                    overflow: TextOverflow.fade,
                                  ),
                                ),
                                Spacer(),
                                Text.rich(
                                  TextSpan(
                                    text: count == 0
                                        ? state.homeModel.commonCourses[index]
                                                .publishDate
                                                .toString()
                                                .split(' ')[0] +
                                            '\n'
                                        : count == 1
                                            ? state
                                                    .homeModel
                                                    .latestCourses[index]
                                                    .publishDate
                                                    .toString()
                                                    .split(' ')[0] +
                                                '\n'
                                            : state.homeModel.latestPaths[index]
                                                    .publishDate
                                                    .toString()
                                                    .split(' ')[0] +
                                                '\n',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                    ),
                                    children: [
                                      TextSpan(
                                        text: count == 0
                                            ? state
                                                    .homeModel
                                                    .commonCourses[index]
                                                    .publishDate
                                                    .toString()
                                                    .split(' ')[1]
                                                    .split('.')[0] +
                                                '\n'
                                            : count == 1
                                                ? state
                                                        .homeModel
                                                        .latestCourses[index]
                                                        .publishDate
                                                        .toString()
                                                        .split(' ')[1]
                                                        .split('.')[0] +
                                                    '\n'
                                                : state
                                                        .homeModel
                                                        .latestPaths[index]
                                                        .publishDate
                                                        .toString()
                                                        .split(' ')[1]
                                                        .split('.')[0] +
                                                    '\n',
                                        style: TextStyle(
                                          height: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: whiteColor,
                            thickness: 2,
                            endIndent: 0,
                            indent: 0,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(10),
                              vertical: getProportionateScreenHeight(5),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  foregroundImage: NetworkImage(
                                    count == 0
                                        ? state.homeModel.commonCourses[index]
                                            .imgFullLink
                                        : count == 1
                                            ? state
                                                .homeModel
                                                .latestCourses[index]
                                                .imgFullLink
                                            : 'https://i.pinimg.com/564x/8f/dc/03/8fdc037a3a2e880fafeb164a314395ec.jpg',
                                  ),
                                  radius: 45,
                                  backgroundColor: Colors.transparent,
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(12),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      count == 2 &&
                                              state.homeModel.latestPaths[index]
                                                      .description !=
                                                  ''
                                          ? state.homeModel.latestPaths[index]
                                              .description
                                          : 'Describtion of course',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                    SizedBox(
                                      height: getProportionateScreenHeight(3),
                                    ),
                                    if (count == 0)
                                      Text(
                                        state.homeModel.commonCourses[index]
                                                    .viewContent ==
                                                'true'
                                            ? 'Free'
                                            : '\$' +
                                                '${state.homeModel.commonCourses[index].cost}',
                                        style: TextStyle(
                                          color: state
                                                      .homeModel
                                                      .commonCourses[index]
                                                      .viewContent ==
                                                  'true'
                                              ? greenColor
                                              : pinkColor,
                                          fontSize: 16,
                                        ),
                                      ),
                                    if (count == 1)
                                      Text(
                                        state.homeModel.latestCourses[index]
                                                    .viewContent ==
                                                'true'
                                            ? 'Free'
                                            : '\$' +
                                                '${state.homeModel.commonCourses[index].cost}',
                                        style: TextStyle(
                                          color: state
                                                      .homeModel
                                                      .latestCourses[index]
                                                      .viewContent ==
                                                  'true'
                                              ? greenColor
                                              : pinkColor,
                                          fontSize: 16,
                                        ),
                                      ),
                                    if (count == 2)
                                      Text(
                                        state.homeModel.latestPaths[index].cost
                                                    .toString() !=
                                                'null'
                                            ? '${state.homeModel.latestPaths[index].cost}'
                                            : 'Free',
                                        style: TextStyle(
                                          color: state.homeModel
                                                      .latestPaths[index].cost
                                                      .toString() !=
                                                  'null'
                                              ? pinkColor
                                              : greenColor,
                                          fontSize: 16,
                                        ),
                                      ),
                                  ],
                                ),
                                Spacer(),
                                IconButton(
                                  icon: Icon(Icons.arrow_forward_ios_rounded),
                                  onPressed: () {
                                    if (count == 2) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              SinglePathScreen(),
                                        ),
                                      );
                                      pathId =
                                          state.homeModel.latestPaths[index].id;
                                      print(state
                                          .homeModel.latestPaths[index].id);
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: getProportionateScreenHeight(10),
                    );
                  },
                  itemCount: count == 0
                      ? state.homeModel.commonCourses.length
                      : count == 1
                          ? state.homeModel.latestCourses.length
                          : state.homeModel.latestPaths.length,
                ),
              );
            } else {
              return Text(
                'Connecting to the server',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
