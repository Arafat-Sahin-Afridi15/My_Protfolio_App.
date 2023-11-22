// question_model.dart

class Question {
  String questionText;
  List<Answer> answersList;

  Question({
    required this.questionText,
    required this.answersList,
  });
}

class Answer {
  String answerText;
  bool isCorrect;

  Answer({
    required this.answerText,
    required this.isCorrect,
  });
}

List<Question> getQuestions() {
  return [
    Question(
      questionText: "What is the capital of France?",
      answersList: [
        Answer(answerText: "Berlin", isCorrect: false),
        Answer(answerText: "Madrid", isCorrect: false),
        Answer(answerText: "Paris", isCorrect: true),
        Answer(answerText: "Rome", isCorrect: false),
      ],
    ),
    Question(
      questionText: "Which planet is known as the Red Planet?",
      answersList: [
        Answer(answerText: "Earth", isCorrect: false),
        Answer(answerText: "Mars", isCorrect: true),
        Answer(answerText: "Jupiter", isCorrect: false),
        Answer(answerText: "Venus", isCorrect: false),
      ],
    ),
    Question(
      questionText: "What is the largest mammal?",
      answersList: [
        Answer(answerText: "Elephant", isCorrect: false),
        Answer(answerText: "Blue Whale", isCorrect: true),
        Answer(answerText: "Giraffe", isCorrect: false),
        Answer(answerText: "Horse", isCorrect: false),
      ],
    ),
    Question(
      questionText: "Who wrote 'Romeo and Juliet'?",
      answersList: [
        Answer(answerText: "Charles Dickens", isCorrect: false),
        Answer(answerText: "William Shakespeare", isCorrect: true),
        Answer(answerText: "Jane Austen", isCorrect: false),
        Answer(answerText: "Mark Twain", isCorrect: false),
      ],
    ),
    Question(
      questionText: "What is the capital of Japan?",
      answersList: [
        Answer(answerText: "Seoul", isCorrect: false),
        Answer(answerText: "Beijing", isCorrect: false),
        Answer(answerText: "Tokyo", isCorrect: true),
        Answer(answerText: "Bangkok", isCorrect: false),
      ],
    ),
    Question(
      questionText: "Which element has the chemical symbol 'O'?",
      answersList: [
        Answer(answerText: "Osmium", isCorrect: false),
        Answer(answerText: "Oxygen", isCorrect: true),
        Answer(answerText: "Gold", isCorrect: false),
        Answer(answerText: "Carbon", isCorrect: false),
      ],
    ),
    Question(
      questionText: "What is the capital of Australia?",
      answersList: [
        Answer(answerText: "Sydney", isCorrect: false),
        Answer(answerText: "Melbourne", isCorrect: false),
        Answer(answerText: "Canberra", isCorrect: true),
        Answer(answerText: "Perth", isCorrect: false),
      ],
    ),
    Question(
      questionText: "Who painted the Mona Lisa?",
      answersList: [
        Answer(answerText: "Vincent van Gogh", isCorrect: false),
        Answer(answerText: "Pablo Picasso", isCorrect: false),
        Answer(answerText: "Leonardo da Vinci", isCorrect: true),
        Answer(answerText: "Claude Monet", isCorrect: false),
      ],
    ),
    Question(
      questionText: "What is the smallest prime number?",
      answersList: [
        Answer(answerText: "0", isCorrect: false),
        Answer(answerText: "1", isCorrect: false),
        Answer(answerText: "2", isCorrect: true),
        Answer(answerText: "3", isCorrect: false),
      ],
    ),
    Question(
      questionText: "In which year did World War I begin?",
      answersList: [
        Answer(answerText: "1914", isCorrect: true),
        Answer(answerText: "1920", isCorrect: false),
        Answer(answerText: "1939", isCorrect: false),
        Answer(answerText: "1945", isCorrect: false),
      ],
    ),
    Question(
      questionText: "Who is known as the 'Father of Computer Science'?",
      answersList: [
        Answer(answerText: "Ada Lovelace", isCorrect: false),
        Answer(answerText: "Alan Turing", isCorrect: true),
        Answer(answerText: "Bill Gates", isCorrect: false),
        Answer(answerText: "Steve Jobs", isCorrect: false),
      ],
    ),
    Question(
      questionText: "Which gas is most abundant in the Earth's atmosphere?",
      answersList: [
        Answer(answerText: "Oxygen", isCorrect: false),
        Answer(answerText: "Carbon Dioxide", isCorrect: false),
        Answer(answerText: "Nitrogen", isCorrect: true),
        Answer(answerText: "Hydrogen", isCorrect: false),
      ],
    ),
    // Add more questions as needed
  ];
}
