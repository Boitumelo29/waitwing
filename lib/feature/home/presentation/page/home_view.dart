import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:waitwing/common_widgets/widgets/buttons/calender_view_button.dart';
import 'package:waitwing/common_widgets/widgets/buttons/long_button.dart';
import 'package:waitwing/common_widgets/widgets/containers/icons_container.dart';
import 'package:waitwing/common_widgets/widgets/textfield/textfields.dart';
import 'package:waitwing/core/extenstions/localization_extensions.dart';
import 'package:waitwing/core/extenstions/theme_extensions.dart';
import 'package:waitwing/feature/home/bloc/home_bloc.dart';
import 'package:waitwing/feature/home/data_source/appointment_data_source.dart';
import 'package:waitwing/utils/validation/validation.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController titleController = TextEditingController();
  final List<Appointment> _appointments = [];
  late CalendarController _calendarController;
  CalendarView _currentView = CalendarView.day;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
    _calendarController.view = _currentView;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: _listener,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title:  Text(context.loc.home),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    CalendarViewButton(
                      onTap: () {
                        context.read<HomeBloc>().add(
                            SetCalenderStatus(status: CalendarViewStatus.day));
                      },
                      title: "D",
                      selected: state.calendarStatus == CalendarViewStatus.day,
                    ),
                    CalendarViewButton(
                      onTap: () {
                        context.read<HomeBloc>().add(
                            SetCalenderStatus(status: CalendarViewStatus.week));
                      },
                      title: "W",
                      selected: state.calendarStatus == CalendarViewStatus.week,
                    ),
                    CalendarViewButton(
                      onTap: () {
                        context.read<HomeBloc>().add(SetCalenderStatus(
                            status: CalendarViewStatus.month));
                      },
                      title: "M",
                      selected:
                          state.calendarStatus == CalendarViewStatus.month,
                    ),
                  ],
                ),
              )
            ],
          ),
          body: SfCalendar(
            controller: _calendarController,
            view: _currentView,
            dataSource: AppointmentDataSource(_appointments),
            allowDragAndDrop: true,
            onTap: (CalendarTapDetails details) {
              if (details.appointments != null &&
                  details.appointments!.isNotEmpty) {
                final appt = details.appointments!.first as Appointment;
                detailsBottomSheetModal(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Tapped: ${appt.subject}")),
                );
              }
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => showBottomSheetModal(context),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  void showBottomSheetModal(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    TimeOfDay startTime = const TimeOfDay(hour: 9, minute: 0);
    TimeOfDay endTime = const TimeOfDay(hour: 10, minute: 0);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: SizedBox(
            height: 420,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 10),
                Text(context.loc.addTask,
                    style: context.textTheme.bodyMedium),
                const SizedBox(height: 20),
                SizedBox(
                  width: 335,
                  child: LongTextFieldForm(
                    isRed: true,
                    hintText: titleController.text,
                    labelText: context.loc.enterTask,
                    prefixIcon: Icons.pending_actions,
                    controller: titleController,
                    validator: (value) => Validation.textValidation(value),
                    onChanged: (_) {},
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconsContainer(
                      onPressed: () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime.now()
                              .subtract(const Duration(days: 365)),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)),
                        );
                        if (pickedDate != null) selectedDate = pickedDate;
                      },
                      title: context.loc.date,
                      icon: Icons.date_range,
                    ),
                    IconsContainer(
                      onPressed: () {},
                      title: context.loc.taskType,
                      icon: Icons.task,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconsContainer(
                      onPressed: () async {
                        final picked = await showTimePicker(
                          context: context,
                          initialTime: startTime,
                        );
                        if (picked != null) startTime = picked;
                      },
                      title:context.loc.start,
                      icon: Icons.timelapse,
                    ),
                    IconsContainer(
                      onPressed: () async {
                        final picked = await showTimePicker(
                          context: context,
                          initialTime: endTime,
                        );
                        if (picked != null) endTime = picked;
                      },
                      title: context.loc.end,
                      icon: Icons.timer,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 335,
                  child: LongButton(
                    onTap: () {
                      final eventTitle = titleController.text.trim();
                      if (eventTitle.isEmpty) return;

                      final startDateTime = DateTime(
                        selectedDate.year,
                        selectedDate.month,
                        selectedDate.day,
                        startTime.hour,
                        startTime.minute,
                      );
                      final endDateTime = DateTime(
                        selectedDate.year,
                        selectedDate.month,
                        selectedDate.day,
                        endTime.hour,
                        endTime.minute,
                      );

                      setState(() {
                        _appointments.add(
                          Appointment(
                            subject: eventTitle,
                            startTime: startDateTime,
                            endTime: endDateTime,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        );
                      });

                      Navigator.pop(context);
                      titleController.clear();
                    },
                    title: context
                        .loc.save, // Replace with "Save" if not localized
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void detailsBottomSheetModal(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    TimeOfDay startTime = const TimeOfDay(hour: 9, minute: 0);
    TimeOfDay endTime = const TimeOfDay(hour: 10, minute: 0);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: SizedBox(
            height: 420,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 10),
                Text(context.loc.editTask,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                const SizedBox(height: 20),
                SizedBox(
                  width: 335,
                  child: LongTextFieldForm(
                    isRed: true,
                    hintText: context.loc.task,
                    labelText: context.loc.task,
                    prefixIcon: Icons.pending_actions,
                    controller: titleController,
                    validator: (value) => Validation.textValidation(value),
                    onChanged: (_) {},
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconsContainer(
                      onPressed: () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime.now()
                              .subtract(const Duration(days: 365)),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)),
                        );
                        if (pickedDate != null) selectedDate = pickedDate;
                      },
                      title: context.loc.date,
                      icon: Icons.date_range,
                    ),
                    IconsContainer(
                      onPressed: () {},
                      title: context.loc.taskType,
                      icon: Icons.task,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconsContainer(
                      onPressed: () async {
                        final picked = await showTimePicker(
                          context: context,
                          initialTime: startTime,
                        );
                        if (picked != null) startTime = picked;
                      },
                      title: context.loc.start,
                      icon: Icons.timelapse,
                    ),
                    IconsContainer(
                      onPressed: () async {
                        final picked = await showTimePicker(
                          context: context,
                          initialTime: endTime,
                        );
                        if (picked != null) endTime = picked;
                      },
                      title: context.loc.end,
                      icon: Icons.timer,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 335,
                  child: LongButton(
                    onTap: () {
                      final eventTitle = titleController.text.trim();
                      if (eventTitle.isEmpty) return;

                      final startDateTime = DateTime(
                        selectedDate.year,
                        selectedDate.month,
                        selectedDate.day,
                        startTime.hour,
                        startTime.minute,
                      );
                      final endDateTime = DateTime(
                        selectedDate.year,
                        selectedDate.month,
                        selectedDate.day,
                        endTime.hour,
                        endTime.minute,
                      );

                      setState(() {
                        _appointments.add(
                          Appointment(
                            subject: eventTitle,
                            startTime: startDateTime,
                            endTime: endDateTime,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        );
                      });

                      Navigator.pop(context);
                      titleController.clear();
                    },
                    title: context
                        .loc.save, // Replace with "Save" if not localized
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _listener(BuildContext context, HomeState state) {
    if (state.calendarStatus == CalendarViewStatus.day) {
      setState(() {
        _currentView = CalendarView.day;
        _calendarController.view = _currentView;
      });
    } else if (state.calendarStatus == CalendarViewStatus.week) {
      setState(() {
        _currentView = CalendarView.week;
        _calendarController.view = _currentView;
      });
    } else {
      setState(() {
        _currentView = CalendarView.month;
        _calendarController.view = _currentView;
      });
    }
  }
}


