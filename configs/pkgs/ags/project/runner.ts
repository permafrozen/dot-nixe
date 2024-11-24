import { App } from "astal/gtk3";
import style from "./style/runner.scss";
import Applauncher from "./widget/Runner";

App.start({
  css:
    `
        @define-color bg_transp alpha(@window_bg_color, 0.5);
    ` + style,
  instanceName: "runner",
  main: Applauncher,
});
