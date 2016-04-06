package ca.voonyx.sepaq.pubsub.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ca.voonyx.sepaq.pubsub.domain.Task;
import ca.voonyx.sepaq.pubsub.services.TaskService;

@Controller
@RequestMapping("/todo")
public class TodoController {

    @Autowired
    TaskService taskService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model) {

        model.addAttribute("tasks", taskService.findAllTasks());
        model.addAttribute("task", new Task());
        return "todo/list";

    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(@ModelAttribute("task") Task task, BindingResult bindingResult, Model model) {
        if (task != null && !task.getName().isEmpty()) {
            taskService.addTask(task);
        }
        taskService.echo();
        return "redirect:list";
    }

    @RequestMapping(value = "/echo", method = RequestMethod.GET)
    public String echo(Model model) {
        model.addAttribute("tasks", taskService.findAllTasks());
        return "todo/echo";
    }

}
