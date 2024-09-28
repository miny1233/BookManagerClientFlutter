import 'package:bookmanager/protobuf/test.pbgrpc.dart';
import 'package:bookmanager/service/BookService.dart';
import 'package:grpc/grpc.dart';
import 'package:mysql_client/mysql_client.dart';

void main() async
{
  // create connection
  final conn = await MySQLConnection.createConnection(
    host: "121.36.201.254",
    port: 3306,
    userName: "root",
    password: "w+uf2,hm9n%E",
    databaseName: "app_database", // optional
  );

  await conn.connect();
  print('connected');

  var res = await conn.execute(
      'SELECT order_id,status,book_name,order_datetime,shopping_address FROM Orders o '
          'JOIN Users u ON o.user_id = u.user_id '
          'JOIN Books b ON o.book_id = b.book_id WHERE o.user_id = 1 '
          'GROUP BY o.order_id, u.username, b.book_name, o.order_datetime, o.status, o.shopping_address '
          'ORDER BY o.order_datetime DESC;'
  );
  var ret = <OrderInfo>[];
  for(final row in res.rows){
    ret.add(OrderInfo(orderID: int.parse(row.colAt(0) ?? 'null'), status: row.colAt(1) ?? 'null', bookName: row.colAt(2) ?? 'null', orderDatatime: row.colAt(3) ?? 'null', shoppingAddress: row.colAt(4) ?? 'null'));
  }

  return;
}