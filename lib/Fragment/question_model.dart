
class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];
  //ADD questions and answer here

  list.add(Question(
    "Who is the owner of Flutter?",
    [
      Answer("Nokia", false),
      Answer("Samsung", false),
      Answer("Google", true),
      Answer("Apple", false),
    ],
  ));

  list.add(Question(
    "Who owns Iphone?",
    [
      Answer("Apple", true),
      Answer("Microsoft", false),
      Answer("Google", false),
      Answer("Nokia", false),
    ],
  ));

  list.add(Question(
    "Youtube is _________  platform?",
    [
      Answer("Music Sharing", false),
      Answer("Video Sharing", false),
      Answer("Live Streaming", false),
      Answer("All of the above", true),
    ],
  ));

  list.add(Question(
    "Flutter user dart as a language?",
    [
      Answer("True", true),
      Answer("False", false),
    ],
  ));
  list.add(Question(
    "What is the capital of France?",
    [
      Answer("Berlin", false),
      Answer("London", false),
      Answer("Madrid", false),
      Answer("Paris", true),
    ],
  ));

  list.add(Question(
    "Which planet is known as the 'Red Planet'?",
    [
      Answer("Venus", false),
      Answer("Mars", true),
      Answer("Jupiter", false),
      Answer("Saturn", false),
    ],
  ));

  list.add(Question(
    "Who wrote the play 'Romeo and Juliet'?",
    [
      Answer("Charles Dickens", false),
      Answer("Mark Twain", false),
      Answer("William Shakespeare", true),
      Answer("George Orwell", false),
    ],
  ));

  list.add(Question(
    "What is the largest animal in the world?",
    [
      Answer("Elephant", false),
      Answer("Giraffe", false),
      Answer("Blue Whale", true),
      Answer("Lion", false),
    ],
  ));
  list.add(Question(
    "What is the largest planet in our solar system?",
    [
      Answer("Mars", false),
      Answer("Earth", false),
      Answer("Jupiter", true),
      Answer("Saturn", false),
    ],
  ));

  list.add(Question(
    "Who is known as the 'Father of Modern Physics'?",
    [
      Answer("Isaac Newton", false),
      Answer("Albert Einstein", true),
      Answer("Galileo Galilei", false),
      Answer("Stephen Hawking", false),
    ],
  ));

  list.add(Question(
    "Which gas makes up the majority of Earth's atmosphere?",
    [
      Answer("Oxygen", false),
      Answer("Carbon Dioxide", false),
      Answer("Nitrogen", true),
      Answer("Hydrogen", false),
    ],
  ));

  list.add(Question(
    "Which famous scientist formulated the theory of relativity?",
    [
      Answer("Niels Bohr", false),
      Answer("Isaac Newton", false),
      Answer("Albert Einstein", true),
      Answer("Marie Curie", false),
    ],
  ));
  list.add(Question(
    "What is the small animal in the world?",
    [
      Answer("Elephant", false),
      Answer("Giraffe", false),
      Answer("Shrews", true),
      Answer("Lion", false),
    ],
  ));

  list.add(Question(
    "In which country is the Great Wall of China located?",
    [
      Answer("Japan", false),
      Answer("India", false),
      Answer("China", true),
      Answer("South Korea", false),
    ],
  ));

  list.add(Question(
    "Who is the author of 'To Kill a Mockingbird'?",
    [
      Answer("F. Scott Fitzgerald", false),
      Answer("Harper Lee", true),
      Answer("George Orwell", false),
      Answer("Jane Austen", false),
    ],
  ));


  return list;
}
