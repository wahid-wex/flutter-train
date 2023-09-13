import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

enum _Skill { flutter, angular, figma, node, zepplin, dart }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.dark;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeMode == ThemeMode.dark
          ? MyAppThemeConfig.dark().getTheme()
          : MyAppThemeConfig.light().getTheme(),
      home: HomePage(toggleThemeMode: () {
        setState(() {
          if (themeMode == ThemeMode.dark) {
            themeMode = ThemeMode.light;
          } else {
            themeMode = ThemeMode.dark;
          }
        });
      }),
    );
  }
}

class MyAppThemeConfig {
  final Color primaryColor = Colors.pink;
  final Color primaryTextColor;
  final Color secondaryTextColor;

  final Color surfaceColor;

  final Color scaffoldBackgroundColor;

  final Color appBarColor;

  MyAppThemeConfig(
      {required this.primaryTextColor,
      required this.secondaryTextColor,
      required this.surfaceColor,
      required this.scaffoldBackgroundColor,
      required this.appBarColor});

  MyAppThemeConfig.light()
      : primaryTextColor = Colors.black,
        secondaryTextColor = const Color.fromARGB(221, 226, 226, 226),
        surfaceColor = Colors.black,
        appBarColor = const Color.fromARGB(255, 235, 235, 235),
        scaffoldBackgroundColor = const Color.fromARGB(255, 255, 255, 255);

  MyAppThemeConfig.dark()
      : primaryTextColor = Colors.white,
        secondaryTextColor = Colors.white70,
        surfaceColor = const Color.fromARGB(255, 255, 255, 255),
        appBarColor = const Color.fromARGB(255, 14, 14, 14),
        scaffoldBackgroundColor = const Color.fromARGB(255, 31, 31, 31);

  ThemeData getTheme() {
    return ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.pink,
        dividerColor: Colors.red,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.pink))),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: const Color.fromARGB(31, 83, 83, 83),
        ),
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.blue, surface: Colors.pink),
        textTheme: GoogleFonts.latoTextTheme(
          TextTheme(
            bodyLarge: TextStyle(fontSize: 12, color: primaryTextColor),
          ),
        ),
        appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: primaryTextColor),
            backgroundColor: appBarColor,
            foregroundColor: primaryTextColor));
  }
}

class HomePage extends StatefulWidget {
  final Function() toggleThemeMode;

  const HomePage({super.key, required this.toggleThemeMode});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _Skill _selectedSkill = _Skill.flutter;

  void updateSkill(_Skill skill) {
    setState(() {
      _selectedSkill = skill;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.amber,
        title: const Text('Vahids profile'),
        actions: [
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Icon(CupertinoIcons.chat_bubble),
          ),
          InkWell(
            onTap: widget.toggleThemeMode,
            child: const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Icon(CupertinoIcons.sun_max),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: Row(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/1647383785560.jpg',
                    width: 80,
                    height: 80,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Vahid Saebi Yekta',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  )),
                      Text(
                        'Software Engineer',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Row(
                        children: [
                          const Icon(CupertinoIcons.pin, size: 16),
                          const SizedBox(width: 2),
                          Text(
                            'Iran Tehran',
                            style: Theme.of(context).textTheme.bodyLarge,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    const Icon(CupertinoIcons.heart, color: Colors.pink),
                    Text(
                      '1542',
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                )
              ]),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
                child: Text(
                  'A software engineer with 5+ years of experience in frontend development.A clean coder who has excellent skills in problem solving and agile development. ',
                  style: Theme.of(context).textTheme.bodyLarge,
                )),
            const Divider(
              indent: 12,
              endIndent: 12,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
              child: Row(children: [
                Text('Skills'),
                Icon(CupertinoIcons.chevron_down, size: 10)
              ]),
            ),
            Center(
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 8,
                runSpacing: 8,
                children: [
                  SkillItem(
                    type: _Skill.angular,
                    title: 'Flutter',
                    imagePath: 'assets/images/angular.png',
                    shadowColor: Colors.red,
                    isActive: _selectedSkill == _Skill.angular,
                    onTap: () {
                      updateSkill(_Skill.angular);
                    },
                  ),
                  SkillItem(
                    title: 'Flutter',
                    imagePath: 'assets/images/flutter.png',
                    shadowColor: Colors.blue,
                    isActive: _selectedSkill == _Skill.flutter,
                    type: _Skill.flutter,
                    onTap: () {
                      updateSkill(_Skill.flutter);
                    },
                  ),
                  SkillItem(
                    title: 'node',
                    imagePath: 'assets/images/node.png',
                    shadowColor: Colors.green,
                    isActive: _selectedSkill == _Skill.node,
                    type: _Skill.node,
                    onTap: () {
                      updateSkill(_Skill.node);
                    },
                  ),
                  SkillItem(
                    title: 'dart',
                    imagePath: 'assets/images/dart.webp',
                    shadowColor: Colors.blue,
                    isActive: _selectedSkill == _Skill.dart,
                    type: _Skill.dart,
                    onTap: () {
                      updateSkill(_Skill.dart);
                    },
                  ),
                  SkillItem(
                    title: 'zeplin',
                    imagePath: 'assets/images/zepplin.png',
                    shadowColor: Colors.orange,
                    isActive: _selectedSkill == _Skill.zepplin,
                    type: _Skill.zepplin,
                    onTap: () {
                      updateSkill(_Skill.zepplin);
                    },
                  ),
                  SkillItem(
                    title: 'figma',
                    imagePath: 'assets/images/figma.png',
                    shadowColor: const Color.fromARGB(255, 137, 93, 194),
                    isActive: _selectedSkill == _Skill.figma,
                    type: _Skill.figma,
                    onTap: () {
                      updateSkill(_Skill.figma);
                    },
                  ),
                ],
              ),
            ),
            const Divider(
              indent: 12,
              endIndent: 12,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Personal information'),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                      decoration: InputDecoration(
                          labelText: 'User name',
                          prefixIcon: Icon(CupertinoIcons.at))),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                      decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(CupertinoIcons.lock))),
                  SizedBox(
                    height: 18,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: null,
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SkillItem extends StatelessWidget {
  final _Skill type;
  final String title;
  final String imagePath;
  final Color shadowColor;
  final bool isActive;
  final Function() onTap;

  const SkillItem({
    super.key,
    required this.title,
    required this.imagePath,
    required this.shadowColor,
    required this.isActive,
    required this.onTap,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 110,
        height: 110,
        decoration: isActive
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromARGB(15, 0, 0, 0))
            : null,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            decoration: isActive
                ? BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: shadowColor.withOpacity(0.5), blurRadius: 20)
                  ])
                : null,
            child: Image.asset(
              imagePath,
              width: 40,
              height: 40,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ]),
      ),
    );
  }
}
