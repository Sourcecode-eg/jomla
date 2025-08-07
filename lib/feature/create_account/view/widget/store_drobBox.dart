// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:second/feature/create_account/cubit/create_account_cubit.dart';
// import 'package:second/feature/create_account/cubit/create_account_state.dart';
// class StoreTypeDropdown extends StatefulWidget {
//   final TextEditingController controller;

//   const StoreTypeDropdown({super.key, required this.controller});

//   @override
//   State<StoreTypeDropdown> createState() => _StoreTypeDropdownState();
// }

// class _StoreTypeDropdownState extends State<StoreTypeDropdown> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CreateAccountCubit, CreateAccountState>(
//       builder: (context, state) {
//         final cubit = context.read<CreateAccountCubit>();

//         return GestureDetector(
//           onTap: () async {
//             await cubit.getAllStoreTypes();

//             final currentState = cubit.state;
//             if (currentState is GetStoreTypesSuccess) {
//               final types = currentState.types;

//               showModalBottomSheet(
//                 context: context,
//                 builder: (ctx) => ListView.separated(
//                   itemCount: types.length,
//                   separatorBuilder: (_, __) => const Divider(),
//                   itemBuilder: (_, index) {
//                     final type = types[index];
//                     return ListTile(
//                       title: Text(type['name']),
//                       onTap: () {
//                         widget.controller.text = type['name'];
//                         cubit.selectedStoreTypeId = type['id'];
//                         Navigator.pop(context);
//                       },
//                     );
//                   },
//                 ),
//               );
//             } else if (currentState is GetStoreTypesFailure) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text(currentState.message)),
//               );
//             }
//           },
//           child: AbsorbPointer(
//             child: TextFormField(
//               controller: widget.controller,
//               decoration: const InputDecoration(
//                 labelText: 'نوع المتجر',
//                 suffixIcon: Icon(Icons.store),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
