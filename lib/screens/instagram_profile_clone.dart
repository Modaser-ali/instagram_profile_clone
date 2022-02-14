import 'package:flutter/material.dart';
import 'package:uis_project/app_theme.dart';

class InstagramProfileClone extends StatelessWidget {
  InstagramProfileClone({Key? key}) : super(key: key);

  final List<String> _userStories = ["A", "B"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: ListView(
            children: [
              _userInfoCard(context),
              InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                      top: 15, left: 15, right: 15, bottom: 7),
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: Text(
                    "Edit Profile",
                    style: appTheme().textTheme.headline2,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              _userStoriesList(),
              const Divider(
                height: 0,
              ),
              _userPosts(context),
            ],
          ),
          bottomNavigationBar: _bottomNavigationBar(),
        ),
      ),
    );
  }

  Widget _userInfoCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Text(
                "your_name",
                style: appTheme().textTheme.headline1,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [
                          Color(0xFFff9e00),
                          Color(0xFFdb222a),
                          Color(0xFF6d23b6),
                        ],
                      ).createShader(bounds),
                      child: const CircleAvatar(
                        maxRadius: 52,
                      ),
                    ),
                    const CircleAvatar(
                      maxRadius: 50,
                      child: CircleAvatar(
                        maxRadius: 48,
                        foregroundImage: AssetImage("assets/images/user.png"),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "your_name",
                style: appTheme().textTheme.headline1!.copyWith(fontSize: 17),
              ),
            ],
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.62,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _communityData(92, "Posts"),
                        _communityData(840, "Followers"),
                        _communityData(607, "Following"),
                      ],
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  Widget _communityData(int number, String title) {
    return Column(
      children: [
        Text(
          "$number",
          style: appTheme().textTheme.headline1!.copyWith(fontSize: 16),
        ),
        Text(
          title,
          style: appTheme()
              .textTheme
              .headline1!
              .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
        )
      ],
    );
  }

  Widget _userStoriesList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        // scrollDirection: Axis.horizontal,
        // shrinkWrap: true,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: 60,
                  width: 60,
                  child: const Icon(
                    Icons.add,
                    size: 35,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black26),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
                child: Text(
                  "New",
                  style: appTheme().textTheme.headline2,
                ),
              )
            ],
          ),
          ...[
            for (var story in _userStories)
              Padding(
                padding: const EdgeInsets.only(left: 7.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                        child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      maxRadius: 30,
                      child: CircleAvatar(
                        radius: 29,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 28,
                          child: Text(
                            story,
                            style: appTheme()
                                .textTheme
                                .headline1!
                                .copyWith(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                    )),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8, bottom: 8, left: 8),
                      child: Text(
                        "Title Here",
                        style: appTheme().textTheme.headline2,
                      ),
                    )
                  ],
                ),
              ),
          ]
        ],
      ),
    );
  }

  Widget _userPosts(BuildContext context) {
    return Column(
      children: [
        const TabBar(
          padding: EdgeInsets.zero,
          tabs: [
            Tab(
              icon: Icon(
                Icons.apps_outlined,
                size: 27,
                //   color: Colors.grey,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.person_pin_outlined,
                size: 27,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: TabBarView(
            children: [
              GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  for (var i = 0; i < 15; i++)
                    Container(
                      padding: const EdgeInsets.all(30),
                      margin: const EdgeInsets.all(2),
                      color: Colors.grey,
                      child: Image.asset("assets/images/image.png"),
                    )
                ],
              ),
              const Text("page2"),
            ],
          ),
        ),
      ],
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        const BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 30,
              color: Colors.black,
            ),
            label: ""),
        const BottomNavigationBarItem(
            icon: Icon(
              Icons.search_sharp,
              size: 30,
              color: Colors.black,
            ),
            label: ""),
        const BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box_outlined,
              size: 30,
              color: Colors.black,
            ),
            label: ""),
        const BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_outline,
              size: 30,
              color: Colors.black,
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: Stack(
              alignment: Alignment.center,
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [
                      Color(0xFFff9e00),
                      Color(0xFFdb222a),
                      Color(0xFF6d23b6),
                    ],
                  ).createShader(bounds),
                  child: const CircleAvatar(
                    maxRadius: 15,
                  ),
                ),
                const CircleAvatar(
                  maxRadius: 14,
                  child: CircleAvatar(
                    maxRadius: 12,
                    foregroundImage: AssetImage("assets/images/user.png"),
                  ),
                ),
              ],
            ),
            label: ""),
      ],
    );
  }
}
