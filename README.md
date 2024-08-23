# Sarvatra - IIT Tirupati Integrated App

A software system built on the Integrated App Ecosystem for the well-being of students, faculties, and visitors of IIT Tirupati.

## Overview

Our app solves a number of major problems faced by the day-to-day life of the students and staff of the institute. This documentation will explain each problem statement and the solutions we have come up with.

## Features

### **Login Screen**
The login screen is connected with Firebase authentication, allowing access to students and faculties using their email domains. There is also a Guest mode for visitors to access campus information.

1. **Sign In**
2. **Guest Mode**

### **Home Screen**
The home screen offers easy and convenient access to consolidated data at one place.

1. **Timetable** - Batch and Branch Specific
2. **Outlets** - All the outlets of IIT Tirupati with timings and menu
3. **What's on Campus?** - Event Calendar
4. **Live News Update** widget
5. **What's in the Mess?** - Live date integrated complete menu
6. **Menu Widget** - Updates timely to display the current menu
7. **ChatBot** - A friendly chatbot to enquire about Campus

### **Live News Updates**
The news widget on the home screen displays live news about what's currently happening on campus. From updates on new barricades to the Aravind Eye Hackathon and the new South Campus Cafeteria, all the news updates of the institute are easily conveyed to the people of IIT Tirupati.

### **Timetable**

**Problem:**
- In most cases, the CR of a respective course has to constantly send the following day’s timetable in the respective branch WhatsApp groups. Students require a more organized and regular source of information for their daily activities.
- Since most students don’t prepare their own timetables after reading the timetable on the website, it poses a huge problem in organizing their daily routines, which can hamper student productivity.
- There are also scenarios where extra classes will be conducted on certain days, and if students miss or forget to save this information, they lose out on their learning hours.

**Solution:**
- The Timetable page displays the student’s course itinerary for a particular day. With clever use of the DateTime library, the page automatically displays the student’s schedule for that particular day. Users can also view their schedules for the remaining days.
- The required data was acquired and hardcoded into the app through enormous efforts. Currently, the timetables for the 1st years, 2nd years, and 3rd-year chemical branch students can be easily accessed.
- The page also has a button leading to a menu page where a student can enter their year and branch, allowing them to view their respective timetables.
- The Timetable provides users with small yet valuable pieces of information, such as the current date as well as room numbers of the courses (barring electives).
- Students can also add new courses to their itinerary in the event of them taking up new electives. Users have also been given the option to edit or delete pre-existing courses from their schedules.

### **Bottom Navigation Bar**

### **Bus Schedule**

**Challenge:**
- It is always a tiring activity to keep ourselves updated with the newer bus schedules, downloading, and constantly checking the PDFs.
- Most of the time, we miss our buses, with a delay of just a few minutes.
- Most students prefer walking between key locations like the hostels and LHC, making a reliable solution to this challenge widely anticipated and highly favored.

**Solution:**
1. This feature displays the bus schedule dynamically updated in real-time, ensuring users know when the next bus departs from a particular landmark.
2. Students can find out the minutes until the particular bus departs.
3. LHC, Kedar Hostel, and Malhar Hostel are the primary bus stops. So, the users can select any of these landmarks as a source and destination to find out the intervals of the next bus's arrival and departure.
4. The backend leverages a nested map to efficiently manage bus routes, departure times, and locations, providing accurate and timely information at your fingertips.

### **Events Calendar**

**Challenge:**
- It’s inefficient and time-consuming to look up the academic calendar and see when the next series of exams or the next round of holidays are scheduled.
- Time management and organization are issues faced by students on a day-to-day basis. Having their club meetings, orientations, and important events marked on a calendar will greatly improve their productivity.

**Solution:**
1. Students can view the calendar and refer to the dates of future holidays and test schedules.
2. Students can also add their personalized events or tasks on any date. There is also a provision to delete the added events, made easier with a swipe to the right or left.

### **Campus Map**

**Problem:**
- There are multiple buildings in the vast campus of 548 acres spaced far from one another that freshers can easily get lost in.
- When family, friends, or relatives come to visit the campus, it’s hard to guide them to the proper location.
- There are rarely any maps around inside the campus.

**Solution:**
- Easy access to the Campus Map within the App, with easy navigation and interaction options.

### **Drawer**

The side navigation drawer consists of the following features:

1. **Club Activities** - Dedicated club detail page for each club.
2. **Medical Facility Page** - For all the health emergencies.
3. **Quick Links** - For easy access to all the links related to academics and administration.
4. **Contacts** - Quick access to all the important contacts in one place for easy access for freshers.
5. **Developers Page** - A little credit!
6. **Feedback** - To analyze and enhance the app.

### **Club Activities**

**Problem:**
- The clubs form the backbone of campus activities. However, many students, especially freshers, are not aware of the opportunities and purposes of these mini-organizations.
- Constantly checking emails for updates on club activities is inefficient. Having useful information readily available in one place would improve communication between students and the clubs.

**Solution:**
- The Club Activities Page provides detailed information about the campus’s clubs to the student community, especially 1st-year students. The page is meticulously organized to provide ease of access to information.
- Each club has its name and logo displayed on its page, along with a description of the club’s aims and objectives to improve the user’s understanding of the club.
- A gallery is created for each club to add photos of workshops, events, and special performances to increase their presence and improve the club’s awareness.
- The Club Projects menu lists out the current and previous projects that the club’s members are working on or have worked on.
- The Club Events page is designed to make it easier for users to keep track of the date and location of club events, workshops, and orientations. This system provides easier access to information as compared to constantly checking emails.
- The club heads can efficiently use this feature to provide regular updates on the club activities to the students.

### **Medical Facility Page**

**Problem:**
Students, faculty, and staff often struggle to quickly access critical medical information, such as hospital contacts, emergency numbers, and doctor availability schedules. Information is either scattered across different platforms or not readily accessible, leading to delays in obtaining necessary medical care. This lack of a centralized, easily accessible resource can cause confusion and inefficiencies, particularly during emergencies.

**Proposed Solution:**
- This page consolidates all medical facility information into a single, easily accessible platform. The app will feature a dedicated "Medical Facility" page, where users can quickly find contact information for nearby hospitals, emergency services, and the on-campus pharmacy.
- Additionally, it will provide a detailed doctor schedule, ensuring users know when and where specific medical professionals are available.
- The intuitive design will allow users to easily make calls directly from the app, enhancing accessibility and ensuring that critical information is always at their fingertips.

### **Contacts**

**Problem:**
Students, faculty, and staff at the institute often face difficulties in finding and accessing the contact information of various departments, administrative offices, and essential services within the campus.

**Proposed Solution:**
- A centralized "Contacts" page within the mobile application that houses a comprehensive directory of all essential contact information from the institute.
- The app will feature a search function and easy-to-use interface, enabling users to make direct calls with just a tap.

### **Feedback Page**

Collecting user feedback is crucial for the continuous improvement of the app. This feedback form has been integrated with Google Sheets API for efficient data collection and management. All responses will be automatically sent to a Google Sheet, providing a centralized and easily accessible database of user feedback.

### **Developers Page**

A little credit for the developers :)

- Links to the developers’ LinkedIn profiles

### **Animated Icons in the NavBar**

1. Animated icons matching the color palette add an attractive look to the UI.
2. Visually engaging icons reduce the static look of the app.

 ###  **OUTLETS:**
 
The Challenge:

●	In most cases, checking the menu items of a hotel requires us to physically visit the Restaurants to see what is offered in the menu.

●	else we have to travel distance to go another Restaurants to check the menu.

The Solution:

1.	This feature displays every item on the menu for every hotel nearby to our campus  in your mobile.
2.	you can sit in your room and go through the menus of all the nearby restaurants. And order what you crave

 ###  **QUICK LINKS:**
 
The Challenge:

1)	 It’s inefficient and time-consuming to look up the academic website, College ERP, College magazine etc .. 
2)	Time management and organisation are issues faced by students to find the ERP website, Collage magazine.

 Solution:

1.	To solve this problem, and make students’ life smoother, here is another feature of the Integrated IIT T app.
2.	Primarily, students can view the Institute Website, College ERP, Collage magazine. 
3.	, made easier with a swipe to the right or left.



## Contributions

### **Yamini Shree.B  CS21B056**
**Home Page**  
- Complete Frontend
- Backend
 
**News Widget**
- Backend
- Connecting to Firestore database for live updates
  
**Medical Page**
- Complete Frontend 
- Phone call feature
  
**Feed Back**
- Complete UI
- Backend
- Connecting to Google sheets API
- Animations
  
**Integration**
- Integration of the entire application 
- Correction of constant UI among all the components
- resolving dependencies and issues and bugs
- Organisation
  
**Outlets**
- UI
- Animation
  
**Mess widget**
- Date and time integration progamming
  
**Club Activities**
- template creation
  
**Bus Schedule**
- Animation
  
### **Jai Pradeep  CS23B024**
**Login Page**  
- Frontend
- Backend
- Animation
- Firebase Authentication
 
**Contacts page**
- Backend
- Frontend 
- Phone calling feature 

**Chat Bot**
- Backend 
- Frontend 
- Animations

**Home Page**
- Chat bot Button on home screen
  
**Mess Menu**
- Frontend 
- Backend
  
**Bus Schedule**
- Animations

**Deployment**
- Deploying into apk
- Resolving dependencies and Issues

**Integration**
- Resolving issues while integrating the app

### **Adithya Ananth  CS23B001**
**Time Table**
- Frontend
- Backend
- Data Collection and Organization
- Linking Time Table to real-world time
- Enabling addition, modification and deletion of courses.

**Club Activities Page**
- Frontend
- Backend
- Data Collection
- Enabling Horizontally Scrollable AppBar

### **Sudhanva Bharadwaj BM   CS23B051**
**Bus Schedule**
- Frontend
- Backend
- Linking the Bus Schedule to the real-world time

**Events Calendar Screen**
- Frontend
- Backend
- Data Collection
- Provision to add and delete personalized tasks/events

### **Srikar Vilas Donur CS23B049**

**Outlets Page**

- Frontend
- Backend
-  UI
- Animation
- Data Collection and Organization
- 
**Quick Links**
  
- Frontend
- Backend
-  UI
- Animation
- Data Collection and Organization

  **ClubActivities Page , timetable page, Title bars for home page , bus schedule page , maps page , contacts page, developers page,**

- changed colours, added shadows and a gradient,
  
- and changed the designs and colours of the icons.
  
- Updated the text styles of the title bar,
  
-  adding background colour for background, list title and buttons 
   
  ### **Koppala Stanycletus CS23B059** ###
  
**Campus map**

- Map
- Added place names to the Map
- Interaction options 

**Developers Page**

- UI
- Frontend
- Backend
- Expanded version of photos
- Clickable LinkedIn Links
- Animated Icons
  
**Navigation Bar**

- Animated Icons in the Navigation Bar
- Edited Colors
  
**News Widget**

- Sideway scrolling
- Clickable arrows for navigation
- Animated Scrolling
- Display page position with animation
  
**App Icon**

- Designed App Icon (Not updated yet)
  
**Other contributions**

- Assisted in searching for resources
