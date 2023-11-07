class Migrations {
  static Map<int, String> scripts = {
    1: '''CREATE TABLE users(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      username TEXT NOT NULL UNIQUE,
      password TEXT NOT NULL,
      created_at TEXT NOT NULL,
      updated_at TEXT,
      deleted_at TEXT
    );''',
    2: '''CREATE TABLE logs(
      author TEXT NOT NULL,
      describe TEXT NOT NULL,
      created_at TEXT NOT NULL
    ); ''',
    3: '''ALTER TABLE users ADD created_at TEXT NOT NULL;
    ALTER TABLE users ADD updated_at TEXT;
    ALTER TABLE users ADD deleted_at TEXT;''',
    4: 'INSERT INTO users (id, username, password, created_at) VALUES (1, "admin", "admin", "${DateTime.now().toLocal()}");'
  };
}
