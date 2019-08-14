import 'package:e_commerce/util/repo.dart';
void main() async{
  Repository repo = Repository();
   await repo.getCategories();
}