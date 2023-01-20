import 'package:gym/model/abstract_user.dart';
import 'package:gym/model/userCliente.dart';

class Treinandor extends AbstractUser{
  //listas de ids dos clientes (API)
List <int> clienteIds=[];

//lista dos clientes
  List <UserCliente> listCliente=[];
}