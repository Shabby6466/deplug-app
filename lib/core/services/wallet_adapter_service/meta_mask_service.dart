
import 'package:injectable/injectable.dart';

abstract class MetaMaskService {
  Future<void> connectMetaMask();



}

@LazySingleton(as: MetaMaskService)
class MetaMaskServiceImpl implements MetaMaskService {

  @override
  Future<void> connectMetaMask() async {
    
  }

}
