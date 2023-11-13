import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Util {
  static MaskTextInputFormatter maskCep(String text) {
    return MaskTextInputFormatter(
      mask: "#####-###",
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );
  }

  static MaskTextInputFormatter maskPhone(String text) {
    return MaskTextInputFormatter(
      mask: "(##) #####-####",
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );
  }
}
