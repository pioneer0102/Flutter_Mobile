import 'package:flutter/material.dart';
import 'package:my_flutter/components/screens/project_card.dart';
import 'package:my_flutter/models/project_model.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('My Projects'),
        ),
        body: ListView.builder(
            itemCount: ProjectModel.listProjects.length,
            itemBuilder: (context, index) {
              return ProjectCard(
                  project: ProjectModel.listProjects[index], index: index);
            }));
  }
}
