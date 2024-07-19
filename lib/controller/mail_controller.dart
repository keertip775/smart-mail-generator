import 'package:dio/dio.dart';

class MailController {
  Future<String> generatEmail(String text) async {
    Dio dio = Dio();
    var response = await dio
        .post('https://api-free-gpt.vercel.app/', data: {"input": text});
    return response.data['output'];
  }
}
