import 'package:flutter/material.dart';
import 'package:ruby_text/ruby_text.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(64),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: RubyText(
                      [
                        RubyTextData(
                          'でいごの',
                        ),
                        RubyTextData(
                          '花',
                          ruby: 'はな',
                        ),
                        RubyTextData(
                          'が',
                        ),
                        RubyTextData(
                          '咲',
                          ruby: 'さ',
                        ),
                        RubyTextData(
                          'き',
                        ),
                        RubyTextData(
                          '、',
                        ),
                        RubyTextData(
                          '風',
                          ruby: 'かぜ',
                        ),
                        RubyTextData(
                          'を',
                        ),
                        RubyTextData(
                          '呼',
                          ruby: 'よ',
                        ),
                        RubyTextData(
                          'び',
                        ),
                        RubyTextData(
                          '、',
                        ),
                        RubyTextData(
                          '嵐',
                          ruby: 'あらし',
                        ),
                        RubyTextData(
                          'が',
                        ),
                        RubyTextData(
                          '来',
                          ruby: 'き',
                        ),
                        RubyTextData(
                          'た',
                        ),
                        RubyTextData(
                          '呼',
                          ruby: 'よ',
                        ),
                        RubyTextData(
                          '、',
                        ),
                        RubyTextData(
                          'でいごが',
                        ),
                        RubyTextData(
                          '咲',
                          ruby: 'さ',
                        ),
                        RubyTextData(
                          'き',
                        ),
                        RubyTextData(
                          '乱',
                          ruby: 'みだ',
                        ),
                        RubyTextData(
                          'れ',
                        ),
                        RubyTextData(
                          '、',
                        ),
                        RubyTextData(
                          '嵐',
                          ruby: 'あらし',
                        ),
                        RubyTextData(
                          'が',
                        ),
                        RubyTextData(
                          '来',
                          ruby: 'き',
                        ),
                        RubyTextData(
                          'た。',
                        ),
                      ],
                    ),
                  ),
                  TextWithRuby(text:'645年、;中臣鎌足:なかとみのかまたり;と共に、;蘇我氏:そがし;を倒した人物は（　　　）である',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextWithRuby extends StatelessWidget {
  late final List<String> words;
  final TextStyle? style;
  final TextAlign? textAlign;
  TextWithRuby({required String text, this.style, this.textAlign}) {
    words = text.split(';');
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(children:[RubyText(
      _buildRubyText(),
      style: style,
      textAlign: textAlign,
    )],);
  }

  List<RubyTextData> _buildRubyText() {
    List<RubyTextData> l = [];
    const String TOKEN = ':';
    for (String word in words) {
      if (word.indexOf(TOKEN) != -1) {
        List<String> w = word.split(TOKEN);
        l.add(RubyTextData(w[0], ruby: w[1]));
      } else {
        l.add(RubyTextData(word));
      }
/*
        if(word.length > 4) {
          List<String> str = splitStringByLength(word, 2);
          for(String s in str) {
            l.add(RubyTextData(s));
          }
        }
        else{
          l.add(RubyTextData(word));
        }
      }

 */
    }
    return l;
  }
}

List<String> splitStringByLength(String str, int length) =>
    [str.substring(0, length), str.substring(length)];
