class Migrations {
  static Map<int, String> scripts = {
    1: '''CREATE TABLE users(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      username TEXT NOT NULL UNIQUE,
      password TEXT NOT NULL
    );''',
    2: '''CREATE TABLE logs(
      author TEXT NOT NULL,
      describe TEXT NOT NULL,
      created_at TEXT NOT NULL
    ); ''',
    3: '''ALTER TABLE users ADD created_at TEXT NOT NULL;
    ALTER TABLE users ADD updated_at TEXT;
    ALTER TABLE users ADD deleted_at TEXT;''',
    4: 'INSERT INTO users (id, username, password, created_at) VALUES (1, "admin", "admin", "${DateTime.now().toLocal()}");',
    5: '''CREATE TABLE consumers(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      full_name TEXT NOT NULL,
      email TEXT NOT NULL,
      cep TEXT NO NULL,
      address TEXT NOT NULL,
      phone TEXT NOT NULL UNIQUE,
      phone2 TEXT,
      phone3 TEXT,
      created_at TEXT NOT NULL,
      updated_at TEXT,
      deleted_at TEXT
    ); ''',
    6: '''CREATE TABLE devices(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      consumer_id INTEGER,
      name TEXT NOT NULL,
      model TEXT NOT NULL,
      serial_number INTEGER NOT NULL UNIQUE,
      mark TEXT NOT NULL,
      FOREIGN KEY(consumer_id) REFERENCES consumers(id)
    ); ''',
    7: '''CREATE TABLE services(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      device_id INTEGER,
      technician_id INTEGER,
      status TEXT NOT NULL,
      price INT NOT NULL,
      describe TEXT NOT NULL,
      FOREIGN KEY(device_id) REFERENCES devices(id),
      FOREIGN KEY(technician_id) REFERENCES users(id)
    );''',
    8: '''ALTER TABLE devices ADD craeted_at TEXT NOT NULL;
    ALTER TABLE devices ADD updated_at TEXT;
    ALTER TABLE devices ADD deleted_at TEXT;
    ALTER TABLE services ADD created_at TEXT NOT NULL;
    ALTER TABLE services ADD updated_at TEXT;
    ALTER TABLE services ADD deleted_at TEXT;''',
  };
}
