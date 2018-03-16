# LMC2700-Data-Portrait
Data visualization that uses Flickr's API of students' photos. It shows the quantity of photos posted during each time of the day.

For the data, I used the complete set of the JSON output file that was given to us. I focused on the time aspect of 
the photos. I was interested in figuring out the users who procrastinated with the assignment by looking at who 
posted closer to the deadline and at later times. I wanted to filter the data by user, to how many times they posted 
on each day, to the specific times they posted. However, the task seemed overwhelming, so I just focused on the 
time. I believe I took a scientific approach in terms of visualizing the data. I wanted to perceive the data in a 
different way to gain more insight on why people posted when they did.  
 
Use: Press the up or down arrow to navigate through time. A line will be shown that represents how many photos 
were posted during that certain time. 
 
Overview: The overview of the data is simply represented by the white circle which indicates 100%. The blue and 
tan circle extends that as the tan color represents the proportion of photos posted in the AM, as blue indicates the 
proportion of photos posted in the PM. 
 
Clock: The clock increments by one using either up or down button using if statements. 
 
Retrieval: I gathered the info in a similar way to the examples given to us in class by storing the hours and minutes 
of each photo object in an array.  
 
Calculating count of photos at certain time: As each information of an image was extracted, I used a for loop to 
compare the time of the image to each minute of the day. If they equaled, I would increase the count of that 
certain time which is stored in a 2D array. 
 
Bars around circle: I used a formula I found on the internet to draw line at a certain angle. I incremented the angle 
each time you pressed up or down. The line would be scaled according to the count of each time. 
