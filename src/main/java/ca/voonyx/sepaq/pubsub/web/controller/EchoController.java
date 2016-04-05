package ca.voonyx.sepaq.pubsub.web.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.stereotype.Controller;

@Controller
public class EchoController {

    @MessageMapping("/echo")
    @SendToUser
    public String echo() {
        return "ECHO";
    }

}
