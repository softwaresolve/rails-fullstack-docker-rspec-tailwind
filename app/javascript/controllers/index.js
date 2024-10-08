// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import App__ChartsController from "./app/charts_controller"
application.register("app--charts", App__ChartsController)

import App__DropdownController from "./app/dropdown_controller"
application.register("app--dropdown", App__DropdownController)

import App__GlobalsController from "./app/globals_controller"
application.register("app--globals", App__GlobalsController)

import App__ImagePreviewController from "./app/image_preview_controller"
application.register("app--image-preview", App__ImagePreviewController)

import App__InspectionsController from "./app/inspections_controller"
application.register("app--inspections", App__InspectionsController)

import App__SidebarController from "./app/sidebar_controller"
application.register("app--sidebar", App__SidebarController)

import ModalController from "./modal_controller"
application.register("modal", ModalController)
