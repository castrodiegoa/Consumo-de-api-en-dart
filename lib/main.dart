import 'package:dart_application/models/user.dart';
import 'package:dart_application/services/api_service.dart';

void main() async {
  try {
    List<User> users = await ApiService.fetchUsers();

    // Filtra y muestra los usuarios con nombre de usuario mayor a 6 caracteres
    List<User> filteredUsers = ApiService.filterByUsernameLength(users, 6);
    print('Usuarios con nombre de usuario mayor a 6 caracteres:');
    filteredUsers.forEach((user) => print(user.username));

    // Cuenta los usuarios cuyo correo electrónico pertenece al dominio 'biz'
    int bizEmailCount = ApiService.countEmailsByDomain(users, 'biz');
    print('\nCantidad de usuarios con correo en dominio "biz": $bizEmailCount');
  } catch (e) {
    print('Error: $e');
  }
}
