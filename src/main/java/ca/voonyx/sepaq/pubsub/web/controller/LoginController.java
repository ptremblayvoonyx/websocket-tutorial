package ca.voonyx.sepaq.pubsub.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

    @RequestMapping("/login")
    public String welcome() {
        return "login";
    }

}