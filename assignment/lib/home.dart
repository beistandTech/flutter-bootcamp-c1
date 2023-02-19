import 'dart:convert';
import 'package:assignment/models/joke_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoggedIn = false;

  Jokes? jokes;

  String? profilePicture;
  //"https://media.licdn.com/dms/image/C4D03AQGXylfSeXXklg/profile-displayphoto-shrink_800_800/0/1659690678193?e=2147483647&v=beta&t=PERiDLkYP4Cnb3Oa0xeHjQV6Sn1vQMVhEkv6fyPvgT8";

  fetchJokes() async {
    String url = "https://official-joke-api.appspot.com/random_joke";

    Uri jokesUri = Uri.parse(url);

    final response = await http.get(jokesUri);

    if (response.statusCode == 200) {
      final decodedResponse =
          json.decode(response.body) as Map<String, dynamic>;

      setState(() {
        jokes = Jokes.fromJson(decodedResponse);
      });
    } else {
      throw Exception("Failed to load data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (jokes == null)
              ? Column(
                  children: const [
                    Text(
                      "This is where the main joke is",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "This is the punchline for the joke",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )
              : Column(
                  children: [
                    Text(
                      jokes!.setup,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      jokes!.punchline,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () async {
              await fetchJokes();
            },
            child: const Text(
              "Next Joke",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.cyan,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
