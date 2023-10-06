import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/Homepage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              Text(
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
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          gradient: LinearGradient(colors: [Colors.red,Colors.blue,],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          ),
                          backgroundBlendMode: BlendMode.multiply,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Nunc ac interdum sem. Sed at dolor quis ex mattis luctus nec ullamcorper justo. Integer vitae blandit tortor. Nulla suscipit ullamcorper nisl et ullamcorper`',
                            style: TextStyle(
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
