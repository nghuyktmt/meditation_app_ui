import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_flutter/utils/theme.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

final Widget logoIcon = SvgPicture.asset('assets/images/logo.svg',
    semanticsLabel: 'A red up arrow');
final Widget welcomeImage = SvgPicture.asset('assets/images/welcome.svg',
    semanticsLabel: 'A red up arrow');

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff8589eb),
      body: SafeArea(
        child: Stack(
          children: [
            const StartedBackGround(),
            const FractionallySizedBox(
              heightFactor: 0.35,
              child: StartedHeader(),
            ),
            Align(
              alignment: const Alignment(0.0, 0.8),
              child: StartedButton(
                fixedSize: MaterialStateProperty.all(Size(
                    context.screenSize.width * 0.9,
                    context.screenSize.height * 0.065)),
                textStyle: MaterialStateProperty.all(
                    PrimaryFont.medium(context.screenSize.height * 0.02)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StartedButton extends StatelessWidget {
  const StartedButton({Key? key, this.fixedSize, this.textStyle})
      : super(key: key);

  final MaterialStateProperty<Size>? fixedSize;
  final MaterialStateProperty<TextStyle>? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {},
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kColorLightGrey),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(38))),
          elevation: MaterialStateProperty.all(0),
          fixedSize: fixedSize,
          textStyle: textStyle),
      child: const Text(
        "GET STARTED",
        style: TextStyle(color: kColorPrimary),
      ),
    );
  }
}

class StartedHeader extends StatelessWidget {
  const StartedHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 2,
          fit: FlexFit.tight,
          child: SvgPicture.asset(
            'assets/images/logo.svg',
            alignment: const Alignment(0.0, -0.8),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: FittedBox(
            child: RichText(
              text: const TextSpan(children: [
                TextSpan(
                  text: "Hi Afsar, Welcome",
                  style: TextStyle(
                      color: Color(0xffFFECCC),
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ),
                TextSpan(
                    text: "\nto Silent Moon",
                    style: TextStyle(
                        color: Color(0xffFFECCC),
                        fontSize: 30,
                        fontWeight: FontWeight.w100)),
              ]),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: SizedBox.expand(
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: Text(
                "Explore the app, Find some peace of mind to prepare for meditation.",
                style: PrimaryFont.light(16).copyWith(
                    color: kColorLightGrey,
                    height: 1.5,
                    fontSize: context.screenSize.height * 0.020),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class StartedBackGround extends StatelessWidget {
  const StartedBackGround({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FractionallySizedBox(
        heightFactor: 0.6,
        widthFactor: 1,
        child: FittedBox(
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          child: welcomeImage,
        ),
      ),
    );
  }
}
