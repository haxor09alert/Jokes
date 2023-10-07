import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routename = '/Homepage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> jokes = [];

  Future<void> fetchJokes() async {
    try {
      final response = await http.get(
          Uri.parse("https://v2.jokeapi.dev/joke/Any?type=single&amount=10"));

      if (response.statusCode == 200) {
        final jsonJokes = jsonDecode(response.body);

        setState(() {
          jokes.clear(); // Clear previous jokes
          for (var jsonJoke in jsonJokes) {
            if (jsonJoke['joke'] != null) {
              jokes.add(jsonJoke['joke']);
            }
          }
        });
      } else {
        throw Exception('Failed to fetch jokes');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchJokes();
  }
  
  // void  getJokes() async {
  //   jokes JokeList = fetchJokes();
  //   await jokes.Jokes();
  //   fetchJokes();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCF8F6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text( 
                'Jokes',
                style: TextStyle(
                  color: Color(0xFF730707),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: jokes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          gradient: const LinearGradient(
                            colors: [
                              Colors.red,
                              Colors.blue,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          backgroundBlendMode: BlendMode.multiply,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            jokes[index],
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
