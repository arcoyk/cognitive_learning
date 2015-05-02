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
