// import 'package:app_ye_gestao_de_saude/models/consultas_model.dart';
// import 'package:app_ye_gestao_de_saude/pages/editar_consultas.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class InfoConsultas extends StatefulWidget {
//   const InfoConsultas({super.key});

//   @override
//   State<InfoConsultas> createState() => _InfoConsultasState();
// }

// class _InfoConsultasState extends State<InfoConsultas> {
//   late DateTime? _selectedDate;
//   final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');

//   @override
//   void initState() {
//     super.initState();
//     _selectedDate = null; // Inicializando _selectedDate com a data atual
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final ThemeData theme = Theme.of(context);
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate,
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//       builder: (BuildContext context, Widget? child) {
//         return Theme(
//           data: theme.copyWith(
//             // Personalize a cor de fundo da seleção aqui
//             colorScheme: theme.colorScheme.copyWith(
//               primary: const Color.fromARGB(
//                   220, 105, 126, 80), // Cor de fundo da seleção
//             ),
//           ),
//           child: child!,
//         );
//       },
//     );
//     if (picked != null && picked != _selectedDate) {
//       setState(() {
//         _selectedDate = picked;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: const Color.fromARGB(255, 245, 246, 241),
//         appBar: AppBar(
//           backgroundColor: const Color.fromARGB(255, 245, 246, 241),
//           automaticallyImplyLeading: false,
//           iconTheme: const IconThemeData(
//             color: Color.fromARGB(220, 105, 126, 80), // Define a cor do ícone
//           ),
//           leading: Padding(
//             padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
//             child: IconButton(
//               icon: const Icon(Icons.arrow_back),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ),
//           actions: [
//             PopupMenuButton(itemBuilder: (BuildContext context) {
//               return <PopupMenuEntry>[
//                 PopupMenuItem(
//                   child: Center(
//                     child: Text('Editar'),
//                   ),
//                   value: 'edit',
//                 ),
//                 PopupMenuItem(
//                   child: Center(
//                     child: Text('Deletar'),
//                   ),
//                   value: 'delete',
//                 )
//               ];
//             },
//             onSelected: (value) {
//               if (value == 'edit'){
//                 Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const EditarConsultas()),
//                           );
//               } else if (value == 'delete'){

//               }
//             },)
//           ],
//         ),
//         body: const SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.fromLTRB(70, 0, 70, 0),
//             child: Center(
//               child: Column(children: [
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Text(
//                   "Consultas realizadas",
//                   style: TextStyle(
//                     fontSize: 22,
//                     color: Color.fromARGB(220, 105, 126, 80),
//                     fontWeight: FontWeight.w900,
//                   ),
//                 ),
//                 Text(
//                   '${modeloConsultas.especialidade}',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Color.fromARGB(220, 105, 126, 80),
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       "Data:",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w500,
//                         color: Color.fromARGB(220, 105, 126, 80),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     SizedBox(
//                       height: 40,
//                       child: TextFormField(
//                         readOnly: true,
//                         onTap: () => _selectDate(context),
//                         controller: TextEditingController(
//                           text: _selectedDate != null
//                               ? _dateFormat.format(_selectedDate!)
//                               : '',
//                         ),
//                         decoration: InputDecoration(
//                           fillColor: const Color.fromARGB(255, 185, 196, 166),
//                           filled: true,
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(Radius.circular(15)),
//                           ),

//                           contentPadding:
//                               const EdgeInsets.fromLTRB(25, 0, 0, 0),
//                           labelStyle: const TextStyle(
//                               fontSize: 18,
//                               color: Color.fromARGB(255, 152, 152, 152)),
//                           //quando clica na label
//                           focusedBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Color.fromARGB(220, 105, 126,
//                                       80)), // Altere a cor da borda aqui
//                               borderRadius: BorderRadius.circular(18)),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Por favor, insira uma data';
//                           }
//                           return null;
//                         },
//                         keyboardType: TextInputType.datetime,
//                         onChanged: (value) {
//                           setState(() {
//                             _selectedDate = DateTime.tryParse(value);
//                           });
//                         },
//                       ),
//                     ),
//                     const SizedBox(height: 15),
//                     const Text(
//                       "Horário:",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w500,
//                         color: Color.fromARGB(220, 105, 126, 80),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     SizedBox(
//                       height: 40,
//                       child: TextFormField(
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Color.fromARGB(220, 105, 126,
//                                       80)), // Altere a cor da borda aqui

//                               borderRadius: BorderRadius.circular(18)),
//                           contentPadding:
//                               const EdgeInsets.fromLTRB(25, 0, 0, 0),
//                           labelStyle: const TextStyle(
//                               fontSize: 18,
//                               color: Color.fromARGB(255, 152, 152, 152)),
//                           //quando clica na label
//                           focusedBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Color.fromARGB(220, 105, 126,
//                                       80)), // Altere a cor da borda aqui
//                               borderRadius: BorderRadius.circular(18)),
//                         ),
//                         // validator: (value) {
//                         //   if (value == null || value.isEmpty) {
//                         //     return 'Por favor, insira sua glicemia';
//                         //   }
//                         //   return null;
//                         // },
//                         // onSaved: (value) {
//                         //   if (value != null) {
//                         //     _glicemia = value;
//                         //   }
//                         // },
//                       ),
//                     ),
//                     const SizedBox(height: 15),
//                     const Text(
//                       "Resumo da consulta:",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w500,
//                         color: Color.fromARGB(220, 105, 126, 80),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     SizedBox(
//                       height: 40,
//                       child: TextFormField(
//                         keyboardType: TextInputType.multiline,
//                         maxLines: null, // Permite várias linhas
//                         textAlignVertical: TextAlignVertical.top,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Color.fromARGB(220, 105, 126,
//                                       80)), // Altere a cor da borda aqui

//                               borderRadius: BorderRadius.circular(18)),
//                           contentPadding:
//                               const EdgeInsets.fromLTRB(25, 0, 0, 0),
//                           labelStyle: const TextStyle(
//                               fontSize: 18,
//                               color: Color.fromARGB(255, 152, 152, 152)),
//                           //quando clica na label
//                           focusedBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Color.fromARGB(220, 105, 126,
//                                       80)), // Altere a cor da borda aqui
//                               borderRadius: BorderRadius.circular(18)),
//                         ),
//                         // validator: (value) {
//                         //   if (value == null || value.isEmpty) {
//                         //     return 'Por favor, insira sua glicemia';
//                         //   }
//                         //   return null;
//                         // },
//                         // onSaved: (value) {
//                         //   if (value != null) {
//                         //     _glicemia = value;
//                         //   }
//                         // },
//                       ),
//                     ),
//                     const SizedBox(height: 15),
//                     const Text(
//                       "Retorno em:",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w500,
//                         color: Color.fromARGB(220, 105, 126, 80),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     SizedBox(
//                       height: 40,
//                       child: TextFormField(
//                         readOnly: true,
//                         onTap: () => _selectDate(context),
//                         controller: TextEditingController(
//                           text: _selectedDate != null
//                               ? _dateFormat.format(_selectedDate!)
//                               : '',
//                         ),
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Color.fromARGB(220, 105, 126,
//                                       80)), // Altere a cor da borda aqui

//                               borderRadius: BorderRadius.circular(18)),
//                           contentPadding:
//                               const EdgeInsets.fromLTRB(25, 0, 0, 0),
//                           labelStyle: const TextStyle(
//                               fontSize: 18,
//                               color: Color.fromARGB(255, 152, 152, 152)),
//                           //quando clica na label
//                           focusedBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Color.fromARGB(220, 105, 126,
//                                       80)), // Altere a cor da borda aqui
//                               borderRadius: BorderRadius.circular(18)),
//                         ),
//                         // validator: (value) {
//                         //   if (value == null || value.isEmpty) {
//                         //     return 'Por favor, insira sua glicemia';
//                         //   }
//                         //   return null;
//                         // },
//                         // onSaved: (value) {
//                         //   if (value != null) {
//                         //     _glicemia = value;
//                         //   }
//                         // },
//                       ),
//                     ),
//                     const SizedBox(height: 15),
//                     const Text(
//                       "Lembrete para agendamento:",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w500,
//                         color: Color.fromARGB(220, 105, 126, 80),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     SizedBox(
//                       height: 40,
//                       child: TextFormField(
//                         readOnly: true,
//                         onTap: () => _selectDate(context),
//                         controller: TextEditingController(
//                           text: _selectedDate != null
//                               ? _dateFormat.format(_selectedDate!)
//                               : '',
//                         ),
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Color.fromARGB(220, 105, 126,
//                                       80)), // Altere a cor da borda aqui

//                               borderRadius: BorderRadius.circular(18)),
//                           contentPadding:
//                               const EdgeInsets.fromLTRB(25, 0, 0, 0),
//                           labelStyle: const TextStyle(
//                               fontSize: 18,
//                               color: Color.fromARGB(255, 152, 152, 152)),
//                           //quando clica na label
//                           focusedBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Color.fromARGB(220, 105, 126,
//                                       80)), // Altere a cor da borda aqui
//                               borderRadius: BorderRadius.circular(18)),
//                         ),
//                         // validator: (value) {
//                         //   if (value == null || value.isEmpty) {
//                         //     return 'Por favor, insira sua glicemia';
//                         //   }
//                         //   return null;
//                         // },
//                         // onSaved: (value) {
//                         //   if (value != null) {
//                         //     _glicemia = value;
//                         //   }
//                         // },
//                       ),
//                     ),
//                   ],
//                 ),
//               ]),
//             ),
//           ),
//         ));
//   }
// }
