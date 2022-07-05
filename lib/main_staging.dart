import 'package:smart_ix_takehome/bootstrap.dart';
import 'package:smart_ix_takehome/src/feature/app/app.dart';

void main() async{
  await initApp();
  await bootstrap(() => const App());
}
