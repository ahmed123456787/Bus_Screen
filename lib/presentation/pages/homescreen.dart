import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itrans/presentation/pages/current_station_page.dart';
import 'package:itrans/presentation/pages/direction_page.dart';
import 'package:itrans/presentation/pages/logopage.dart';
import 'package:itrans/presentation/pages/welcomestationpage.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:itrans/presentation/soundManager.dart';
import 'package:itrans/presentation/widgets/body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final AudioPlayer _audioPlayer = AudioPlayer();
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<BodyState> _bodyKey = GlobalKey<BodyState>();
  final PageStorageBucket bucket = PageStorageBucket();
  final SoundManager _soundManager = SoundManager();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _bodyKey.currentState?.scrollToNextStation();
    });
  }

  void _playSound() async {
    await _soundManager.playSound('sounds/Mustafa.mp3');
  }

  void _nextScreen() {
    setState(() {
      if (_currentIndex == 1) {
        _currentIndex = 2;
        /*WidgetsBinding.instance.addPostFrameCallback((_) {
          _bodyKey.currentState?.scrollToNextStation();
        });*/
      } else if (_currentIndex == 2) {
        _currentIndex = 3;
      } else {
        _currentIndex = 2;

        // _playSound();
      }
    });
  }

  void _previousScreen() {
    setState(() {
      if (_currentIndex == 2) {
        _currentIndex = 1;
      } else if (_currentIndex == 1) {
        _currentIndex = 0;
      } else {
        _currentIndex = 2;
      }
      //_playSound();
    });
  }

  String _getCurrentStation() {
    //_playSound();
    return _bodyKey.currentState?.getCurrentStationName() ?? "Unknown";
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const Logopage(),
      const Welcomestationpage(key: PageStorageKey('WelcomePage')),
      Direction_page(
          scrollController: _scrollController,
          bodyKey: _bodyKey,
          key: const PageStorageKey('DirectionPage')),
      Currentstationpage(
          current_station: _getCurrentStation(),
          key: const PageStorageKey('CurrentPage')),
    ];

    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: Focus(
          autofocus: true,
          onKey: (FocusNode node, RawKeyEvent event) {
            if (event is RawKeyDownEvent) {
              if (event.logicalKey == LogicalKeyboardKey.keyD) {
                _nextScreen();
                return KeyEventResult.handled;
              } else if (event.logicalKey == LogicalKeyboardKey.keyA) {
                _previousScreen();
                return KeyEventResult.handled;
              }
            }
            return KeyEventResult.ignored;
          },
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: screens[_currentIndex],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Animation Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
