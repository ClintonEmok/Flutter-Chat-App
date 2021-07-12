import 'package:chat/src/models/user.dart';
import 'package:chat/src/services/user/user_service_contract.dart';
import 'package:rethinkdb_dart/rethinkdb_dart.dart';

class UserService implements IUserService {
  final Connection _connection;
  final Rethinkdb r;

  UserService(this.r, this._connection);

  @override
  Future<User> connect(User user) async {
    var data = user.toJson();
    if (user.id != null) data['id'] = user.id;

    // Queries the RethinkDB and returns user information

    final result = await r.table('users').insert(data, {
      'conflict': 'update',
      'return_changes': true,
    }).run(_connection);

    return User.fromJson(result['changes'].first['new_val']);
  }

  @override
  Future<void> disconnect(User user) {
    // TODO: implement disconnect
    throw UnimplementedError();
  }

  @override
  Future<List<User>> onLine() async {
    Cursor users =
        await r.table('users').filter({'active': true}).run(_connection);
    final userList = await users.toList();
    return userList.map((item) => User.fromJson(item)).toList();
  }
}
