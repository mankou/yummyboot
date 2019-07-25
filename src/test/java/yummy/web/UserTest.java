package yummy.web;

import org.junit.ClassRule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.rule.OutputCapture;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.junit4.SpringRunner;

import static org.assertj.core.api.Assertions.assertThat;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT, classes = App.class)
public class UserTest {

    @ClassRule
    public static OutputCapture out = new OutputCapture();

    @Autowired
    private TestRestTemplate restTemplate;

    @Test
    public void testInsert() {
        String output = this.out.toString();
        ResponseEntity<String> responseEntity = restTemplate.getForEntity("/user/insert", String.class);
        System.out.println(responseEntity.getBody());
        assertThat(output).contains("ok");
    }

}
