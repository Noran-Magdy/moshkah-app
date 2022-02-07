import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart' as Kiwi;
import 'package:moshkah_app/blocs/single_path_bloc/bloc.dart';
import 'package:moshkah_app/blocs/single_path_bloc/events.dart';
import 'package:moshkah_app/blocs/single_path_bloc/states.dart';
import 'package:moshkah_app/modules/singe_path_screen/submit_button.dart';
import 'package:moshkah_app/shared/constant/colors.dart';
import 'package:moshkah_app/shared/constant/sized_config.dart';

class SinglePathBody extends StatefulWidget {
  const SinglePathBody({Key key}) : super(key: key);

  @override
  _SinglePathBodyState createState() => _SinglePathBodyState();
}

class _SinglePathBodyState extends State<SinglePathBody> {
  SinglePathBloc singlePathBloc =
      Kiwi.KiwiContainer().resolve<SinglePathBloc>();

  //SinglePathCollectData collectData;

  @override
  void initState() {
    super.initState();
    // collectData.id.text = 1.toString();
    //print('dfghjgvbhjnl;' + collectData.id.text);
    singlePathBloc.add(SinglePathEventStart());
  }

  @override
  void dispose() {
    singlePathBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizedConfig.screenHeight,
      width: SizedConfig.screenWidth,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: BlocBuilder(
        cubit: singlePathBloc,
        builder: (context, state) {
          if (state is SinglePathStateSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: ListView.builder(
                          clipBehavior: Clip.none,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: getProportionateScreenHeight(55),
                                ),
                                CircleAvatar(
                                  foregroundImage: NetworkImage(
                                    'https://i.pinimg.com/564x/8f/dc/03/8fdc037a3a2e880fafeb164a314395ec.jpg',
                                  ),
                                  radius: 55,
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(10),
                                ),
                                Text(
                                  state.singlePathModel.pathName,
                                  style: TextStyle(
                                    color: whiteColor,
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            );
                          },
                          itemCount: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(10),
                          vertical: getProportionateScreenHeight(30),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                                icon: Icon(Icons.arrow_back_ios),
                                color: whiteColor,
                                iconSize: 20,
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                            Spacer(),
                            IconButton(
                                icon: Icon(Icons.person),
                                color: whiteColor,
                                iconSize: 30,
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 260,
                        right: 30,
                        left: 30,
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          height: 80,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: babyBlueColor,
                                offset: Offset(5, -2),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              '${state.singlePathModel.coursesCount}  Courses you\'re enrolled in',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizedConfig.screenHeight * 0.1,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(15),
                  ),
                  child: Text(
                    'Courses',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(15),
                    ),
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                            child: Row(
                              children: [
                                Image(
                                  image: NetworkImage(
                                    state.singlePathModel.courseList[index]
                                        .imgFullLink,
                                  ),
                                  width: 140,
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(10),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.singlePathModel.courseList[index]
                                          .name,
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      state.singlePathModel.courseList[index]
                                              .lessonCount
                                              .toString() +
                                          ' Lessons || ' +
                                          state.singlePathModel
                                              .courseList[index].timeCount
                                              .toString() +
                                          ' hours',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: getProportionateScreenHeight(15),
                      );
                    },
                    itemCount: state.singlePathModel.courseList.length,
                  ),
                ),
                SizedBox(
                  height: SizedConfig.screenHeight * 0.02,
                ),
                SubmitButton(),
                SizedBox(
                  height: SizedConfig.screenHeight * 0.01,
                ),
              ],
            );
          } else {
            return Align(
              child: Text(
                'Connecting to the server',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                ),
              ),
              alignment: Alignment.bottomCenter,
            );
          }
        },
      ),
    );
  }
}
