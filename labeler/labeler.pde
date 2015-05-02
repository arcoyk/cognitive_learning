import processing.video.*;
Movie mov;
ArrayList labels = new ArrayList();
int start_flame = 0;
ArrayList<Trial> trials;

void setup() {
  mov = new Movie(this, "blackbird1.mov");
  size(640, 426);
  mov.play();
  mov.jump(0);
  
  //init
  fill(0);
  trials = g_trials(sketchPath("data/trials.json"));
}

int crr = 0;
void draw() {
  if (mov.available()) {
    mov.read();
    crr++;
  }
  image(mov, 0, 0);
  s_trials(trials, crr);
}

void keyPressed() {
  if (key == 's') {
    labels.add(0, "{ 'trials' : [");
    labels.add("] }");
    saveStrings(sketchPath("data/trials.json"), (String[])labels.toArray(new String[labels.size()]));
    exit();
  }else if(key == '0' || key == '1') {
    add_label("" + start_flame, "" + crr, "" + key);
    start_flame = crr;
  }
  println(key);
}

void add_label(String s, String e, String label) {
  String new_label = "{'start':" + s + ", 'end':" + e + ", 'label':" + label + "},";
  labels.add(new_label);
}
