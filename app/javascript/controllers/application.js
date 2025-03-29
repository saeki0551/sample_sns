import { Application } from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";

// コントローラの設定
const application = Application.start();

// コントローラの定義をロード
const context = require.context("controllers", true, /.js$/);
application.load(definitionsFromContext(context));
