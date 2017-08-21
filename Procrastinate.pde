PFont f;
int hour = 0;
int minute = 0;
intro intro = new intro();
ArrayList <bar> bar = new ArrayList<bar>();

JSONObject data;
ArrayList<String> keys;
ArrayList<PImage> images = new ArrayList<PImage>();
int[] hours;
int[] minutes;
int[][] countArr = new int[24][60];

float AM = 0;
float PM = 0;

float angle = PI/2;
float increment = radians(.25);

float col;

void setup() {
  size(800, 900);
  background(125, 125, 125);
  f = createFont("HelveNueThin", 100);
  
  //Get Time Data
  data = loadJSONObject("output.json"); // JSON file from Flickr API
  keys = new ArrayList(data.keys()); 
  
  for (int i = 0; i < keys.size(); i++) {
    PImage img = loadImage(keys.get(i) + ".jpg");
    images.add(img); // Adds the image to the images ArrayList
  }
  hours = new int[images.size()];
  minutes = new int[images.size()]; 
  
  for(int i = 0; i < hours.length; i++) {
   JSONObject dateEntry = data.getJSONObject(keys.get(i)); // Get the JSON Object from the json file
   JSONArray timeArray = dateEntry.getJSONArray("time"); // Get the time array from the JSON object
   int hour1 = timeArray.getInt(3);
   int minute1 = timeArray.getInt(4);
   hours[i] = hour1;
   minutes[i] = minute1;
   
   if (hour1 < 12) {
     AM++;
   }else PM++;
   
   //count
     for (int hr = 0; hr < 24; hr++) {
       for (int min = 0; min < 60; min++) {
         if (hour1 == hr && minute1 == min) {
           countArr[hr][min] ++;
         }
       }
     }
   }
}

void draw() {
  tint(255, 126);
  intro.show();
  
  //Keys
  noStroke();
  fill(248, 242, 218);
  rect(25, 800, 20, 20);
  fill(255);
  textSize(15);
  text("Proportion of AM times", 145, 820);
  text("Proportion of PM times", 145, 870);
  fill(25, 25, 112);
  rect(25, 850, 20, 20);
  
  
  bar.add(new bar());
  for (bar barz: bar) {
    barz.show();
  }
  
  piechart(); //piechart
  
  //circle
  noStroke();
  fill(255);
  ellipse(width/2, height/2, 300, 300);
  
  //circle
  noStroke();
  fill(24, 24, 24);
  ellipse(width/2, height/2, 200, 200);
  
  //Time
  fill(#00A3F7);
  textSize(50);
  textAlign(CENTER);
  if (hour < 10 && minute < 10) {
    text("0" + hour + ":0" + minute, width/2, height/2 + 15); 
  }else if (hour < 10 && minute > 9) {
    text("0" + hour + ":" + minute, width/2, height/2 + 15); 
  }else if (hour > 9 && minute < 10) {
    text(hour + ":0" + minute, width/2, height/2 + 15);
  }else 
    text(hour + ":" + minute, width/2, height/2 + 15); 
    
  //Print count
  fill(255, 255, 255);
  textSize(59);
  text(countArr[hour][minute], 50, 75);
  textSize(15);
  text("photos were posted at this time!", 200, 75);
}

void keyPressed(KeyEvent e){
  bar.add(new bar());
  
  if(keyCode == UP){
    angle -= increment;
    if (minute == 59) {
      if (hour == 23) {
        hour = 0;
      }else {
        hour += 1;
      }
      minute = 0;
    }else 
      minute += 1; 
    
  }
  if (keyCode == DOWN) {
      angle += increment; 
     if (minute == 00) {
      if (hour == 0) {
        hour = 23;
      }else {
        hour -= 1;
      }
      minute = 59;
    }else 
      minute -= 1; 
  }
}

void piechart() {
  float radAM = (AM/hours.length) * 360;
  fill(25, 25, 112);
  noStroke();
  ellipse(width/2, height/2, 330, 330);
  fill(248, 242, 218);
  noStroke();
  arc(width/2, height/2, 330, 330, 3 * PI/2, (3 * PI/2) + radians(radAM));
 }
 