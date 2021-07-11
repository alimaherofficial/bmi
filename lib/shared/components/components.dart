import 'package:bmi/modules/news_app/web_view/web_view.dart';
import 'package:bmi/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

Widget defaultBotton({
  @required function,
  // ignore: invalid_required_named_param
  @required double width = double.infinity,
  // ignore: invalid_required_named_param
  @required String text = '',
  Color color = Colors.blue,
  double? height,
}) {
  return Container(
    width: width,
    color: color,
    child: MaterialButton(
      onPressed: function,
      height: height,
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
}

Widget defaultformfield({
  @required TextEditingController? controller,
  @required TextInputType? type,
  // ignore: invalid_required_named_param
  @required vlidate,
  @required String? label,
  @required IconData? prefix,
  onSubmit,
  // ignore: non_constant_identifier_names
  Color BorderSidecolor = Colors.black,
  Color prefixColor = Colors.black,
  ontap,
  onChange,
  bool enable = true,
  IconData? suffix,
  bool ispassword = false,
  suffixiconbotton,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: type,
    onFieldSubmitted: onSubmit,
    onChanged: onChange,
    onTap: ontap,
    validator: vlidate,
    obscureText: ispassword,
    enabled: enable,
    decoration: InputDecoration(
      labelText: label,

      prefixIcon: Icon(
        prefix,
        color: prefixColor,
      ),
      border: const OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: BorderSidecolor,
        ),
      ),
      // suffixIcon: suffix != null ? Icon(suffix) : null,
      suffixIcon: IconButton(
        onPressed: suffixiconbotton,
        icon: Icon(suffix),
      ),
    ),
  );
}

Widget buildTaskItem(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      onDismissed: (direction) {
        AppCubit.get(context).deleteData(id: model['id']);
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          // ignore: prefer_const_literals_to_create_immutables

          children: [
            CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 45.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${model['date']}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,

                crossAxisAlignment: CrossAxisAlignment.start,

                // ignore: prefer_const_literals_to_create_immutables

                children: [
                  Text(
                    '${model['title']}',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${model['time']}',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context).updateData(
                  status: 'done',
                  id: model['id'],
                );
              },
              icon: const Icon(Icons.check_box_rounded),
              color: Colors.green,
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context).updateData(
                  status: 'archived',
                  id: model['id'],
                );
              },
              icon: const Icon(Icons.archive_rounded),
              color: Colors.black45,
            ),
          ],
        ),
      ),
    );

Widget buildArticalItem(artical, context) {
  return InkWell(
    onTap: () {
      navigateTo(context, WebViewScreen(artical['url']));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage('${artical['urlToImage']}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            // ignore: sized_box_for_whitespace
            child: Container(
              height: 100.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Expanded(
                    child: Text(
                      '${artical['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${artical['publishedAt']}',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget separetorBreak() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

Widget articaleBuilder(list, context, {isSearch = false}) => Conditional.single(
      context: context,
      conditionBuilder: (BuildContext context) => list.isNotEmpty,
      widgetBuilder: (BuildContext context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticalItem(list[index], context),
        separatorBuilder: (context, index) => separetorBreak(),
        itemCount: 10,
      ),
      fallbackBuilder: (BuildContext context) => isSearch
          ? Container()
          : const Center(child: CircularProgressIndicator()),
    );

navigateTo(context, Widget widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );







// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   String dropdownValue = 'One';

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       value: dropdownValue,
//       icon: const Icon(Icons.arrow_downward),
//       iconSize: 24,
//       elevation: 16,
//       style: const TextStyle(color: Colors.deepPurple),
//       underline: Container(
//         height: 2,
//         color: Colors.deepPurpleAccent,
//       ),
//       onChanged: (String? newValue) {
//         setState(() {
//           dropdownValue = newValue!;
//         });
//       },
//       items: <String>['One', 'Two', 'Free', 'Four']
//           .map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
// }










