import 'package:flutter/material.dart';

import '../models/profile.dart';

class SwipeCards extends StatefulWidget {
  final List<Profile> profiles;
  final void Function(Profile) onLike;

  const SwipeCards({super.key, required this.profiles, required this.onLike});

  @override
  State<SwipeCards> createState() => _SwipeCardsState();
}

class _SwipeCardsState extends State<SwipeCards> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    if (index >= widget.profiles.length) {
      return const Center(child: Text('No more profiles'));
    }

    final profile = widget.profiles[index];
    return Center(
      child: Draggable(
        feedback: _buildCard(profile),
        childWhenDragging: const SizedBox.shrink(),
        onDragEnd: (details) {
          if (details.offset.dx > 100) {
            widget.onLike(profile);
          }
          setState(() {
            index++;
          });
        },
        child: _buildCard(profile),
      ),
    );
  }

  Widget _buildCard(Profile profile) {
    return Card(
      elevation: 4,
      child: SizedBox(
        width: 300,
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person, size: 100),
            const SizedBox(height: 16),
            Text(profile.name, style: const TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
