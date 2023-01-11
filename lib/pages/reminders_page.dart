import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:test_flutter/utils/theme.dart';

class RemindersPage extends StatefulWidget {
  const RemindersPage({Key? key}) : super(key: key);

  @override
  State<RemindersPage> createState() => _RemindersPageState();
}

class _RemindersPageState extends State<RemindersPage> {
  DateTime _dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "What time would you\n like to meditate?",
                  style: PrimaryFont.medium(24),
                ),
                const SizedBox(height: 15,),
                Text(
                    "Any time you can choose but We recommend\nfirst thing in th morning.",
                    style: PrimaryFont.light(16)
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kColorLightGrey
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TimePickerSpinner(
                        spacing: 50,
                        minutesInterval: 15,
                        onTimeChange: (time) {
                          setState(() {
                            _dateTime = time;
                          });
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 40,),
                Text("Which day would you\nlike to meditate?",
                    style: PrimaryFont.medium(24)),
                const SizedBox(
                  height: 15,
                ),
                Text(
                    "Everyday is best, but we recommend pickingat\nleast five.",
                    style: PrimaryFont.light(16)),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 70,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      _Day(dayName: "SU",),
                      _Day(dayName: "M",),
                      _Day(dayName: "T",),
                      _Day(dayName: "W",),
                      _Day(dayName: "TH",),
                      _Day(dayName: "F",),
                      _Day(dayName: "S",),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  height: 64,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: kColorPrimary,
                    borderRadius: BorderRadius.circular(38)
                  ),
                  child: Center(
                    child: Text(
                      "SAVE",
                      style: PrimaryFont.medium(18).copyWith(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "NO THANKS",
                      style: PrimaryFont.medium(18).copyWith(color: kColorDarkGrey),
                    ),
                  ),
                ),
                const SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Day extends StatelessWidget {
  const _Day({Key? key, required this.dayName}) : super(key: key);

  final String dayName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
           border: Border.all(
             color: const Color(0xffa1a4b2)
           )
        ),
        child: Center(
          child: Text(
            dayName,
            style: PrimaryFont.medium(14),
          ),
        ),
      ),
    );
  }
}

