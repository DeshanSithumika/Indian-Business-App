import 'package:flutter/material.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({required this.description, super.key});

  final List<String> description;

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.amber.shade100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.description[0],
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Image(image: NetworkImage(widget.description[1])),
              const SizedBox(height: 10),
              Text(
                widget.description[2],
                style: const TextStyle(fontSize: 17),
              ),
              const SizedBox(height: 10),
              Text(
                widget.description[3],
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 5),
              Text(
                widget.description[4],
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                widget.description[5],
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 3),
              Text("Publish at ${widget.description[6]}"),
            ],
          ),
        ),
      ),
    );
  }
}
