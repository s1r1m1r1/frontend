// Assuming you have a theme with these colors
import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF1A237E); // A dark blue for the header/buttons
const Color secondaryColor = Color(0xFF5D4037); // A dark brown for the main area background
const Color accentColor = Color(0xFFFDD835); // A gold/yellow for outlines and text
const Color buttonColor = Color(0xFF2C3E50); // A deep blue/grey for buttons
const Color chatBackgroundColor = Color(0xFF3E2723); // A dark brown for the chat box

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Container(
              height: 50,
              color: primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  // Placeholder for the top-left icon
                  Container(width: 30, height: 30, color: accentColor),
                  const Spacer(),
                  // Top buttons
                  _buildTopButton('КАРТА'),
                  const SizedBox(width: 8),
                  _buildTopButton('РЮКЗАК'),
                  const SizedBox(width: 8),
                  _buildTopButton('ПРОФЕССИЯ'),
                ],
              ),
            ),
            // Main Content Area
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.brown[900], // Simulating the wooden background
                    border: Border.all(color: accentColor, width: 2),
                  ),
                  child: Center(
                    // Placeholder for the main game UI content
                    child: Text('Game UI Content', style: TextStyle(color: accentColor)),
                  ),
                ),
              ),
            ),
            // Middle Button Bar
            Container(
              height: 50,
              color: primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildMiddleButton('В БОЙ', Colors.green),
                  _buildMiddleButton('ТОРГОВЛЯ', Colors.yellow),
                  _buildMiddleButton('БАНК', Colors.blue),
                  _buildMiddleButton('НАСТРОЙКИ', Colors.grey),
                ],
              ),
            ),
            // Bottom Chat Box
            Container(
              color: chatBackgroundColor,
              height: 200,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // Chat history area
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: accentColor),
                      ),
                      child: const Center(
                        child: Text('Chat History', style: TextStyle(color: Colors.white70)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Chat input area
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Enter message...',
                            hintStyle: const TextStyle(color: Colors.white54),
                            filled: true,
                            fillColor: Colors.black,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: accentColor),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: accentColor),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          foregroundColor: accentColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        ),
                        child: const Text('Send'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopButton(String text) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        foregroundColor: accentColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Text(text),
    );
  }

  Widget _buildMiddleButton(String text, Color color) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(text),
    );
  }
}
