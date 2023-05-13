import 'package:graphql_flutter/graphql_flutter.dart';

import '../cache/local_storage.dart';

class GraphQlConfig {
static final token = VModelSharedPrefStorage().getString('token');
  static HttpLink httpLink = HttpLink('https://vmodel-app.herokuapp.com/graphql', defaultHeaders: {'Authorization': 'Bearer $token'});
  GraphQLClient client () => GraphQLClient(link: httpLink, cache: GraphQLCache());
}

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:vmodel/src/core/api/user.dart';
//
// import 'graphql_confiq.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
//
// class GraphQlService{
//   static GraphQlConfig graphQlConfig = GraphQlConfig();
//   GraphQLClient client = graphQlConfig.client();
//
//   Future register({
//     required String username,
//     required String firstName,
//     required String lastName,
//     required String password1,
//     required String password2,
//     required String email,
//   }) async {
//     try {
//       QueryResult result = await client.mutate(
//           MutationOptions(
//               fetchPolicy: FetchPolicy.noCache,
//               document: gql(
//                   '''
//               mutation {
//   register(
//     email: "$email",
//     username: "$username",
//     firstName:"$firstName",
//     lastName:"$lastName",
//     password1: "$password1",
//     password2: "$password2",
//   ) {
//     success,
//     token,
//     errors,
//   }
// }
//               '''
//               ),
//               variables: {
//                 'email': email,
//                 'firstName': firstName,
//                 'lastName': lastName,
//                 'password1': password1,
//                 'password2': password2,
//               }
//           )
//       );
//       if(result.hasException){
//         // print(result.exception);
//         throw Exception(result.exception);
//       } else {
//         // print('secces');
//         succ = result.data!['register']['success'];
//         // print(result);
//         return true;
//       }
//     }catch(error){
//       // print(error);
//       return false;
//     }
//   }
//
//   Future login({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       QueryResult result = await client.mutate(
//           MutationOptions(
//               fetchPolicy: FetchPolicy.noCache,
//               document: gql(
//                   '''
//              mutation{
//   tokenAuth(email:"$email",password:"$password"){
//     success
//     token
//     errors
//     user{
//       username
//       lastName
//       firstName
//       isActive
//       bio
//     }
//   }
// }
//               '''
//               ),
//               variables: {
//                 'email': email,
//                 'password': password,
//               }
//           )
//       );
//       if(result.hasException) {
//         final error = result.exception?.graphqlErrors[0];
//         print(error);
//         print(result.exception);
//         throw Exception(result.exception);
//       }
//       // } else if (result.data!['tokenAuth']['errors']['nonFieldErrors'][0]['message'] !=null){
//       //   err = result.data!['tokenAuth']['errors']['nonFieldErrors'][0]['message'];
//       //   print(err);
//       //   throw Exception(result.exception);
//       // }
//       // else {
//       //   print(result);
//       //   return true;
//       // }
//       print(result);
//       succ = result.data!['tokenAuth']['success'];
//       token = result.data!['tokenAuth']['token'];
//       err = result.data!['tokenAuth']['errors']['nonFieldErrors'][0]['message'];
//     }catch(error){
//       print(error);
//       return false;
//     }
//   }
//
//   late String link;
//   late String err;
//   late bool succ;
//   late String token;
//   late String otp;
//
//   Future resetLink({
//     required String email,
//   }) async {
//     try {
//       QueryResult result = await client.mutate(
//           MutationOptions(
//               fetchPolicy: FetchPolicy.noCache,
//               document: gql(
//                   '''
//              mutation{
//   sendPasswordResetEmail(email:"$email"){
//     errors
//     success
//   }
// }
//               '''
//               ),
//               variables: {
//                 'email': email,
//               }
//           )
//       );
//       if(result.hasException){
//         // final error = result.exception?.graphqlErrors[0];
//         // print(error);
//         print(result.exception);
//         throw Exception(result.exception);
//       }
//       else {
//         print('secces');
//         print(result);
//         link = result.data!['sendPasswordResetEmail']['errors']['token'];
//         otp = result.data!['sendPasswordResetEmail']['errors']['otp'];
//         // print('link: ${link}');
//         return true;
//       }
//     }catch(error){
//       print(error);
//       return false;
//     }
//   }
//
//
//   Future<QueryResult<Object?>> getUser() async {
//     final query = gql('''
//     query getuser{
//             me{
//                 username
//                 id
//                 email
//                 bio
//                 gender
//                 userType
//                 isVerified
//                 weight
//                 height
//                 postcode
//                 pk
//                 gender
//                 firstName
//                 lastName
//             }
//         }
//   ''');
//
//     final result = await client.query(QueryOptions(document: query));
//
//     if (result.hasException) {
//       throw result.exception!;
//     }
//     print(result);
//     // return result.data!['profile'];
//     return result;
//   }
//
//   Future resetPassword({
//     required String token,
//     required String newPassword1,
//     required String newPassword2,
//   }) async {
//     try {
//       QueryResult result = await client.mutate(
//           MutationOptions(
//               fetchPolicy: FetchPolicy.noCache,
//               document: gql(
//                   '''
//              mutation{
//   passwordReset(token:"$token",newPassword1:"$newPassword1",newPassword2:"$newPassword2"){
//     success
//     errors
//   }
// }
//               '''
//               ),
//               variables: {
//                 'token': token,
//                 'newPassword1': newPassword1,
//                 'newPassword2': newPassword2
//               }
//           )
//       );
//       if(result.hasException){
//         final error = result.exception?.graphqlErrors[0];
//         print(error);
//         throw Exception(result.exception);
//       }
//       else {
//         print('secces');
//         print(result);
//         return true;
//       }
//     }catch(error){
//       print(error);
//       return false;
//     }
//   }
// }