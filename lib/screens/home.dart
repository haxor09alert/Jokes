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
  String api_key = "HwYbT0yHHGuzzVybGT/H4A==pZs9vSjnDki63KqG";
  bool isLoading = false;

  Future<void> fetchJokes() async {
    setState(() {
      isLoading = true;   //loading screen 
    });
    try {
      final response = await http.get(
          Uri.parse("https://api.api-ninjas.com/v1/jokes?limit=10"), headers: {
            "X-Api-Key": api_key
          });
      print(response);
      if (response.statusCode == 200) {
        final jsonJokes = jsonDecode(response.body);

        List<String> data = [];
        for (var jsonJoke in jsonJokes) {
          if (jsonJoke['joke'] != null) {
            data.add(jsonJoke['joke']);
          }
        }
        setState(() {
          jokes = data;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        throw Exception('Failed to fetch jokes');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    print("I am ned");
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
                child: RefreshIndicator(    //Refresh Indicator
                  onRefresh: () async {
                    fetchJokes();
                  },
                  child: isLoading? Center(child: CircularProgressIndicator()): ListView.builder(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
