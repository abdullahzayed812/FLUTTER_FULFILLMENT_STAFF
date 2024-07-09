import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:postage_staff/injection/injection.dart';

enum EnvTypeEnum { dev, prod }

class EnvVariable {
  EnvVariable._();

  static final EnvVariable instance = EnvVariable._();

  String _envType = '';

  Future<void> init({required EnvTypeEnum envType}) async {
    switch (envType) {
      case EnvTypeEnum.dev:
        await dotenv.load(fileName: '.env.dev');
        await configureInjection('dev');
      case EnvTypeEnum.prod:
        await dotenv.load(fileName: '.env.prod');
        await configureInjection('prod');

    }
    _envType = dotenv.get('Env_type');
  }

  String get envType => _envType;

  bool get isDebugMode => _envType == 'dev';
}
