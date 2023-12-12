
 import 'package:allbasicwidget3/const.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_to_text.dart'
;
class TextToSpeech_And_SpeechToText extends StatefulWidget {
  const TextToSpeech_And_SpeechToText({super.key});

  @override
  State<TextToSpeech_And_SpeechToText> createState() => _TextToSpeech_And_SpeechToTextState();
}

class _TextToSpeech_And_SpeechToTextState extends State<TextToSpeech_And_SpeechToText> {

                 //speech to Text
  SpeechToText _speechToText=SpeechToText();
   var isLisening=false;
  String _text="Press the button and start Speking";
  double _confidance=1.0;
  final Map<String, HighlightedWord> _highlight={
    "flutter":HighlightedWord(
    onTap: () => print("flutter"),
  textStyle: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
    ),

  "voice":HighlightedWord(
  onTap: () => print("voice"),
  textStyle: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),
  ),

  "Subscribe":HighlightedWord(
  onTap: () => print("Subscribe"),
  textStyle: TextStyle(color: Colors.orangeAccent,fontWeight: FontWeight.bold),
  ),
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _speechToText=SpeechToText();
 initializeTTS_Fun();
    playPuse();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _flutterTts.stop();
  }

               //Text to Spech

  bool isSpeking=false;
TextEditingController _textEditingController=TextEditingController();
  FlutterTts _flutterTts=FlutterTts();

  void initializeTTS_Fun()async{
     _flutterTts.setStartHandler(() {
       setState(() {
         isSpeking=true;
       });
     });
     _flutterTts.setCompletionHandler(() {
       setState(() {
         isSpeking=false;
       });
     });
     _flutterTts.setErrorHandler((message) {
       setState(() {
         isSpeking=false;
       });
     });
  }
void speak()async{
    if(_textEditingController.text.isNotEmpty){
 await _flutterTts.speak(_textEditingController.text);
     }
}


void stop()async{
    await _flutterTts.stop();
}


                // audio player

bool isPlaying=false;
 late final AudioPlayer _player;
 late final AssetSource _path;

Duration _duration= Duration();
Duration _position= Duration();

Future initPlayerFun()async{
  _player=AudioPlayer();
  _path=AssetSource("assets/ukulele.mp3");
    //setCall back
  _player.onDurationChanged.listen((Duration d) {
    setState(() {_duration=d;});
  });
  _player.onPositionChanged.listen((Duration p) {
    setState(() {_position=p;});
  });

  _player.onPlayerComplete.listen((_) {
    setState(() {_position=_duration;});
  });
}
void playPuse()async{
  if(isPlaying){
    _player.pause();
    isPlaying=false;
  }else{
    _player.play(_path);
    isPlaying=true;
  }
  setState(() {});
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(backgroundColor: Colors.black,title: Text("Confideence: ${(_confidance*100.0).toStringAsFixed(1)}%",style: TextStyle(color: Colors.white),)),
      body: SingleChildScrollView(
        // reverse: true,
        child: Column(children: [

                // Speech to text

          Center(
            child: Container(

              child:  TextHighlight(
                  text: _text,
                  words: _highlight)
            ),
          ),

          AvatarGlow(
            glowColor: Theme.of(context).primaryColor,
            duration: Duration(milliseconds: 2000),
            repeatPauseDuration: Duration(milliseconds: 100),
            animate: isLisening,
            endRadius: 75.0,
            repeat: true,
            child:  GestureDetector(
                onTapDown: (details) async {
                 if(!isLisening){
                   bool _avalibale=await _speechToText.initialize();
                   if(_avalibale){
                    setState(() {
                      isLisening=true;
                      _speechToText.listen(
                        onResult: (result) {
                          setState(() {
                            _text=result.recognizedWords;
                          });
                        },
                      );
                    });
                   }
                 }

                  },
                onTapUp: (details) {
                  setState(() {
                    isLisening=false;
                  });
                  _speechToText.stop();
                  },
                child: CircleAvatar(
                  radius: 30,
                    backgroundColor: Colors.teal,
                    child: Icon(isLisening?Icons.mic:Icons.mic_none,color: Colors.white,size: 30,)))  ),

                //Text to Speech

          SizedBox(height: 15,),
          TextFormField(controller: _textEditingController,),
          SizedBox(height: 15,),
          FloatingActionButton(
            onPressed: () {
       isSpeking? stop():speak();
          },child: Text(isSpeking? "Stop":"Read")),
          SizedBox(height: 40,),

                //Audio Player
 Slider(value: _position.inSeconds.toDouble(),
     onChanged: (value) async{
       await _player.seek(Duration(seconds: value.toInt()));
       setState(() {});},
  min: 0,max: _duration.inSeconds.toDouble() ,

 ),
          SizedBox(height: 6,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              Text(_duration.format()),
            ],),
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
             _player.seek(Duration(seconds: _position.inSeconds - 10 ));

                  setState(() {});
                },
                child: Icon(Icons.arrow_circle_left_outlined,size: 50,)),
              InkWell(
                onTap: () {
                      playPuse();
                },
                child: isPlaying?Icon(Icons.pause,size: 60,):Icon(Icons.play_circle,color: Colors.red,size: 60,)),
            InkWell(
                onTap: () {
                  _player.seek(Duration(seconds: _position.inSeconds + 10));
                  setState(() {});
                },
                child: Icon(Icons.arrow_circle_right_outlined,size: 50,)),
          ],)
        ],
        ),
      ),
    );
  }

}
