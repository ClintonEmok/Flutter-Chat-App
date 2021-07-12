import 'package:flutter_test/flutter_test.dart';
import 'package:rethinkdb_dart/rethinkdb_dart.dart';

import 'helpers.dart';

void main() {
  Rethinkdb r = Rethinkdb();
  Connection connection;

  // TODO : Create UserService class/method
  UserService sut;

  setUp(() async {
    connection = await r.connect(host: "127.0.01", port: 28015);
    await createDb(r, connection);
    sut = UserService(r, connection);
  })


}
