class QuizItem {
  final String image_url;
  final int answer;
  final dynamic choice_list;

  QuizItem({
    required this.image_url,
    required this.answer,
    required this.choice_list,
  });

  factory QuizItem.fromJson(Map<String, dynamic> json) {
    return QuizItem(
      image_url: json['image_url'],
      answer: json['answer'],
      choice_list: json['choice_list'],
    );
  }

  QuizItem.fromJson2(Map<String, dynamic> json)
      : image_url = json['image_url'],
        answer = json['answer'],
        choice_list = json['choice_list'];

  @override
  String toString() {
    return '$image_url: $choice_list คำตอบ $answer';
  }
}

// $id: $name ราคา $price บาท