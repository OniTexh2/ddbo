/*
Instantiate this game object when a dialogue needs to be played, using "with" and adding lines with:

dialog.add(message, velvet);

Where "message" is the current line and "velvet" is to check if Velvet is talking (For special draw effects)

Also lock player movement and interactions when the dialogue starts, and unlock them when it ends.

This is based on a 1280x960 enviroment... So you might need to change it inside the project.

*/

dialog = new dialogue()
current_dialog = {}

key_next = ord("Z")

showing_dialog = false

on_dialogue = true

char_current = 1;
char_speed = 0.5;