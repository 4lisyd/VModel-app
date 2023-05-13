// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import 'graphql_service.dart';
//
// class AuthState {
//   final bool isAuthenticated;
//   final String token;
//
//   AuthState({required this.isAuthenticated, required this.token});
// }
//
// class AuthNotifier extends StateNotifier<AuthState> {
//   final GraphQlService _graphQLService;
//
//   AuthNotifier(this._graphQLService) : super(AuthState(isAuthenticated: false, token: ''));
//
//   Future<void> login(String email, String password) async {
//     final token = await _graphQLService.login(email: email, password: password);
//     state = AuthState(isAuthenticated: true, token: token);
//   }
//
//   // Future<void> logout() async {
//   //   await _graphQLService.logout();
//   //   state = AuthState(isAuthenticated: false, token: '');
//   // }
//
//   // Future<void> fetchData() async {
//   //   final token = state.token;
//   //   final data = await _graphQLService.fetchData(token);
//   //   // do something with the data
//   // }
// }
//
//
//
//
// // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import 'package:graphql/client.dart';
// //
// // import 'graphql_confiq.dart';
// //
// //
// // class SignUpNotifier extends StateNotifier<SignUpState> {
// //   SignUpNotifier() : super(SignUpState.initial());
// //
// //   static GraphQlConfig graphQlConfig = GraphQlConfig();
// //   GraphQLClient client = graphQlConfig.client();
// //
// //   Future register({
// //     required String username,
// //     required String firstName,
// //     required String lastName,
// //     required String password1,
// //     required String password2,
// //     required String email,
// //   }) async {
// //     try {
// //       state = SignUpState.loading();
// //       QueryResult result = await client.mutate(
// //           MutationOptions(
// //               fetchPolicy: FetchPolicy.noCache,
// //               document: gql(
// //                   '''
// //               mutation {
// //   register(
// //     email: "$email",
// //     username: "$username",
// //     firstName:"$firstName",
// //     lastName:"$lastName",
// //     password1: "$password1",
// //     password2: "$password2",
// //   ) {
// //     success,
// //     token,
// //     errors,
// //   }
// // }
// //               '''
// //               ),
// //               variables: {
// //                 'email': email,
// //                 'firstName': firstName,
// //                 'lastName': lastName,
// //                 'password1': password1,
// //                 'password2': password2,
// //               }
// //           )
// //       );
// //       if(result.hasException){
// //         // print(result.exception);
// //         state = SignUpState.failure(result.exception.toString());
// //         throw Exception(result.exception);
// //       } else {
// //         // print('secces');
// //         // print(result);
// //         return true;
// //       }
// //     }catch(error){
// //       // print(error);
// //       return false;
// //     }
// //   }
// // }
// //
// // class SignUpState {
// //   final bool isLoading;
// //   final bool isSuccess;
// //   final bool isFailure;
// //   final String? userId;
// //   final String? username;
// //   final String? email;
// //   final String? error;
// //   final String? password1;
// //   final String? password2;
// //   final String? firstName;
// //   final String? lastName;
// //
// //   const SignUpState({
// //     required this.isLoading,
// //     required this.isSuccess,
// //     required this.isFailure,
// //     this.userId,
// //     this.username,
// //     this.email,
// //     this.error,
// //     this.password2,
// //     this.password1,
// //     this.lastName,
// //     this.firstName
// //   });
// //
// //   factory SignUpState.initial() =>
// //       SignUpState(
// //         isLoading: false,
// //         isSuccess: false,
// //         isFailure: false,
// //       );
// //
// //   factory SignUpState.loading() =>
// //       SignUpState(
// //         isLoading: true,
// //         isSuccess: false,
// //         isFailure: false,
// //       );
// //
// //   factory SignUpState.success(String userId, String username, String email) =>
// //       SignUpState(
// //         isLoading: false,
// //         isSuccess: true,
// //         isFailure: false,
// //         userId: userId,
// //         username: username,
// //         email: email,
// //       );
// //
// //   factory SignUpState.failure(String error) =>
// //       SignUpState(
// //         isLoading: false,
// //         isSuccess: false,
// //         isFailure: true,
// //       );
// // }
