package net.hrkac.counting.web;

import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WelcomeController {
    
    private static final long ONE_MINUTE_IN_MILLIS = 60000;

    @Value("${application.message}")
    private String message;

    @RequestMapping("/")
    public String welcome(Map<String, Object> model) {
        model.put("time", new Date());
        model.put("message", this.message);
        model.put("dohvatStartTimeInLong", addMinutesToDate(1, new Date()));
        return "welcome";
    }

    @RequestMapping("/foo")
    public String foo(Map<String, Object> model) {
        throw new RuntimeException("Foo");
    }
    
    private static Date addMinutesToDate(int minutes, Date beforeTime){
        return new Date(beforeTime.getTime() + (minutes * ONE_MINUTE_IN_MILLIS));
    }
    
}
