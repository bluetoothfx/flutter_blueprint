import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blueprint/src/core/themes/spacing/spacing_constants.dart';
import 'package:flutter_blueprint/src/core/utils/context_extension.dart';

/*
Extended with Equatable for dropdown menu problem solution on hot reload.
For reference found solution at https://stackoverflow.com/a/62323672/1246639
*/
class Item extends Equatable{
  final int id;
  final String title;

  const Item({required this.id, required this.title});

  @override
  List<Object?> get props => [id, title];
}

extension ItemListExtentsion on List<Item> {
  int? getIdByTitle(String title) {
    int index = indexWhere((element) => element.title == title);
    return index == -1 ? null : this[index].id;
  }
}

class DropDownWidget extends StatefulWidget {
  final String title;
  final List<Item> items;
  final ValueChanged<Item> onSelected;
  final int? selectedId;

  const DropDownWidget({
    super.key,
    required this.title,
    required this.items,
    required this.onSelected,
    this.selectedId,
  });

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  late Item selectedValue;
  late List<Item> _items;

  @override
  void initState() {
    _items = List<Item>.from(widget.items);
    if (_items.isEmpty) {
      _items.add(const Item(id: 0, title: "All"));
    }
    int selectedWithId =
        _items.indexWhere((element) => element.id == widget.selectedId);
    selectedValue = selectedWithId > -1 ? _items[selectedWithId] : _items[0];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.title,
            style: context.textTheme.labelMedium,
          ),
        ),
        const SizedBox(height: AppSpacingConstants.md),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: context.themeData.disabledColor),
            borderRadius: const BorderRadius.all(Radius.circular(AppSpacingConstants.lg)),
          ),
          height: 48,
          child: DropdownButton<Item>(
            isExpanded: true,
            value: selectedValue,
            items: _items.map<DropdownMenuItem<Item>>((Item value) {
              return DropdownMenuItem<Item>(
                value: value,
                child: Container(
                  margin: const EdgeInsets.only(left: AppSpacingConstants.md),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    value.title,
                    style: context.textTheme.titleSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              );
            }).toList(),
            onChanged: (Item? value) {
              setState(() {
                if (value != null) {
                  selectedValue = value;
                  widget.onSelected(value);
                }
              });
            },
            underline: const SizedBox.shrink(),
            icon: const Padding(
              padding: EdgeInsets.symmetric(vertical: AppSpacingConstants.md),
              child: Icon(Icons.arrow_drop_down),
            ),
          ),
        )
      ],
    );
  }
}
