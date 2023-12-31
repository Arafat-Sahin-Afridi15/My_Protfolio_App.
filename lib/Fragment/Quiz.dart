import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'question_model.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: isLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            bool userLoggedIn = snapshot.data as bool;
            return userLoggedIn ? Quiz() : LoginPage();
          }
        },
      ),
    );
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // For simplicity, check if both username and password are 'admin'
                if (usernameController.text == 'admin' &&
                    passwordController.text == 'admin') {
                  await saveLoginStatus(true);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Quiz()),
                  );
                } else {
                  // Show an error message or handle authentication failure
                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: Text("Authentication Failed"),
                        content: Text("Invalid username or password."),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveLoginStatus(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', isLoggedIn);
  }
}

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  QuizState createState() => QuizState();
}

class QuizState extends State<Quiz> {
  List<Question> questionList = getQuestions();
  int currentQuestionIndex = 0;
  int score = 0;
  int? selectedAnswerIndex;
  int remainingMinutes = 5;
  int remainingSeconds = 60;
  bool showingCorrectAnswer = false;

  late Timer quizTimer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    quizTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingMinutes == 0 && remainingSeconds == 0) {
        timer.cancel();
        showScoreDialog();
      } else if (remainingSeconds == 0) {
        setState(() {
          remainingMinutes--;
          remainingSeconds = 59;
        });
      } else {
        setState(() {
          remainingSeconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    quizTimer.cancel();
    super.dispose();
  }

  void showScoreDialog() {
    quizTimer.cancel();
    bool isPassed = score >= questionList.length * 0.6;
    String title = isPassed ? "Passed" : "Failed";

    saveScore(score);

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(
            "$title | Score is $score",
            style: TextStyle(
              color: isPassed ? Colors.green : Colors.redAccent,
              fontSize: 24,
            ),
          ),
          content: ElevatedButton(
            child: Text("Restart"),
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                currentQuestionIndex = 0;
                score = 0;
                selectedAnswerIndex = null;
                remainingMinutes = 5;
                remainingSeconds = 60;
                showingCorrectAnswer = false;
                startTimer();
              });
            },
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text("Show High Score"),
              onPressed: () {
                showHighScore();
              },
            ),
          ],
        );
      },
    );
  }

  void answerQuestion(int answerIndex) {
    if (!showingCorrectAnswer) {
      setState(() {
        selectedAnswerIndex = answerIndex;
        if (questionList[currentQuestionIndex].answersList[answerIndex].isCorrect) {
          score++;
        }
        showingCorrectAnswer = true;
      });
    }
  }

  void showHighScore() {
    getHighScore().then((highScore) {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(
              "High Score",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            content: Text(
              "Your high score is $highScore",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    });
  }

  Future<void> saveScore(int userScore) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('highScore', userScore);
  }

  Future<int> getHighScore() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('highScore') ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  color: Colors.orangeAccent,
                  child: Text(
                    "Quiz App",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "Question ${currentQuestionIndex + 1}/${questionList.length}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.timer,
                        color: Colors.black,
                      ),
                      SizedBox(width: 15),
                      Text(
                        "Time: $remainingMinutes:$remainingSeconds",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      questionList[currentQuestionIndex].questionText,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                _answerList(),
                _nextButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _answerList() {
    return Column(
      children: List.generate(
        questionList[currentQuestionIndex].answersList.length,
            (index) => _answerButton(
          questionList[currentQuestionIndex].answersList[index],
          index,
        ),
      ),
    );
  }

  Widget _answerButton(Answer answer, int answerIndex) {
    bool isSelected = selectedAnswerIndex == answerIndex;
    bool isCorrect = isSelected && answer.isCorrect;
    bool showCorrectIndicator = showingCorrectAnswer && answer.isCorrect;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: double.infinity,
        child: ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(answer.answerText),
              if (showCorrectIndicator)
                Icon(
                  isCorrect ? Icons.check : Icons.check_box,
                  color: isCorrect ? Colors.green : Colors.greenAccent,
                ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            primary: isSelected
                ? (isCorrect ? Colors.green : Colors.red)
                : Colors.white,
            onPrimary: isSelected ? Colors.white : Colors.black,
          ),
          onPressed: () {
            answerQuestion(answerIndex);
          },
        ),
      ),
    );
  }

  Widget _nextButton() {
    bool isLastQuestion = currentQuestionIndex == questionList.length - 1;
    String buttonText = showingCorrectAnswer
        ? (isLastQuestion ? "Submit" : "Next")
        : "Submit";

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        child: Text(buttonText),
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          primary: Colors.blueAccent,
          onPrimary: Colors.white,
        ),
        onPressed: () {
          if (isLastQuestion && showingCorrectAnswer) {
            showScoreDialog();
          } else {
            setState(() {
              if (showingCorrectAnswer) {
                selectedAnswerIndex = null;
                currentQuestionIndex++;
                showingCorrectAnswer = false;
              } else {
                answerQuestion(0);
              }
            });
          }
        },
      ),
    );
  }
}
