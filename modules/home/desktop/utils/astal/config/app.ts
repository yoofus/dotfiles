import { App } from "astal/gtk3";
import { Bar, Desktop, Launcher } from "./widget";

App.start({
  icons: `${SRC}/icons`,
  main: () => {
    App.get_monitors().map(Bar); // initialize status bars
    App.get_monitors().map(Desktop);

    Launcher();
  },
  requestHandler(request: string, res: (response: any) => void) {
    if (request == "launcher") {
      App.toggle_window("launcher");
    }
  },
});
