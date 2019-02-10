# speedometer
A speedometer for my exercise bike that controls movement in a VR-Game

The Cykel.ino gets uploaded to the arduino.
The Cykel.pde is run by using Processing 3.

How it works:
1. I have several metal prongs in a circle around the bicycle-pedals which are all connected to the arduino 
to 3 different analog inputs groups on the arduino like so:    123123123123 etc.
2. I have 1 metal prong that is connected to one of the pedals and to one of the arduinos HIGH output.
3. When the stationary and the pedalprong meet they close the loop and a signal is generated.
4. Using the difference in time and the differnet input signals from the 3 groups we can calculate speed and direction of pedaling.
5. This information is transmitted using serial transmission over USB to the computer which is running the 
Processing-program and which also is running the VR-game.
6. Movement input to the VR-game is simulated by sending commands from the processing program to another 
program running in the terminal. (Open-VRInputEmulator https://github.com/matzman666/OpenVR-InputEmulator/releases)



