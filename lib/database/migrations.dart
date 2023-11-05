class Migrations {
  static Map<int, String> scripts = {
    1: '''CREATE TABLE users(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      username TEXT NOT NULL UNIQUE,
      password TEXT NOT NULL
    );''',
    2: '''CREATE TABLE logs(
      author TEXT NOT NULL,
      describe TEXT NOT NULL,
      created_at TEXT NOT NULL
    ); ''',
  };
}
