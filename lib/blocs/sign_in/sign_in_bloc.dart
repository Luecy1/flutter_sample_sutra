import 'package:bloc/bloc.dart';
import 'package:flutter_sample_sutra/blocs/sign_in/sign_in_event.dart';
import 'package:flutter_sample_sutra/blocs/sign_in/sign_in_repository.dart';
import 'package:flutter_sample_sutra/blocs/sign_in/sign_in_state.dart';
import 'package:meta/meta.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInRepository _signInRepository;

  SignInBloc({@required SignInRepository signInRepository})
      : assert(signInRepository != null),
        _signInRepository = signInRepository;

  @override
  SignInState get initialState => SignInEmpty();

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is SignInWithGoogleInOnPressed) {
      yield* _mapSignInWithGooglePressed();
    }

    if (event is SignInAnonymouslyOnPressed) {
      yield* _mapSignInAnonymouslyOnPressed();
    }
  }

  Stream<SignInState> _mapSignInWithGooglePressed() async* {
    yield SignInLoading();

    try {
      await _signInRepository.signInWithGoogle();
      yield SignInSuccess();
    } catch (_) {
      yield SignInFailure();
    }
  }

  Stream<SignInState> _mapSignInAnonymouslyOnPressed() async* {
    yield SignInLoading();

    try {
      await _signInRepository.signInAnonymously();
      yield SignInSuccess();
    } catch (_) {
      yield SignInFailure();
    }
  }
}
