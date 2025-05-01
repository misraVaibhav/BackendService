package club.krafts.BackendService.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FirstController {

    @GetMapping("/")
    public String home() {
        return "Hello from Vaibhav!";
    }

    @GetMapping("/health")
    public String healthCheck() {
        return "App is healthy!";
    }
}
