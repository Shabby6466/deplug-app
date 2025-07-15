part of 'repository.dart';


class RepositoryImpl implements Repository {
  final MetaMaskService _metaMaskService;
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  RepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required MetaMaskService metaMaskService,
  })  : _metaMaskService = metaMaskService;
  



  // ignore: empty_constructor_bodies
  @override
  Future<void> connectMetaMask() async {
    return await _metaMaskService.connectMetaMask();
  }
}
