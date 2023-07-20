import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'traning_cubit/cubit/traning_case_cubit.dart';
import 'traning_cubit/cubit/traning_case_state.dart';

class MyFilterBar extends StatelessWidget {
  const MyFilterBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TraningCaseCubit, TraningCaseState>(
      builder: (context, state) {
        var cubit = context.read<TraningCaseCubit>();
        return Scaffold(
          appBar: AppBar(
            title: const Text('Filter Bar'),
          ),
          body: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  height: 50, // set a fixed height for the container
                  child: Row(
                    children: cubit.filters
                        .asMap()
                        .entries
                        .map(
                          (entry) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: GestureDetector(
                              onTap: () => cubit.onFilterSelected(entry.key),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8.0),
                                decoration: BoxDecoration(
                                  color: cubit.selectedIndex == entry.key
                                      ? Colors.red
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Text(
                                  entry.value,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Selected Filter: ${cubit.selectedFilterName}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  cubit.selectedFilterName.isEmpty
                      ? 'No filter selected'
                      : 'You selected ${cubit.selectedFilterName} filter',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                obscureText: cubit.isPassword,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: InkWell(
                    onTap: () => cubit.passwordChange(),
                    child: cubit.isPassword
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(20, (index) {
                      final value = 'Option ${index + 1}';
                      return RadioListTile(
                        title: Text(value),
                        value: value,
                        groupValue: cubit.selectedValue,
                        onChanged: (value) => cubit.handelRadio(value!),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
