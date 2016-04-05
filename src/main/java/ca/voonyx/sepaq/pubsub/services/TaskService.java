package ca.voonyx.sepaq.pubsub.services;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import ca.voonyx.sepaq.pubsub.domain.Task;

@Service
public class TaskService {

    private static List<Task> tasks = new ArrayList<>();

    @Autowired
    private SimpMessagingTemplate template;

    @PostConstruct
    private void init() {
        // tasks.add(new Task("Sortir les vidanges"));
        // tasks.add(new Task("Acheter du pain"));
        // tasks.add(new Task("Faire la vaisselle"));
    }

    public List<Task> findAllTasks() {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        List<Task> taskFound = new ArrayList<>();
        for (Task t : tasks) {
            if (t.getOwner().equals(username)) {
                taskFound.add(t);
            }

        }
        return taskFound;
    }

    public void addTask(Task task) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        task.setOwner(username);
        tasks.add(task);
    }

    public void echo() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        template.convertAndSendToUser(name, "/queue/echo", "REFRESH");
    }

}
