# Enhancing Urban Planning and Development through Public Transport Accessibility Analysis

**Team Members**
- Bernice Ong Hwee Yee
- Gao Yuchen
- Luo Xinming
- Tiffany Irene Prasetio

## 1. Project Description
This project is a group project under course code DSE3101. Our aim is to identify and analyze commuter hubs and public transport accessibility in Singapore to support urban planning and development. By leveraging data from the LTA DataMall, we will assess the density and distribution of transport services in relation to population centers, providing valuable insights for city planners and developers. 


## 2. Problem Statement
Urban planning and development in Singapore face challenges in optimizing public transport infrastructure to meet the needs of a growing population. This project will address the need for a data-driven approach to identify areas with high potential for development and to ensure that new developments are well-connected to the public transport network.
A city planner could use the data to identify areas with insufficient public transportation services which are measured  by connectivity matrix and plan new routes or improve existing ones. They can also estimate the projected economic benefits from cost savings for passengers, reduced congestion costs, and increased productivity to assess the investment viability. 
Real estate developers might analyze the data to determine potential locations for residential and commercial projects that would benefit from the proximity to transportation hubs.
 
## 3. Data Source
Our datasets will mainly come from LTA DataMall, which can be accessed via https://datamall.lta.gov.s g/content/datamall/en.html. The Land Transport Authority (LTA) spearheads land transport developments in Singapore, and we tap into their online data archive to obtain data on public transport from January 2022 to December 2023. 
An overview of the datasets that we plan to explore and analyze is as follows: 
| DATASET | DESCRIPTION |
| --- | --- |
| BUS ARRIVAL | Returns real-time Bus Arrival information of Bus Services at a queried Bus Stop, including Est. Arrival Time, Est. Current Location, Est. Current Load.|
| BUS SERVICES | Returns detailed service information for all buses currently in operation, including: first stop, last stop, peak / offpeak frequency of dispatch. |
| BUS ROUTES | Returns detailed route information for all services currently in operation, including: all bus stops along each route, first/last bus timings for each stop |
| BUS STOPS | Returns detailed information for all bus stops currently being serviced by buses, including: Bus Stop Code, location coordinates. |
| PASSENGER VOLUME BY BUS STOPS | Returns tap in and tap out passenger volume by weekdays and weekends for individual bus stop |
| PASSENGER VOLUME BY ORIGIN DESTINATION BUS STOPS | Returns number of trips by weekdays and weekends from origin to destination bus stops. |
| PASSENGER VOLUME BY ORIGIN DESTINATION TRAIN STATIONS | Returns number of trips by weekdays and weekends from origin to destination train stations |
| PASSENGER VOLUME BY TRAIN STATIONS | Returns tap in and tap out passenger volume by weekdays and weekends for individual train stations. |
| PLATFORM CROWD DENSITY REAL TIME | Returns real-time platform crowdedness level for the MRT/LRT stations of a particular train network line. |


## 4. Main Objectives
Analyze public transport availability and accessibility across different regions in Singapore and look for gaps in services provided currently with the aid of interactive visualization 
Identify factors that have significant weightage to improving connectivity eg. network density, service frequency, intermodal connectivity, travel time, reliability, etc 
Identify commuter hubs and areas with high development potential based on transport connectivity.
Provide recommendations for urban planning and development based on public transport accessibility.
Propose new routes or modifications to existing routes to improve coverage and reduce congestion.


## 5. Definition of Success
We will gauge the success of the project by checking whether each of the following points is completed. 
Completion of a comprehensive analysis of public transport availability and accessibility (buses and trains).
Construction of a viable index to reflect the connectivity between regions based on its transport links (e.g. the number of direct bus routes, frequency of buses per hour).
Identification of key commuter hubs and areas with high development potential.
Construction of an interactive map to visualize the connectivity index of different regions and congestion levels of main transport routes in Singapore across time of the day.
Development of actionable recommendations for urban planning and development.


## 6. Project Timeline
- Milestone 1 (Week 8-9): Data collection and preprocessing: Gather and clean data from LTA DataMall and other relevant sources. Logistics related to project planning. Complete the main part of backend analysis. 
- Milestone 2 (Week 10-11): Analysis and visualization: Analyze public transport data and create interactive visualizations to identify commuter hubs and areas with high development potential. Finalize the videos and submit them on Canvas. Prepare for the in-class presentation. Complete the main part of frontend analysis. 
- Milestone 3 (Week 12-13): In-class presentation. Review and complete the final report. 
