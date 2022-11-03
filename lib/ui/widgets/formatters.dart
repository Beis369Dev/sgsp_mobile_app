import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

//*********Formatter config******

var dateFormatter = MaskTextInputFormatter(
    mask: '##/##/##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy);

var hourFormatter = MaskTextInputFormatter(
    mask: '##:##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy);

var ci_Formatter = MaskTextInputFormatter(
    mask: '#.###.###-#',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy);
