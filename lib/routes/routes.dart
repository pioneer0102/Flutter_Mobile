import 'package:flutter/material.dart';
import 'package:my_flutter/components/screens/projects_screen.dart';
import 'package:my_flutter/models/project_model.dart';
import 'package:my_flutter/projects/boats_app/boats_app.dart';

class ProjectRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/screen': (context) => const ProjectsScreen(),
    ProjectModel.boatsApp.route: (context) => const BoatsApp()
  };
}
