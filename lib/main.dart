// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:practica_ui_app/presentation/screens/main_screens.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  'Parque Natural Nacional Puracé',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              Text(
                'Puracé, Cauca, Colombia',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 20,
                ),
              )
            ],
          )),
          const FavoriteWidget(),
        ],
      ),
    );
    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'LLAMAR'),
        _buildButtonColumn(color, Icons.near_me, 'RUTA'),
        _buildButtonColumn(color, Icons.share, 'COMPARTIR'),
      ],
    );
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Declarado por la UNESCO como Reserva de la Biosfera en 1979, el Parque'
        'Nacional Natural Puracé es una zona volcánica y lo refleja tanto en sus '
        'numerosas fuentes azufradas como en su nombre, que en lengua quechua sig'
        'nifica “montaña de fuego”. Allí nacen los principales ríos de Colombia:'
        'Magdalena, Cauca, Patía y Caquetá y también 30 lagunas tranquilas y cla'
        'ras, ideales para la contemplación. Dentro de su estupendo paisaje se '
        'levanta la cadena volcánica de los Coconucos, también conocida como'
        'Serranía de los Coconucos, compuesta por 11 volcanes. De éstos los mas'
        'destacados son el Pan de Azúcar (5.000 msnm), el Puracé (4.780 msnm) el '
        'único activo, y el Coconuco (4.600 msnm). A comienzos de siglo XX, toda'
        'la Serranía permanecía nevada; actualmente, ni siquiera el cerro más al'
        'to, el Pan de Azúcar, conserva nieve. Dicen los indígenas que el hacha'
        'de los blancos ahuyento a “Jucas” el dueño de la nieve y el granizo.',
        softWrap: true,
        textAlign: TextAlign.justify,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: //MainScreen(),
            ListView(
          children: [
            Image.asset(
              'images/volcan.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  void startHammering() {
    print('bang bang bang');
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
            //OnPressed: startHammering(),
          ),
        ),
      ],
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: SizedBox(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
}
