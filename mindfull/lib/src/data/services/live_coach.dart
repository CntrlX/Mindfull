import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

class coach {
  final model = OpenAI(apiKey: "");

  Future<String> checkNote (String content) async{
    
  final prompt = PromptValue.string('You are a life coach the user is writing a journal this is the journal content${content} give a helping and loving feedback to the user, make sure to make it small and compact and give ideas to improve ');
  final result = await model.invoke(prompt);
  return result.output;

  }
}