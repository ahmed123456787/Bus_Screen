import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../data/websocket_client.dart';
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
  late WebSocketRepository webSocketRepository;
  late String CurrentStationName = "";
  @override
  void initState() {
    super.initState();
    webSocketRepository = WebSocketRepository();
    openWebSocketConnection();
  }

  void openWebSocketConnection() {
    // Ouvrir une connexion WebSocket et écouter les messages reçus
    webSocketRepository.openConnection((message) {
      //print('Received message: $message');
      final data = jsonDecode(message);
      if (data['sender'] == 'Tablet') {
        //print('sender is tablet');
        if (data['content']['driving_type'] == 'start') {
          setState(() {
            _currentIndex = 1;
          });
        }
      }
      if (data['sender'] == 'Geolocation') {
        String positionType = data['content']['position']['type'];
        if (positionType == 'station') {
          setState(() {
            /* WidgetsBinding.instance.addPostFrameCallback((_) {
              _bodyKey.currentState
                  ?.scrollinterstation(data['content']['position']['name']);
            });
            */
            CurrentStationName = data['content']['position']['name'];
            _currentIndex = 3;
          });

          // Gérer l'affichage de la station courante
          // handleDisplayStation(data['content']['position']['name']);
        } else if (positionType == 'interstation') {
          // Gérer l'affichage de la station suivante
          handleDisplayInterstation(data['content']['position']['name']);
        }
      }
    });
  }

  void _playSound() async {
    await _soundManager.playSound('sounds/Mustafa.mp3');
  }

  void _nextScreen() {
    setState(() {
      if (_currentIndex == 0) {
        _currentIndex = 1;
      } else if (_currentIndex == 1) {
        _currentIndex = 2;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _bodyKey.currentState?.initscroll();
        });
      } else if (_currentIndex == 2) {
        _currentIndex = 3;
      } else {
        _currentIndex = 2;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _bodyKey.currentState?.scrollinterstation("Zarzara");
        });
        //_playSound();
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
          current_station: CurrentStationName,
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

  void handleDisplayStation(station) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _bodyKey.currentState?.scrollinterstation(station);
    });
  }

  void handleDisplayInterstation(station) {
    setState(() {
      _currentIndex = 2;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _bodyKey.currentState?.scrollinterstation(station);
    });
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
