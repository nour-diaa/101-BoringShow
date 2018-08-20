/*
 * Defines the data object for Article data
 */

class Article {
  final String text;
  final String domain;
  final String by;
  final String age;
  final int score;
  final int commentsCount;

  const Article({
    this.text,
    this.domain,
    this.by,
    this.age,
    this.score,
    this.commentsCount,
  });
}

final articles = [
  new Article (
    text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
    domain: "wiley.com",
    by : "abc",
    age: "3 hours",
    score: 177,
    commentsCount: 10,
  ),
  new Article (
    text: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
    domain: "coyote.com",
    by : "def",
    age: "1 hour",
    score: 100,
    commentsCount: 1,
  ),
];


