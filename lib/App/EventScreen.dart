import 'dart:convert';
import 'package:citieguide/CustomWidget/home_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../main.dart';
import 'EventDetailScreen.dart';
import 'SideBarScreen.dart';
import 'home_app_bar.dart';

class AppEventScreen extends StatefulWidget {
  final String imagePath;
  final String countryName;
  final int cityId;

  AppEventScreen({
    required this.imagePath,
    required this.countryName,
    required this.cityId,
  });

  @override
  _AppEventScreenState createState() => _AppEventScreenState();
}

class _AppEventScreenState extends State<AppEventScreen> {
  List<dynamic> events = []; // List to hold fetched events
  List<dynamic> filteredEvents = []; // List to hold filtered events
  TextEditingController searchController = TextEditingController();
  bool isSearchVisible = false;
  bool isLoading = true; // Track if events are being loaded

  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    final url =
        '${Url}/app/fetch_event.php?city_id=${widget.cityId}'; // Adjust URL according to your API endpoint

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        setState(() {
          events = json.decode(response.body);
          filteredEvents = events; // Initialize filteredEvents with all events initially
          isLoading = false; // Set loading to false when events are fetched
        });
      } else {
        throw Exception('Failed to load events');
      }
    } catch (e) {
      print('Error fetching events: $e');
      setState(() {
        isLoading = false; // Set loading to false on error
      });
      // Handle error as needed
    }
  }

  void filterEvents(String query) {
    setState(() {
      filteredEvents = events
          .where((event) =>
          event['name'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void toggleSearchVisibility() {
    setState(() {
      isSearchVisible = !isSearchVisible;
      if (!isSearchVisible) {
        // Reset filter when closing search
        filteredEvents = events;
        searchController.clear();
      }
    });
  }

  void showNoEventsToast() {
    Fluttertoast.showToast(
      msg: "No events found",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(isSearchVisible ? 140.0 : 90.0),
        child: Column(
          children: [
            HomeAppBar(onSearchTap: toggleSearchVisibility),
            if (isSearchVisible)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: searchController,
                  onChanged: filterEvents,
                  decoration: InputDecoration(
                    hintText: 'Search events...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      drawer: Sidebar(userName: '', userEmail: ''),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.imagePath),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    '${widget.countryName} Events',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : filteredEvents.isEmpty
                    ? Center(
                  child: ElevatedButton(
                    onPressed: () {
                      fetchEvents(); // Retry fetching events
                    },
                    child: Text('No events found. '),
                  ),
                )
                    : ListView.builder(
                  itemCount: filteredEvents.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  EventDetailScreen(
                                    eventName: filteredEvents[index]
                                    ['name'],
                                    eventImagePath:
                                    "${Url}/upload/${filteredEvents[index]['image_path']}",
                                    eventDescription:
                                    filteredEvents[index]
                                    ['description'],
                                  ),
                            ),
                          );
                        },
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(
                                "${Url}/upload/${filteredEvents[index]['image_path']}",
                              ),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.1),
                                BlendMode.srcOver,
                              ),
                            ),
                          ),
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      filteredEvents[index]['name'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 18,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          filteredEvents[index]
                                          ['rating']
                                              .toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight:
                                            FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.bookmark_border_outlined,
                                color: Colors.white,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: HomeBottomBar(),
    );
  }
}
