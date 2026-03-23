package examples.users;

import com.intuit.karate.junit5.Karate;

public class UsersRunner {
    @Karate.Test
    Karate getUser() {
        return Karate.run("users").relativeTo(getClass());
    }
}
