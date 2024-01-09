import 'package:flutter/material.dart';
import 'package:my_flutter/components/screens/projects_screen.dart';
import 'package:my_flutter/models/project_model.dart';
import 'package:my_flutter/projects/boats_app/boats_app.dart';
import 'package:my_flutter/projects/instagram_redesign/instagram_app.dart';
import 'package:my_flutter/projects/medical_appointment/medical_app.dart';
import 'package:my_flutter/projects/music_album_collection/music_album_collection.dart';
import 'package:my_flutter/projects/music_vinyl_player/music_vinyl_player.dart';
import 'package:my_flutter/projects/orix_gaming/orix_gaming_app.dart';
import 'package:my_flutter/projects/photographers_app/photographers_app.dart';
import 'package:my_flutter/projects/superheroes/superheroes_app.dart';
import 'package:my_flutter/projects/template_gallery/template_gallery_app.dart';
import 'package:my_flutter/projects/travel_app/travel_app.dart';

class ProjectRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/screen': (context) => const ProjectsScreen(),
    ProjectModel.boatsApp.route: (context) => const BoatsApp(),
    ProjectModel.musicApp.route: (_) => const MusicAlbumList(),
    ProjectModel.musicAppTwo.route: (_) => const MusicVinylPlayer(),
    ProjectModel.medicalAppointment.route: (_) => const MedicalApp(),
    ProjectModel.photographersApp.route: (_) => const PhotographersApp(),
    ProjectModel.instagram.route: (_) => const InstagramApp(),
    ProjectModel.superheroes.route: (_) => const SuperheroesApp(),
    ProjectModel.orixGaming.route: (_) => const OrixGamingApp(),
    ProjectModel.templateGallery.route: (_) => const TemplateGalleryApp(),
    ProjectModel.travelApp.route: (_) => const TravelApp(),
  };
}
