import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_flutter/utils/theme.dart';

var recommendedMusicDummyData = [
  RecommendedMusicData(
    "mock/topics/thumb1.svg",
    "Focus",
    "Meditation.3 - 10 MIN",
  ),
  RecommendedMusicData(
    "mock/topics/thumb2.svg",
    "Focus",
    "Meditation.3 - 10 MIN",
  ),
  RecommendedMusicData(
    "mock/topics/thumb3.svg",
    "Focus",
    "Meditation.3 - 10 MIN",
  ),
  RecommendedMusicData(
    "mock/topics/thumb4.svg",
    "Focus",
    "Meditation.3 - 10 MIN",
  ),
];

class RecommendedMusicData {
  final String image;
  final String title;
  final String subtext;

  RecommendedMusicData(this.image, this.title, this.subtext);
}


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 20),
                _HeaderLogo(),
                const SizedBox(
                  height: 20,
                ),
                _HeaderText(),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: _HomeCardWidget(
                          title: "Basics",
                          subtitle: "COURSE",
                          time: "3-10 MIN"),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: _HomeCardWidget(
                          title: "Basics",
                          subtitle: "COURSE",
                          time: "3-10 MIN"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                _PlayMusicCard(),
                SizedBox(height: 30,),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Recommended for your",
                    style: PrimaryFont.medium(22).copyWith(color: kColorDarkGrey),
                  ),
                ),

                SizedBox(height: 20,),

                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: recommendedMusicDummyData.map((e) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: _HomeRecommendedWidget(
                          title: e.title,
                          subtitle: e.subtext,
                          imagePath: e.image,
                        ),
                    );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HomeRecommendedWidget extends StatelessWidget {
  const _HomeRecommendedWidget({Key? key, required this.title, required this.subtitle, required this.imagePath}) : super(key: key);

  final String title;
  final String subtitle;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SvgPicture.asset(
                imagePath,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(title, style: PrimaryFont.medium(12).copyWith(color: kColorDarkGrey),),
          Text(subtitle, style: PrimaryFont.medium(10).copyWith(color: kColorLightGrey),),
        ],
      ),
    );
  }
}


class _PlayMusicCard extends StatelessWidget {
  const _PlayMusicCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage("assets/images/play_music_bg.png"),
          fit: BoxFit.cover
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Daily Thought",
                  style: PrimaryFont.medium(12).copyWith(color: Colors.white),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "MEDITATION * 3-10 MINS",
                  style: PrimaryFont.medium(8).copyWith(color: Colors.white),
                ),
              ],
            ),
            Icon(
              Icons.play_circle,
              color: Colors.white,
              size: 35,
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeCardWidget extends StatelessWidget {
  const _HomeCardWidget(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.time})
      : super(key: key);

  final String title;
  final String subtitle;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: kColorPrimary),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                height: 50,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SvgPicture.asset("mock/topics/thumb2.svg");
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style:
                    PrimaryFont.medium(14).copyWith(color: Colors.yellowAccent),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                subtitle,
                style: PrimaryFont.light(8).copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    time,
                    style: PrimaryFont.medium(8).copyWith(color: Colors.white),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: kColorLightGrey,
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "START",
                        style: PrimaryFont.light(12),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

class _HeaderLogo extends StatelessWidget {
  const _HeaderLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SvgPicture.asset("assets/images/logo2.svg");
        },
      ),
    );
  }
}

class _HeaderText extends StatelessWidget {
  const _HeaderText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Good Morning, Afsar",
            style: PrimaryFont.medium(22).copyWith(color: kColorDarkGrey),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "We wish you have a good day",
            style: PrimaryFont.light(18).copyWith(color: kColorLightGrey),
          ),
        ),
      ],
    );
  }
}
