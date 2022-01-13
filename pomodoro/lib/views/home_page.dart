import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/constants/colors.dart';
import 'package:pomodoro/controllers/timer_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TimerController timeController = TimerController();

  @override
  void initState() {
    super.initState();
    timeController.isRunning.addListener(() {setState(() {}); });
    timeController.timeCounter.addListener(() {setState(() {}); });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: CustomColors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 72),

            // Título
            Text(
              "Pomodoro",
              textAlign: TextAlign.center,
              style: GoogleFonts.pacifico(
                color: CustomColors.purple,
                fontSize: 48,
              ),
            ),

            // Subtítulo
            Text(
              "25 minutos de concentração",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: CustomColors.white,
                fontSize: 15,
              ),
            ),
            
            const SizedBox(height: 72),
            
            // Temporizador
            Text(
              timeController.timeCounter.value,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: CustomColors.white,
                fontSize: 84,
              ),
            ),

            const SizedBox(height: 96),

            // Botões de ação
            Padding(
              padding: const EdgeInsets.all(32),
              child: Container(
                height: 72,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: CustomColors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // Play e Pause
                  children: [
                    TextButton(
                      child: Icon(
                        timeController.isRunning.value ? Icons.pause : Icons.play_arrow,
                        size: 48,
                        color: CustomColors.purple,
                      ),
                      onPressed: timeController.isRunning.value ? timeController.pauseTimer : timeController.startTimer,
                    ),

                    const SizedBox(width: 32),

                    // Stop
                    TextButton(
                      child: Icon(
                        Icons.stop,
                        size: 48,
                        color: CustomColors.purple,
                      ),
                      onPressed: timeController.stopTimer,
                    ),
                    
                    const SizedBox(width: 32),

                    // Stop
                    TextButton(
                      child: Icon(
                        Icons.refresh_rounded,
                        size: 40,
                        color: CustomColors.purple,
                      ),
                      onPressed: timeController.restartTimer,
                    ),
                  ],
                ),
              ),
            ),                      
          ],
        ),
      ),
    );
  }
}
