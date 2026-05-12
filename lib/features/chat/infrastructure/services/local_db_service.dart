import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:path/path.dart' as p;
import 'package:sembast/sembast_io.dart';

import '../../domain/models/message.dart';

class LocalDbService {
  late Future<Database> _db;

  //Store = a table within the db file
  final _store = intMapStoreFactory.store('diary_messages');

  LocalDbService() {
    _db = _initDb();
  }

  Future<Database> _initDb() async {
    final dir = await getApplicationDocumentsDirectory();
    final dbPath = p.join(dir.path, 'diary_database.db');
    return await databaseFactoryIo.openDatabase(dbPath);
  }

  Future<void> saveMessage(Message message) async {
    final db = await _db;
    await _store.add(db, message.toMap());
  }

  Future<List<Message>> getHistory() async {
    final db = await _db;
    final finder = Finder(sortOrders: [SortOrder('timestamp')]);
    final recordSnapshots = await _store.find(db, finder: finder);

    return recordSnapshots.map((snapshot) {
      return Message.fromMap(snapshot.value);
    }).toList();
  }
}
