import processing.video.*;
Movie mov;
ArrayList labels = new ArrayList();
int start_flame = 0;

void setup() {
  mov = new Movie(this, "blackbird1.mov");
  size(640, 426);
  mov.play();
  mov.jump(0);
}

int crr = 0;
void draw() {
  if (mov.available()) {
    mov.read();
    crr++;
  }
  image(mov, 0, 0);
}

void keyPressed() {
  if (key == 's') {
    String[] label_arr = new String[labels.size()];
    for(int i = 0; i < labels.size(); i++) {
      label_arr[i] = (String)labels.get(i);
    }
    saveStrings("label.json", label_arr);
    exit();
  }else if(key == 't' || key == 'f') {
    add_label("" + start_flame, "" + crr, "" + key);
    start_flame = crr;
  }
  println(key);
}

void add_label(String s, String e, String label) {
  String new_label = "{'start':" + s + ", 'end':" + e + ", 'label':" + label + "}";
  labels.add(new_label);
}

