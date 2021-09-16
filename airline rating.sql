select * from airline_ratings
set ansi_warnings off


create view All_ratings_final as
(
select class as seat_class, "type of travel",
count(id) as number_of_passengers,
avg("flight distance") Avg_Flight_Distance,
avg([Departure/Arrival time convenient]) DA_time_rating,
avg("ease of online booking") Online_Booking_Rating,
avg("gate location") gate_location_rating,
avg("Food and drink") FnD_Rating,
avg("Seat Comfort") Seat_Comfort_Rating,
avg("Inflight entertainment") IFE_Rating,
avg("On-Board service") Onboard_Service_rating,
avg("Leg room service") LegRoom_Rating,
avg("Baggage Handling") Baggage_Handling_Rating,
avg("checkin service") checkin_rating,
avg("Inflight Service") inflight_service_rating,
avg("cleanliness") Cleanliness_rating,
avg("Departure delay in minutes") Avg_dep_delay,
avg("arrival delay in minutes") Avg_arr_delay
from airline_ratings
group by class, "type of travel"
--order by "type of travel","customer type"
)
-- flight dist between 0 and 2500kms

create view Flight_dist_0_2500 as
(
select class as seat_class, "type of travel", "customer type" as cust_type,
count(id) as number_of_passengers,
avg("flight distance") Avg_Flight_Distance,
avg([Departure/Arrival time convenient]) DA_time_rating,
avg("ease of online booking") Online_Booking_Rating,
avg("gate location") gate_location_rating,
avg("Food and drink") FnD_Rating,
avg("Seat Comfort") Seat_Comfort_Rating,
avg("Inflight entertainment") IFE_Rating,
avg("On-Board service") Onboard_Service_rating,
avg("Leg room service") LegRoom_Rating,
avg("Baggage Handling") Baggage_Handling_Rating,
avg("checkin service") checkin_rating,
avg("Inflight Service") inflight_service_rating,
avg("cleanliness") Cleanliness_rating,
avg("Departure delay in minutes") Avg_dep_delay,
avg("arrival delay in minutes") Avg_arr_delay
from airline_ratings

where "flight distance" between 0 and 2500
group by class, "type of travel","customer type")
--order by "type of travel","customer type"

-- grouping by gender

create view ratings_by_gender as
(
select class as seat_class, "type of travel", 
count(id) as number_of_passengers,
avg("flight distance") Avg_Flight_Distance,
--avg("departure/arrival time convinient") DA_time_rating,
avg("ease of online booking") Online_Booking_Rating,
avg("gate location") gate_location_rating,
avg("Food and drink") FnD_Rating,
avg("Seat Comfort") Seat_Comfort_Rating,
avg("Inflight entertainment") IFE_Rating,
avg("On-Board service") Onboard_Service_rating,
avg("Leg room service") LegRoom_Rating,
avg("Baggage Handling") Baggage_Handling_Rating,
avg("checkin service") checkin_rating,
avg("Inflight Service") inflight_service_rating,
avg("cleanliness") Cleanliness_rating,
avg("Departure delay in minutes") Avg_dep_delay,
avg("arrival delay in minutes") Avg_arr_delay
from airline_ratings
group by class, "type of travel",gender)

--age below 24 yrs

create view ratings_below_24 as
(
select class as seat_class, "type of travel", "customer type" as cust_type,
count(id) as number_of_passengers,
avg("flight distance") Avg_Flight_Distance,
--avg("departure/arrival time convinient") DA_time_rating,
avg("ease of online booking") Online_Booking_Rating,
avg("gate location") gate_location_rating,
avg("Food and drink") FnD_Rating,
avg("Seat Comfort") Seat_Comfort_Rating,
avg("Inflight entertainment") IFE_Rating,
avg("On-Board service") Onboard_Service_rating,
avg("Leg room service") LegRoom_Rating,
avg("Baggage Handling") Baggage_Handling_Rating,
avg("checkin service") checkin_rating,
avg("Inflight Service") inflight_service_rating,
avg("cleanliness") Cleanliness_rating,
avg("Departure delay in minutes") Avg_dep_delay,
avg("arrival delay in minutes") Avg_arr_delay
from airline_ratings
where age <= 24
group by class, "type of travel","customer type"
)
-- age between 24 and 39 yrs

create view ratings_below_24_and_39 as
(
select class as seat_class, "type of travel",
"customer type" as cust_type,
count(id) as number_of_passengers,
avg("flight distance") Avg_Flight_Distance,
--avg("departure/arrival time convinient") DA_time_rating,
avg("ease of online booking") Online_Booking_Rating,
avg("gate location") gate_location_rating,
avg("Food and drink") FnD_Rating,
avg("Seat Comfort") Seat_Comfort_Rating,
avg("Inflight entertainment") IFE_Rating,
avg("On-Board service") Onboard_Service_rating,
avg("Leg room service") LegRoom_Rating,
avg("Baggage Handling") Baggage_Handling_Rating,
avg("checkin service") checkin_rating,
avg("Inflight Service") inflight_service_rating,
avg("cleanliness") Cleanliness_rating,
avg("Departure delay in minutes") Avg_dep_delay,
avg("arrival delay in minutes") Avg_arr_delay
from airline_ratings
where age between 24 and 39
group by class, "type of travel","customer type"
)
-- age above 39 yrs

create view ratings_above_39 as (
select class as seat_class, "type of travel", "customer type" as cust_type,
count(id) as number_of_passengers,
avg("flight distance") Avg_Flight_Distance,
--avg("departure/arrival time convinient") DA_time_rating,
avg("ease of online booking") Online_Booking_Rating,
avg("gate location") gate_location_rating,
avg("Food and drink") FnD_Rating,
avg("Seat Comfort") Seat_Comfort_Rating,
avg("Inflight entertainment") IFE_Rating,
avg("On-Board service") Onboard_Service_rating,
avg("Leg room service") LegRoom_Rating,
avg("Baggage Handling") Baggage_Handling_Rating,
avg("checkin service") checkin_rating,
avg("Inflight Service") inflight_service_rating,
avg("cleanliness") Cleanliness_rating,
avg("Departure delay in minutes") Avg_dep_delay,
avg("arrival delay in minutes") Avg_arr_delay
from airline_ratings
where age >= 39
group by class, "type of travel","customer type"
)
order by "type of travel","customer type"

create view count_below_24 as
(
select count(id) as count, "class", "type of travel"
from airline_ratings
where age <= 24
group by   "class", "type of travel"
)

create view count_between_24_and_39 as
(
select count(id) as count, "class", "type of travel"
from airline_ratings
where age between 24 and 39
group by   "class", "type of travel"
)

create view count_above_39 as
(
select count(id) as count, "class", "type of travel"
from airline_ratings
where age > 39
group by   "class", "type of travel"
)

create view passengers_by_gender as
(
select count(id) as count, "class", "type of travel",gender
from airline_ratings
group by   "class", "type of travel", gender
)

create view passenger_bw_0_and_2500 as (
select count(id) as count,"type of travel"
from airline_ratings
where "flight distance" between 0 and 2500
group by "type of travel"
)
create view passenger_more_than_2500 as (
select count(id) as count,"type of travel"
from airline_ratings
where "flight distance" > 2500
group by "type of travel")

create view cust_type_vs_seat_type as 
(
select count(id) as count,"customer type","class"
from airline_ratings
where "customer type" = 'loyal customer'
group by "customer type","class"
)