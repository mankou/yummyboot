package yummy.boot;

import org.junit.Test;

public class SqlTest {
    @Test
    public void test(){
        System.out.println("Preparing: SELECT * FROM tb_user t WHERE name = ? ");
        System.out.println("Parameters: 张三(String)");
    }
}
