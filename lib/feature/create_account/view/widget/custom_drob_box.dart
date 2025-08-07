import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jomla_market/core/utils/colors/colors.dart';

class CustomApiDropDownTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String apiUrl;
  final Map<String, String>? queryParameters;
  final String idKey;
  final String nameKey;
  final Function(int id, String name) onItemSelected;
  final bool readOnly;

  const CustomApiDropDownTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.apiUrl,
    required this.onItemSelected,
    this.queryParameters,
    this.idKey = "id", // FIXED
    this.nameKey = "name_Ar", // FIXED
    this.readOnly = true,
  }) : super(key: key);

  @override
  State<CustomApiDropDownTextField> createState() =>
      _CustomApiDropDownTextFieldState();
}

class _CustomApiDropDownTextFieldState
    extends State<CustomApiDropDownTextField> {
  List<Map<String, dynamic>> _items = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    setState(() => _isLoading = true);
    try {
      final response = await Dio().get(
        widget.apiUrl,
        queryParameters: widget.queryParameters,
      );

      if (response.statusCode == 200 &&
          response.data["success"] == true && // FIXED
          mounted) {
        final List data = response.data["data"]; // FIXED
        _items = data
            .map<Map<String, dynamic>>(
              (item) => {
                "id": int.tryParse(item[widget.idKey].toString()),
                "name": item[widget.nameKey].toString(),
              },
            )
            .toList();
      }
    } catch (e) {
      debugPrint("Error fetching dropdown data: $e");
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showDropDownMenu() async {
    if (_isLoading) return;

    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);

    final selected = await showMenu<Map<String, dynamic>>(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy + renderBox.size.height,
        offset.dx + renderBox.size.width,
        offset.dy,
      ),
      items: _items
          .map(
            (item) => PopupMenuItem<Map<String, dynamic>>(
              value: item,
              child: Text(item['name']),
            ),
          )
          .toList(),
    );

    if (selected != null) {
      widget.controller.text = selected['name'];
      widget.onItemSelected(selected['id'], selected['name']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      readOnly: widget.readOnly,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(
            color: AppColors.borderColor,
            width: 1.5,
          ),
        ),
        hintText: widget.label,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        filled: true,
        fillColor: Colors.white,
        suffixIcon: _isLoading
            ? const Padding(
                padding: EdgeInsets.all(10.0),
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : IconButton(
                icon: const Icon(Icons.arrow_drop_down),
                onPressed: _items.isEmpty ? null : _showDropDownMenu,
              ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
