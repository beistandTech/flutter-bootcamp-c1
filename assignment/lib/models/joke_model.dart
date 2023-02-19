class Jokes {
  int id;
  String type;
  String setup;
  String punchline;

  Jokes({
    required this.id,
    required this.type,
    required this.setup,
    required this.punchline,
  });

  factory Jokes.fromJson(Map<String, dynamic> jokesJson) {
    return Jokes(
      id: jokesJson['id'],
      type: jokesJson['type'],
      setup: jokesJson['setup'],
      punchline: jokesJson['punchline'],
    );
  }
}
