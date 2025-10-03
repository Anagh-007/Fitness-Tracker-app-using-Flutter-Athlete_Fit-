enum ActivityType {
  walking('Walk', 'walk.json'),
  running('Run', 'run.json'),
  cycling('Cycling', 'cycling.json'),
  swimming('Swimming', 'swim.json'),
  football('Football', 'football.json'),
  tennis('Tennis', 'tennis.json'),
  cricket('Cricket', 'cricket.json'),
  billiards('Billiards', 'billiards.json');

  final String label;
  final String lottieFile;
  const ActivityType(this.label, this.lottieFile);
}
