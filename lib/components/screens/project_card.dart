import 'package:flutter/material.dart';
import 'package:my_flutter/models/project_model.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project, required this.index});

  final ProjectModel project;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 220,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(project.pathImage, fit: BoxFit.cover),
            ),
            const Positioned.fill(
              child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.black26)),
            ),
            Positioned(
              top: 12,
              bottom: 12,
              left: 12,
              right: 12,
              child: Column(
                children: [
                  Row(
                    children: [
                      Opacity(
                        opacity: 0.6,
                        child: Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(width: 4),
                                shape: BoxShape.circle),
                            child: Text(
                              "${index + 1}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black),
                            )),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project.title,
                            maxLines: 1,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                          Text(
                            project.description,
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 18, color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Designer",
                              maxLines: 1,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                            Text(
                              project.designer,
                              maxLines: 1,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 3,
                          child: TextButton(
                            onPressed: () =>
                                {Navigator.pushNamed(context, project.route)},
                            style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: const BorderSide(color: Colors.white),
                                ),
                                backgroundColor: Colors.black.withOpacity(0.5)),
                            child: const Text(
                              'Open Project',
                              maxLines: 1,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
