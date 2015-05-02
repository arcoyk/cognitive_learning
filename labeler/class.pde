class Trial {
  Trial() {
  }
  Trial(int s, int e, int l) {
    start = s;
    end = e;
    label = l;
  }
  int start, end, label;
}

class Bar {
  Bar() {
  }
  Bar(ArrayList<Trial> trials) {
    for(Trial t : trials) {
      start = start > t.start ? t.start : start;
      end = end < t.end ? t.end : end;
    }
  }
  int start, end;
  void show(ArrayList<Trial> trials, int crr) {
    PVector left = new PVector(width / 9, 20);
    PVector right = new PVector(width / 9 * 8, 20);
    strokeWeight(4);
    for(Trial t : trials) {
      if(get_label(trials, t.start) == 1) {
        stroke(0, 255, 0, 200);
      }else {
        stroke(100, 100, 100, 200);
      }
      line(f2bar(t.start, left, right), left.y, f2bar(t.end, left, right), left.y);
    }
    stroke(0);
    strokeWeight(10);
    point(f2bar(crr, left, right) , 20);
  }
  
  float f2bar(int f, PVector left, PVector right) {
    return map(f, start, end, left.x, right.x);
  }
}

ArrayList<Trial> g_trials(String json_file) {
  JSONObject json_o = loadJSONObject(json_file);
  JSONArray json_array = json_o.getJSONArray("trials");
  ArrayList<Trial> trials = new ArrayList<Trial>();
  for (int i = 0; i < json_array.size(); i++) {
    JSONObject t = json_array.getJSONObject(i);
    Trial new_trial = new Trial(t.getInt("start"),
                                t.getInt("end"),
                                t.getInt("label"));
    trials.add(new_trial);
  }
  return trials;
}

void s_trials(ArrayList<Trial> trials, int f) {
  text("" + get_label(trials, f), 10, 10);
}

int get_label(ArrayList<Trial> trials, int f) {
  for (Trial trial : trials) {
    if ( trial.start <= f && f <= trial.end) {
      return trial.label;
    }
  }
  return -1;
}
