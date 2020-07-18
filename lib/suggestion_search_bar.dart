library suggestion_search_bar;
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {

  final Icon prefixIcon , suffixIcon;
  final double suggestionWidgetHeight;
  final hintText;
  final List<String> suggestions;
  final Widget body;

  const SearchBar(
    {
      Key key, 
      @required this.prefixIcon, 
      @required this.suffixIcon,
      this.suggestionWidgetHeight = 60.0,
      this.hintText = "Search", 
      @required this.suggestions,
      @required this.body
    }
    ) : super(key: key
  );

  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  final List<Widget> body = [];

  int bodyIndex = 0;
  int actionIndex = 1;
  TextEditingController controller = TextEditingController();
  double suggestionHeight;


  Icon actionIcon;
  FocusNode myFocusNode;
  bool initialTap = false;
  static int count;

  @override
  void initState() { 
    super.initState();
    actionIcon = widget.suffixIcon;
    count = widget.suggestions.length;
    suggestionHeight = widget.suggestionWidgetHeight;
    myFocusNode = FocusNode();
    body.add(textBody());
    body.add(suggestion());
  }

  // This widget is for the initial body
  Widget textBody() {
    return widget.body;
  }

  // This widget is for the suggestions list
  Widget suggestion() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (context, index) => SizedBox(
        height: widget.suggestionWidgetHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top:18,bottom:18,left:30),
                child: Icon(Icons.search),
              ),
            ),
            Expanded(
              flex:3,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  widget.suggestions[index],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Expanded(
              flex:1,
              child: Padding(
                padding: const EdgeInsets.only(top:18,bottom:18,right:30),
                child: Icon(Icons.cancel,color: Colors.green,),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget searchBar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              focusNode: myFocusNode,
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                prefixIcon: widget.prefixIcon,
                hintText: widget.hintText,
                suffixIcon: IconButton(
                  icon: actionIcon,
                  onPressed: () {
                    print(actionIndex);
                    if(actionIndex == 0) {
                      actionIndex = 1;
                      actionIcon = widget.suffixIcon;
                      bodyIndex = 0;
                      controller.text = " ";
                      myFocusNode.unfocus();
                    } else {
                      
                      
                    }

                    setState(() {
                      
                    });
                  },
                ),
              ),
              onChanged: (String val) {
                if(val.length >= 0) {
                  print(0);
                  bodyIndex = 1;
                  actionIndex = 0;
                  actionIcon = Icon(Icons.cancel);
                  setState(() {
                    
                  });
                }
              },
              onTap: () {
                if(!initialTap) {
                  bodyIndex = 1;
                  actionIndex = 0;
                  initialTap = true;
                  actionIcon = Icon(Icons.cancel);
                  setState(() {
                    
                  });
                }
              },
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return SafeArea(
      child: Column(
        children: [
          searchBar(),
          Expanded(
            child: body[bodyIndex%2],
          )
        ],
      ),
    );
  }
}


