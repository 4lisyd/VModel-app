import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:riverpod/riverpod.dart';
import 'package:vmodel/src/core/api/user.dart';
import 'package:vmodel/src/core/cache/local_storage.dart';
import 'graphql_confiq.dart';


final graphqlClientProvider = Provider((ref) => GraphQlConfig().client()
);


final authProvider = StateNotifierProvider((ref) => AuthNotifier(ref.watch(graphqlClientProvider)));

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this._client) : super(AuthState());

  final GraphQLClient _client;

  Future register(String email, String password1, String username, String password2, String firstName, String lastName) async {
    state = state.copyWith(status: AuthStatus.loading);
    try {
      final result = await _client.mutate(MutationOptions(
        document: gql('''
          mutation Register(\$email: String!, \$password1: String!, \$password2: String!, \$username: String!, \$lastName: String!, \$firstName: String!) {
            register(email: \$email, password1: \$password1, password2: \$password2, username: \$username, lastName: \$lastName, firstName: \$firstName ) {
              success,
              token,
              errors,
            }
          }
        '''),
        variables: {
          'email': email,
          'password1': password1,
          'password2': password2,
          'username': username,
          'firstName': firstName,
          'lastName': lastName
        },
      ));
      final success = result.data!['register']['success'];
      final pk = result.data!['register']['pk'];
      final token = result.data!['register']['token'];
      final error = result.data!['register']['errors'];
      print(result);
      if(success == true) {
        state = state.copyWith(status: AuthStatus.authenticated);
      }else {
        state = state.copyWith(status: AuthStatus.unauthenticated);
      }
    } catch (e) {
      state = state.copyWith(status: AuthStatus.unauthenticated, error: e.toString());
    }
  }

  Future<void> login(String email, String password) async {
    state = state.copyWith(status: AuthStatus.loading);
    try {
      final result = await _client.mutate(MutationOptions(
        document: gql('''
          mutation TokenAuth(\$email: String!, \$password: String!) {
            tokenAuth(email: \$email, password: \$password) {
              success
              token
              errors
              user{
                username
                lastName
                firstName
                isActive
                bio
                id
                pk
               }
            }
          }
        '''),
        variables: {
          'email': email,
          'password': password,
        },
      ));
      final token = result.data!['tokenAuth']['token'] as String;
      final success = result.data!['tokenAuth']['success'];
      final error = result.data!['tokenAuth']['errors'];
      final firstName = result.data!['tokenAuth']['user']['firstName'];
      final lastName = result.data!['tokenAuth']['user']['lastName'];
      final username = result.data!['tokenAuth']['user']['username'];
      final pk = result.data!['tokenAuth']['user']['pk'];
      print(result);
      // if(success == )
      state = state.copyWith(status: AuthStatus.authenticated, token: token, pk: pk, );
    } catch (e) {
      state = state.copyWith(status: AuthStatus.unauthenticated, error: e.toString());
    }
  }

  Future<void> loginUsername(String username, String password) async {
    state = state.copyWith(status: AuthStatus.loading);
    try {
      final result = await _client.mutate(MutationOptions(
        document: gql('''
          mutation TokenAuth(\$username: String!, \$password: String!) {
            tokenAuth(username: \$username, password: \$password) {
              success
              token
              errors
              user{
                username
                lastName
                firstName
                isActive
                bio
                id
                pk
               }
            }
          }
        '''),
        variables: {
          'username': username,
          'password': password,
        },
      ));
      final token = result.data!['tokenAuth']['token'] as String;
      final success = result.data!['tokenAuth']['success'];
      final error = result.data!['tokenAuth']['errors'];
      final firstName = result.data!['tokenAuth']['user']['firstName'];
      final lastName = result.data!['tokenAuth']['user']['lastName'];
      final usename = result.data!['tokenAuth']['user']['username'];
      final pk = result.data!['tokenAuth']['user']['pk'];
      print(result);
      // if(success == )
      state = state.copyWith(status: AuthStatus.authenticated, token: token, pk: pk, );
    } catch (e) {
      state = state.copyWith(status: AuthStatus.unauthenticated, error: e.toString());
    }
  }

  Future pictureUpdate(int id,
      String content, String filename,
      ) async {
    state = state.copyWith(status: AuthStatus.loading);
    try {
      final result = await _client.mutate(MutationOptions(
        document: gql('''
        mutation updateuser(\$id: ID!, \$content: Binary, \$filename: String,){
  updateUser(input:{
    profilePicture:{
      content: \$content,
      filename:\$filename
    }
  },where:{
    id:{
      exact:\$id
    }
  }){
    ok
    errors{
      messages
      field
    }
    result{
    id
    profilePicture{filename}
    firstName
    lastName
    username
    }
  }
}
        '''),
        variables: {
          'content' : content,
          'id' : id,
          'filename': filename,

        },
      ));
      print(result);
      if(result.hasException){
        print(result.exception);
      }
      final picture = result.data!['updateUser']['result']['profilePicture']['filename'];
      // print(result);
      // final usename = result.data!['updateUser']['result']['username'];
      // final heght = result.data!['updateUser']['result']['height'];
      // final bio1 = result.data!['updateUser']['result']['bio'];
      // final weght = result.data!['updateUser']['result']['weight'];
      // final firstname = result.data!['updateUser']['result']['firstName'];
      // final lastname = result.data!['updateUser']['result']['lastName'];
      // final hairr = result.data!['updateUser']['result']['hair'];
      // final eyess = result.data!['updateUser']['result']['eyes'];
      // final chests = result.data!['updateUser']['result']['chest'];
      state = state.copyWith(profilePicture: picture);
    } catch (e) {
      state = state.copyWith(status: AuthStatus.unauthenticated, error: e.toString());
    }
  }



  Future userUpdate(int id,
      String bio, String height, String username, String firstName, String lastName, String weight, String hair, String eyes, String chest
      ) async {
    state = state.copyWith(status: AuthStatus.loading);
    try {
      final result = await _client.mutate(MutationOptions(
        document: gql('''
          mutation updateUser(\$id: ID!, \$bio: String, \$username:String, \$height: String, \$weight: String, \$firstName: String, \$lastName: String, \$hair: String, \$eyes:String, \$chest: String) {
  updateUser(input:{
    username: \$username,
    bio: \$bio,
    height: \$height,
    weight: \$weight,
    firstName: \$firstName,
    lastName: \$lastName,
    hair: \$hair,
    eyes: \$eyes,
    chest: \$chest
  },where:{
    id:{
      exact: \$id
    }
  }){
    ok
    errors{
      messages
      field
    }
    result{
      id
     username
    email
    bio
    gender
    userType
    isVerified
    weight
    height
    postcode
    gender
    firstName
    lastName
    chest
    hair
    eyes
    }
  }
}
        '''),
        variables: {
          'username' : username,
          'id' : id,
          'height': height,
          'bio': bio,
          'weight': weight,
          'firstName': firstName,
          'lastName': lastName,
          'hair': hair,
          'eyes': eyes,
          'chest': chest
        },
      ));
      print(result);
      if(result.hasException){
        print(result.exception);
      }
      final usename = result.data!['updateUser']['result']['username'];
      final heght = result.data!['updateUser']['result']['height'];
      final bio1 = result.data!['updateUser']['result']['bio'];
      final weght = result.data!['updateUser']['result']['weight'];
      final firstname = result.data!['updateUser']['result']['firstName'];
      final lastname = result.data!['updateUser']['result']['lastName'];
      final hairr = result.data!['updateUser']['result']['hair'];
      final eyess = result.data!['updateUser']['result']['eyes'];
      final chests = result.data!['updateUser']['result']['chest'];
      state = state.copyWith(username: usename, bio: bio1, height: heght, firstName: firstname, lastName: lastname, weight: weght, hair: hairr, chest: chests, eyes: eyess);
    } catch (e) {
      state = state.copyWith(status: AuthStatus.unauthenticated, error: e.toString());
    }
  }


  Future getUser(int userID) async {
    // final graphqlClient = ref.watch(graphqlClientProvider);
    try{
      final result = await _client.query(QueryOptions(
        document: gql('''
            query(\$userID: Int!){
  getUser(userID:\$userID){
    username
    id
    email
    bio
    gender
    userType
    isVerified
    weight
    height
    postcode
    gender
    firstName
    lastName
    chest
    hair
    eyes
    profilePicture{filename}
  }
}
    '''),
        variables: {'userID': userID},
        

        // context: {
        //   'headers': {
        //     'Authorization': 'Bearer ${state.token}',
        //   },
        // } as Context,
        // context: Context(
        //   headers: headers,
        // ),

        // context: {
        //   'headers': {'Authorization': 'Bearer ${state.token}'}
        // } ,
      ));
      if (result.hasException) {
        print(result);
        throw result.exception!;
      }
      print(result);
      final profile = result.data!['getUser'];
      state = state.copyWith(status: AuthStatus.authenticated,   username: profile['username'], lastName: profile['lastName'], firstName: profile['firstName'], height: profile['height'], bio: profile['bio'], profilePicture: profile['filename']);
    }catch(e){
      print(e);
    }
  }


  Future<void> logout() async {
    state = state.copyWith(status: AuthStatus.loading);
    try {
      // Send mutation to server to logout
      state = state.copyWith(status: AuthStatus.unauthenticated, token: null);
    } catch (e) {
      state = state.copyWith(status: AuthStatus.authenticated, error: e.toString());
    }
  }


  // Future resetPassword(String token, String newPassword1, String newPassword2) async {
  //   state = state.copyWith(status: AuthStatus.loading);
  //   try {
  //     final result = await _client.mutate(MutationOptions(
  //       document: gql('''
  //         mutation passwordReset(\$token: String!, \$newPassword1: String!, \$newPassword2) {
  //           passwordReset(token: \$token, newPassword1: \$newPassword1, newPassword2: \$newPassword2) {
  //             success
  //             errors
  //             }
  //         }
  //       '''),
  //         variables: {
  //               'token': token,
  //               'newPassword1': newPassword1,
  //               'newPassword2': newPassword2
  //             }
  //     ));
  //     // final token = result.data!['tokenAuth']['token'] as String;
  //     // final success = result.data!['tokenAuth']['success'];
  //     // final error = result.data!['tokenAuth']['errors'];
  //     // final firstName = result.data!['tokenAuth']['user']['firstName'];
  //     // final lastName = result.data!['tokenAuth']['user']['lastName'];
  //     // final username = result.data!['tokenAuth']['user']['username'];
  //           if(result.hasException){
  //       final error = result.exception?.graphqlErrors[0];
  //       print(error);
  //       throw Exception(result.exception);
  //     }
  //     else {
  //       print('secces');
  //       print(result);
  //       return true;
  //     }
  //     // if(success == )
  //     state = state.copyWith(status: AuthStatus.authenticated,);
  //   } catch (e) {
  //     state = state.copyWith(status: AuthStatus.unauthenticated, error: e.toString());
  //   }
  // }


  Future resetPassword({
    required String token,
    required String newPassword1,
    required String newPassword2,
  }) async {
    try {
      QueryResult result = await _client.mutate(
          MutationOptions(
              fetchPolicy: FetchPolicy.noCache,
              document: gql(
                  '''
             mutation{
  passwordReset(token:"$token",newPassword1:"$newPassword1",newPassword2:"$newPassword2"){
    success
    errors
  }
}
              '''
              ),
              variables: {
                'token': token,
                'newPassword1': newPassword1,
                'newPassword2': newPassword2
              }
          )
      );
      if(result.hasException){
        final error = result.exception?.graphqlErrors[0];
        print(error);
        throw Exception(result.exception);
      }
      else {
        print('secces');
        print(result);
        return true;
      }
    }catch(error){
      print(error);
      return false;
    }
  }

  Future<void> resetLink(String email) async {
    state = state.copyWith(status: AuthStatus.loading);
    try {
      final result = await _client.mutate(MutationOptions(
          document: gql('''
          mutation SendPasswordResetEmail(\$email: String!) {
            sendPasswordResetEmail(email: \$email) {
              errors
              success
            }
         }
        '''),
          variables: {
            'email': email
          }
      ));
      final token = result.data!['sendPasswordResetEmail']['errors']['token'] as String;
      // final success = result.data!['tokenAuth']['success'];
      final error = result.data!['sendPasswordResetEmail']['errors']['errors'];
      // final firstName = result.data!['tokenAuth']['user']['firstName'];
      // final lastName = result.data!['tokenAuth']['user']['lastName'];
      // final username = result.data!['tokenAuth']['user']['username'];
      final otp = result.data!['sendPasswordResetEmail']['errors']['otp'];
      print(result);
      // if(error != null){
        state = state.copyWith(status: AuthStatus.authenticated, token: token, otp: otp);
      // }else {
      //   state = state.copyWith(status: AuthStatus.unauthenticated,);
      // }
      // if(success childlock hack.com== )

    } catch (e) {
      state = state.copyWith(status: AuthStatus.unauthenticated, error: e.toString());
    }
  }
}



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

class AuthState {
  AuthState({
    this.status = AuthStatus.initial,
    this.token,
    this.error,
    this.firstName,
    this.lastName,
    this.username,
    this.otp,
    this.pk,
    this.height,
    this.bio,
    this.hair,
    this.eyes,
    this.chest,
    this.weight,
    this.profilePicture,
  });

  final AuthStatus status;
  final String? token;
  final String? error;
  final String? firstName;
  final String? otp;
  final String? lastName;
  final String? username;
  final int? pk;
  final String? height;
  final String? bio;
  final String? weight;
  final String? hair;
  final String? eyes;
  final String? chest;
  final String? profilePicture;

  AuthState copyWith({
    AuthStatus? status,
    String? token,
    String? error,
    String? username,
    String? lastName,
    String? otp,
    String? firstName,
    int? pk,
    String? height,
    String? bio,
    String? weight,
    String? hair,
    String? chest,
    String? eyes,
    String? profilePicture,
  }) {
    return AuthState(
      status: status ?? this.status,
      token: token ?? this.token,
      error: error ?? this.error,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      otp: otp ?? this.otp,
      lastName: lastName ?? this.lastName,
      pk: pk ?? this.pk,
      height: height ?? this.height,
      bio: bio ?? this.bio,
      weight: weight ?? this.weight,
      hair: hair ?? this.hair,
      chest: chest ?? this.chest,
      eyes: eyes ?? this.eyes,
      profilePicture: profilePicture ?? this.profilePicture
    );
  }
}

enum AuthStatus {
  initial,
  loading,
  authenticated,
  unauthenticated,
}
