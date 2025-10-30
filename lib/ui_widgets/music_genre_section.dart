import 'package:flutter/material.dart';
import 'package:flutter_restapi_amples_f25/data_models/music_genres_model.dart';
import '../services/music_genres_service.dart' as music_svc;

class MusicGenreSection extends StatelessWidget {
  const MusicGenreSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: music_svc.fetchMusicGenre(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting ||
            snap.connectionState == ConnectionState.active) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snap.hasError) return Center(child: Text('Error: ${snap.error}'));
        final fact = snap.data;
        if (fact == null || fact.isEmpty) {
          return const Center(child: Text('No Music Genre found.'));
        }
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              fact,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        );
      },
    );
  }
}
